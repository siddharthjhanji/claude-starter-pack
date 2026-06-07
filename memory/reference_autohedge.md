---
name: autohedge
description: "The-Swarm-Corporation/AutoHedge — autonomous Solana crypto trading bot. NOT installed; not a Claude Code skill. Architecture pattern (Director→Sentiment→Quant→Risk→Execution) was abstracted into custom skill `trading-multi-agent-architecture` for use with the personal swing-trading bot project."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# AutoHedge (Swarms Corp)

Repo: https://github.com/The-Swarm-Corporation/AutoHedge
**Not installed.** Standalone Python package (`pip install autohedge`), not a Claude Code skill.

## What it is

- Autonomous crypto trading bot for Solana (Coinbase coming)
- Built on the `swarms` framework by Swarms Corp (kyegomez)
- Multi-agent: Director (GPT-4.1) → handoffs to Sentiment (GPT-4o-mini) / Quant / Risk / Execution
- Jupiter API for Solana DEX, Exa search tool for sentiment

## Why not installed

1. **Not a Claude skill** — Python package, not SKILL.md
2. **Doesn't match user's setup** — user trades equities (US/HK/China) with alert-only Telegram + manual Futu execution per [[project_trading_bot]]; AutoHedge is fully autonomous Solana crypto
3. **Source caution** — Swarms Corp / kyegomez has a controversial reputation in the AI community (concerns about marketing claims, code quality, and the maintainer's track record). Not recommended for real money use as-is.

## What WAS taken

The architecture pattern was abstracted into a custom Claude Code skill:

→ **`trading-multi-agent-architecture`** ([[trading-multi-agent-architecture]])

The skill teaches the Director→Sentiment→Quant→Risk→Execution decomposition with:
- Provider-agnostic prompts (Claude or any LLM, not tied to OpenAI/swarms framework)
- Structured I/O contracts per agent (JSON schemas)
- Reference implementation using the Claude Agent SDK
- Direct mapping to the user's existing swing-trading bot project

## Architectural insights worth remembering

| Pattern | Why it matters |
|---|---|
| `max_loops=1` per specialist | Forces focused, deterministic outputs — no recursive thinking |
| Director discovers tickers from task (no hardcoded list) | Orchestration layer doesn't own market knowledge |
| Sentiment + Quant in parallel | Independent dimensions; running serial wastes time |
| Structured handoff prompts (`Stock: {}, Thesis: {}, Quant: {}`) | Each agent gets exactly what it needs — no context bloat |
| Datetime injected into every system prompt | Models don't know "now" — always tell them |
| Execution agent never decides go/no-go | Risk gates; Execution just translates intent into order spec |
| `handoffs=[ALL_AGENTS]` wiring | Single-line orchestration in swarms framework |

## When this memory matters

- User asks about multi-agent trading systems
- User wants to refactor their bot ([[project_trading_bot]])
- User asks about AutoHedge specifically
- User considers Swarms Corp / kyegomez libraries (flag the reputation caution)
