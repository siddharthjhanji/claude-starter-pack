---
name: trading-multi-agent-architecture
description: Design a multi-agent decomposition for any trading/investment decision system using the Director→Sentiment→Quant→Risk→Execution pattern. Use when building or refactoring a swing-trading bot, signal-generation pipeline, screener-to-execution flow, or any system where the user wants separate concerns for thesis, technicals, risk sizing, and order generation. Provider-agnostic (works with Claude/OpenAI/local LLMs). Produces agent system prompts, structured I/O contracts, and the orchestration layer. Pairs with chart-patterns, position-sizer, breakout-trade-planner.
---

# Trading Multi-Agent Architecture

Design and implement the **Director → Sentiment → Quant → Risk → Execution** decomposition for any trading-decision system. Pattern abstracted from AutoHedge (Swarms Corp) but provider-agnostic — works with Claude, OpenAI, local LLMs, or any agent framework that supports tool-use + handoffs.

## When to trigger

User wants to build OR refactor any of:
- Swing-trading bot (equities, crypto, FX) with multiple analytical dimensions
- Signal-generation pipeline that needs separate concerns
- Screener → thesis → sized-order workflow
- Any decision system where "thesis" + "data" + "risk" + "execution" should be independent loops

For your **personal trading bot project** (per `project_trading_bot.md`): swing trades on US/HK/China, alert-only via Telegram, manual Futu execution, Python + Next.js PWA monorepo, 10% take-profit + DCA. This pattern fits directly — Director sets the thesis, Sentiment + Quant produce evidence, Risk sizes the position, Execution generates the order that becomes the Telegram alert.

## The pattern (5 specialists + 1 orchestrator)

```
        ┌─────────────────┐
        │ Director Agent  │   ← receives task, picks tickers, sets thesis
        └────────┬────────┘
                 │ handoffs
   ┌─────────────┼─────────────┬─────────────┐
   ▼             ▼             ▼             ▼
┌──────┐    ┌───────┐     ┌──────┐     ┌──────────┐
│Sent. │    │ Quant │     │ Risk │     │Execution │
└──────┘    └───────┘     └──────┘     └──────────┘
  ↑            ↑              ↑              ↑
 news        TA + vol     position size   order params
sentiment    trend       drawdown        entry/stop/TP
themes       key levels  exposure        TIF
```

Each specialist is **single-loop** (`max_loops=1` in swarms/swarm-pattern parlance, or one tool-use turn in Claude). No recursive thinking — focused, deterministic, structured output.

## Hard rules baked in

1. **Single responsibility per agent.** Sentiment ≠ Quant ≠ Risk. Don't merge.
2. **Structured I/O contracts** (Pydantic or JSON schema). Each agent emits a known shape. No free-form prose between agents.
3. **Director picks tickers from the task** — no hardcoded watchlists. The orchestration layer should not own market knowledge.
4. **Sentiment runs in parallel with Quant**, not sequentially — they're independent dimensions.
5. **Risk gates Execution.** Execution agent never sees the raw thesis; it only sees the risk-approved parameters.
6. **Datetime injected into every system prompt.** All agents share "now" — never trust the model's internal sense of time.
7. **Alert-only vs auto-execute is an orchestration decision, not an agent decision.** Execution agent always produces an order spec; whether it's *sent* is determined outside.
8. **One LLM family per pipeline.** Mixing Claude + GPT-4 for cost reasons introduces inconsistency in JSON formatting and tool calling. Pick one and stick to it.

## Agent specs (the actual prompts)

### Director (thesis + ticker discovery + orchestration)
```
You are a Trading Director. Given a task, you:
1. Identify which tickers are relevant (no predefined list — infer from task)
2. Produce a concise market thesis per ticker (position, expected trend, timeframe)
3. Specify the key fundamental and technical factors that would prove/disprove the thesis
4. Hand off to Sentiment, Quant, and Risk agents in parallel
5. Synthesize their outputs into a final go/no-go decision per ticker

OUTPUT:
{
  "tickers": [string],
  "theses": {
    "<ticker>": {
      "direction": "long" | "short",
      "timeframe": "intraday" | "swing" | "position",
      "core_thesis": string,
      "factors_for": [string],
      "factors_against": [string],
      "invalidation_level": float
    }
  }
}

Current date and time: <inject at runtime>
```

### Sentiment (news + social + institutional)
```
You are a Financial Sentiment Analyst. For each ticker, produce:
- News sentiment (mainstream financial media): 0-1 score + 3 key themes
- Social sentiment (Reddit, X, StockTwits): 0-1 score + retail trend direction
- Institutional sentiment (analyst notes): 0-1 score
- Trend: "improving" | "deteriorating" | "stable" vs last 7 days
- Contrarian signal: bool (true if sentiment extreme enough to fade)

Use tool: <web search or news API>
Do NOT analyze price/volume — that's the Quant's job.
Single loop. No recursion. JSON output only.
```

### Quant (technicals + statistics)
```
You are a Quantitative Analyst. For each ticker (from the Director's thesis), produce:
{
  "ticker": str,
  "technical_score": float,         # 0-1, aggregate of TA indicators
  "volume_score": float,            # 0-1, relative volume + participation
  "trend_strength": float,          # 0-1, ADX-style measure
  "volatility": float,              # ATR or stdev, raw value
  "probability_score": float,       # 0-1, prob thesis plays out per historical setup
  "key_levels": {
    "support": float,
    "resistance": float,
    "pivot": float
  }
}

Use the thesis from the Director as your hypothesis to test, not to confirm.
Do NOT discuss sentiment. Do NOT size positions. JSON only.
```

