# Reference Tools — Python libraries worth knowing about

Tools that aren't Claude skills (so they can't be loaded via `Skill`) but are
useful to remember when working on the IM8 dashboard / marketing-analytics
surface. Each entry below tells the next agent **what the tool is good for**,
**what it's not**, and **the concrete situations where reaching for it is the
right call** in this codebase.

---

## Scrapling — stealth web scraping
**Repo:** https://github.com/D4Vinci/Scrapling

- **What it is:** Python 3.10+ scraping library with a Playwright-based
  stealth fetcher that handles Cloudflare / Akamai bot challenges out of the
  box, plus an adaptive parser that re-locates elements when sites push
  layout changes.
- **Install (clean Python ≥3.11 venv):**
  ```bash
  python3.11 -m venv /tmp/.scrape && source /tmp/.scrape/bin/activate
  pip install "scrapling[fetchers]" && python -m playwright install chromium
  ```
- **Use it when** there is no first-party API to the data you need and the
  target is JS-heavy or bot-protected. Concrete IM8 use-cases:
  - Meta Ad Library competitor scraping (interim until the `ads_read` token
    lands and we can call the official Ad Library API)
  - Amazon review mining to enrich `silver_refund_themes_weekly`
  - Competitor pricing / packaging snapshots from DTC competitor sites
- **Don't use it when** an official API exists and you have the token —
  scraping is a ToS grey area; the API is always preferable.
- **Smoke test that confirmed it works on Meta Ad Library:**
  `StealthyFetcher.fetch(url, headless=True, network_idle=True)` returns
  ~1.9MB of rendered HTML with `Library ID:`, `Started running on`, etc.
  visible. ~28 ad cards per page.

---

## AgentScope — multi-agent framework (Alibaba)
**Repo:** https://github.com/agentscope-ai/agentscope

- **What it is:** Python ≥3.11 framework for building and deploying LLM
  agents — single ReAct agent through full multi-agent orchestration with
  OTel observability and FastAPI service deployment.
- **Install:** `pip install agentscope`
- **Use it when** you genuinely need agents reasoning about which tool to
  call next — e.g. an autopilot that watches MMM recommendations and adjusts
  Meta/Google budgets via their APIs once the `ads_management` token is in.
  That use-case is real but not active today.
- **Don't use it for** what the dashboard already does. Scheduled Databricks
  jobs + the SQL Statement API + simple Python orchestrators handle our
  current data-refresh + CSV-export flows in ~50 lines each; spinning up a
  multi-agent framework for that is pure overhead.
- **Bookmark for:** the post-token autopilot phase.

---

## How to use this file

When a session starts touching the IM8 dashboard, the marketing pipelines,
or competitive-intelligence work, search this file for keywords (Meta Ad
Library, scraping, agent autopilot, etc.) before reinventing or going down
the "should I build my own?" path. Add new tools here only if you've
**verified they actually work on a relevant target** — not from README
reading alone.
