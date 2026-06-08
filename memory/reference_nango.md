---
name: nango
description: "Nango (nangohq/nango) — open-source product integration platform connecting apps to 800+ APIs. Elastic license, used in production by Replit, Ramp, Mercor. NOT installed as a skill — it's a runtime platform alternative to Fivetran/Workato. 2 of 8 Nango SKILL.md files vendored (agent-builder, creating-skills); other 6 skipped as Nango-monorepo-specific."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Nango

Repo: https://github.com/nangohq/nango
Docs: https://nango.dev/docs
Site: https://nango.dev
License: Elastic License (source-available, not OSI-OSS)
Local clone: NOT vendored — 363MB monorepo

## What it is

Nango is an integration platform that handles:
- **Auth** — managed OAuth, API keys, token refresh for 800+ APIs; embeddable white-label flow
- **Proxy** — authenticated API requests on behalf of users; resolves provider, injects creds, handles retries + rate limits
- **Syncs/Actions** — TypeScript functions that pull/push data; deployed to Nango's runtime

You write integration logic as TS functions (or have AI generate them) and deploy to Nango's runtime. Backend-language agnostic, AI-coding-tool agnostic, agent-SDK agnostic.

## Compared to existing IM8 / Prenetics integration stack

| Use case | Currently | Nango alternative |
|---|---|---|
| Klaviyo, Shopify, Northbeam ingestion | Fivetran + custom connectors | Nango sync, write the logic yourself in TS |
| Meta/Google native ROAS pull | Custom connectors (per [[project_attribution_platform_direct]]) | Nango handles auth + proxy; you write the sync |
| TikTok/AppLovin/Snapchat (pending) | Build-yourself queue | Nango pre-built integrations for most |
| GA4 hourly serverless job | Custom (per [[project_ga4_connector]]) | Could be replaced with Nango action |
| TripleWhale deprecation | Migrating to platform-direct | Nango is a cleaner middleware option |

**Honest trade-off:** Fivetran is hands-off (managed pipelines, zero code). Nango is more flexible (write your own TS sync logic, full control over destination shape, cheaper at scale) but requires you to write + maintain the syncs. Consider Nango when:
1. Fivetran connector quality is degrading (e.g., the [[project_im8_broken_upstream_feeds]] situation — 4 silent pipelines)
2. You need custom transformation logic at extraction time (not after)
3. You hit Fivetran's destination-format limitations
4. Cost crosses ~$3k/mo on Fivetran

## What was vendored (2 meta-skills, project-agnostic)

| Skill | Path | What it does |
|---|---|---|
| **`agent-builder`** | `~/.claude/skills/agent-builder/` | Claude Code subagent design expert: 920-line guide on agent file structure, frontmatter, tool config, model selection, delegation patterns. Includes EXAMPLES.md. Pairs with [[agent-architecture]], [[agent-designer]], [[skill-builder]]. |
| **`creating-skills`** | `~/.claude/skills/creating-skills/` | 482-line meta-skill on writing high-quality SKILL.md files: discoverability, scannability, when-to-create rules. Alternative perspective to [[skill-creator]] (Anthropic) and [[skill-builder]] (claude-flow). |

## What was skipped (6 Nango-monorepo-specific)

These are tied to Nango's codebase and would mislead if applied elsewhere:
- `running-tests` — Vitest configs specific to Nango (test:unit / test:integration / test:cli)
- `creating-database-migrations` — Nango's `packages/database/lib/migrations/` directory + timestamped .cjs naming
- `running-and-testing-locally` — Nango local dev setup (ports 3000/3003, Docker Compose)
- `creating-integration-docs` — Nango integration documentation format
- `building-and-verifying` — Nango build verification commands
- `ui-visual-debugging` — Nango UI debug (packages/webapp, packages/connect-ui, Peekaboo + Playwright)

If you ever contribute to Nango itself, clone the repo and these become directly useful.

## When this memory matters

- Considering a Fivetran replacement / supplement
- Building a new product integration from scratch (vs writing from-scratch OAuth + token refresh)
- TripleWhale deprecation cleanup — Nango is one of the cleaner middleware options
- User mentions Nango by name