### Risk (sizing + drawdown + exposure)
```
You are a Risk Manager. Given ticker + thesis + quant analysis, produce:
{
  "recommended_position_size_pct": float,   # % of portfolio
  "max_drawdown_pct": float,                # worst-case for this trade
  "market_risk_exposure": "low" | "medium" | "high",
  "correlation_with_existing": float,       # 0-1, vs other open positions
  "overall_risk_score": float,              # 0-1, lower = safer
  "recommendation": "approve" | "approve_smaller" | "reject",
  "rejection_reason": string | null
}

If recommendation is "reject", the Execution agent will not be called.
Use Kelly criterion / fixed-fractional / ATR-based sizing — your choice, but cite which.
```

### Execution (order spec only — does NOT send)
```
You are a Trade Execution Specialist. Given ticker + thesis + risk-approved parameters, produce:
{
  "ticker": str,
  "side": "buy" | "sell" | "short" | "cover",
  "order_type": "market" | "limit" | "stop_limit",
  "quantity": int,                  # shares/contracts
  "entry_price": float,             # or null for market
  "stop_loss": float,               # required
  "take_profit": float | [float],   # single or laddered
  "time_in_force": "day" | "gtc" | "ioc",
  "valid_until": "<ISO 8601>",
  "alert_only": bool                # orchestrator decides true/false
}

Do NOT decide if this trade is good — that's already approved.
Do NOT modify the size — that's already set by Risk.
Just translate intent into precise order spec.
```

## Reference implementation (Claude Agent SDK, not AutoHedge)

```python
import anthropic
from anthropic import Anthropic
import json
from datetime import datetime, timezone

client = Anthropic()
NOW = datetime.now(timezone.utc).isoformat()

def call_agent(name: str, system: str, user: str, model="claude-sonnet-4-6", json_output=True):
    msg = client.messages.create(
        model=model,
        max_tokens=2000,
        system=system + f"\n\nCurrent UTC datetime: {NOW}",
        messages=[{"role": "user", "content": user}],
    )
    text = msg.content[0].text
    return json.loads(text) if json_output else text

def run_pipeline(task: str, portfolio_state: dict, alert_only=True):
    # 1. Director picks tickers + theses
    director_out = call_agent("director", DIRECTOR_PROMPT, task)

    results = {}
    for ticker, thesis in director_out["theses"].items():
        # 2. Sentiment + Quant in parallel (use asyncio in production)
        sentiment = call_agent("sentiment", SENTIMENT_PROMPT, json.dumps({"ticker": ticker}))
        quant = call_agent("quant", QUANT_PROMPT, json.dumps({"ticker": ticker, "thesis": thesis}))

        # 3. Risk decides go/no-go and size
        risk = call_agent("risk", RISK_PROMPT, json.dumps({
            "ticker": ticker, "thesis": thesis, "quant": quant,
            "portfolio": portfolio_state
        }))

        if risk["recommendation"] == "reject":
            results[ticker] = {"status": "rejected", "reason": risk["rejection_reason"]}
            continue

        # 4. Execution turns approved trade into order spec
        order = call_agent("execution", EXECUTION_PROMPT, json.dumps({
            "ticker": ticker, "thesis": thesis, "risk": risk
        }))
        order["alert_only"] = alert_only
        results[ticker] = {"status": "approved", "order": order,
                          "sentiment": sentiment, "quant": quant, "risk": risk}

    return results
```

## How to apply to your existing trading bot

Per `project_trading_bot.md`: your bot does swing on US/HK/China, Telegram alerts, manual Futu, 10% take-profit + DCA.

**Refactor map:**
| Existing role | Becomes |
|---|---|
| Whatever generates the signal | **Director** + **Quant** (Director sets thesis, Quant scores TA) |
| Whatever decides to alert | **Risk** (with `alert_only=True` always at execution layer) |
| Telegram message format | **Execution** agent output → format wrapper |
| DCA logic | **Risk** agent's `recommendation: "approve_smaller"` path |
| 10% take-profit | **Execution** agent's `take_profit` field, set by Risk |

**What you gain:**
- Each agent is independently testable (mock Quant output, verify Risk's response)
- Sentiment becomes a first-class signal you can backtest separately
- The Director's thesis is auditable — every alert has a written rationale
- Swapping LLM providers (Claude ↔ GPT-4 ↔ local Llama) is a one-line config change
- Alert-only vs auto-execute is a flag at the orchestrator level — no agent rewrites if you ever go fully autonomous

## Cross-skill workflow

```
[[chart-patterns]] (Kirkpatrick CMT)    → Quant agent's TA rule source
[[position-sizer]]                       → Risk agent's sizing math
[[breakout-trade-planner]]               → Execution agent's order template
[[statistical-analyst]]                  → Quant agent's probability_score backtest
[[signal-postmortem]]                    → Continuous improvement of all 5 agents
trading-multi-agent-architecture (this)  → How they all wire together
```

## When NOT to use this pattern

- **Single, simple signal** — if your bot is "RSI < 30, alert me," 5 agents is overkill
- **Latency-critical HFT** — LLM round-trips are too slow; this is for swing/position trading
- **Pre-LLM systems** — fine, but you're rewriting; consider if it's worth it
- **You don't have a backtest** — agents that can't be backtested produce false confidence. Test the **outputs** of each agent against historical data before going live

## Important caution

The source repo (Swarms Corp / AutoHedge) has a controversial reputation in the AI community — questions about marketing claims, code quality, and the maintainer's track record. **This skill abstracts the ARCHITECTURE PATTERN, not the implementation.** Do not pip install autohedge for real money. If you want a clean implementation, build it yourself using the Claude Agent SDK or LangGraph from these specs.
