---
name: claude-ads
description: "AgriciDaniel/claude-ads v1.7.1 — multi-platform paid-ads audit & optimization skill. Main `ads` skill orchestrates 22 sub-skills + 10 agents across Google, Meta, YouTube, LinkedIn, TikTok, Microsoft, Apple, Amazon. 10-15 min full audit, 0-100 health score, 209+ checks. MIT licensed. Local, deterministic."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Claude Ads (AgriciDaniel)

Repo: https://github.com/AgriciDaniel/claude-ads
Vendored 2026-05-30 — main `ads` skill at `~/.claude/skills/ads/`, 22 sub-skills + 10 agents.

## What it does

A manual senior-PPC audit of one Google Ads account takes 4-6 hours. `/ads audit` does it in 10-15 minutes across all 8 major platforms, returns a 0-100 health score + prioritized action plan.

## How to invoke

The main skill is **user-invokable** with subcommands (the 22 sub-skills are auto-dispatched, not directly invoked):

```
/ads audit                       → Full multi-platform audit with parallel subagents
/ads google                      → Google Ads deep dive (80 checks, AI Max era)
/ads meta                        → Meta Ads deep dive (50 checks, Andromeda+GEM+Lattice)
/ads youtube                     → YouTube Ads
/ads linkedin                    → LinkedIn Ads
/ads tiktok                      → TikTok Ads (USDS post-divestiture, Smart+)
/ads microsoft                   → Microsoft Ads
/ads apple                       → Apple Search Ads
/ads amazon                      → Amazon (Sponsored Products/Brands/Display + DSP)
/ads attribution                 → AdAttributionKit + GA4 + Consent Mode V2 audit
/ads tracking                    → sGTM + CAPI Gateway + dedup + hashing
/ads creative                    → Creative analysis
/ads landing                     → Landing page audit
/ads budget                      → Budget allocation
/ads plan <type>                 → Plan a campaign
/ads competitor                  → Competitor intel
/ads math                        → Ad math (CAC, LTV, ROAS, MER, etc.)
/ads test                        → A/B test setup
/ads dna <url>                   → Brand DNA extraction from a URL
/ads create                      → Create ad creative
/ads generate                    → AI creative generation
/ads photoshoot                  → Product photoshoot brief
```

## Agents (10 total, in `~/.claude/agents/`)

| Agent | Purpose |
|---|---|
| `audit-google` | Google Ads audit subagent |
| `audit-meta` | Meta Ads audit subagent |
| `audit-budget` | Budget allocation review |
| `audit-compliance` | Policy/compliance check |
| `audit-creative` | Creative diversity & quality |
| `audit-tracking` | Conversion tracking validation |
| `copy-writer` | Ad copy generation |
| `creative-strategist` | Creative direction |
| `format-adapter` | Multi-platform format adaptation |
| `visual-designer` | Visual creative briefs |

## Relationship to existing skills

| Skill | Best for |
|---|---|
| **`ads` (this skill)** | Deep platform-specific audits, 209+ check catalog, parallel agent dispatch, ad math, Wave 2 attribution/tracking deep dives |
| [[paid-ads]] (Corey Haines) | Strategy / planning / budget allocation at a higher level |
| [[ad-creative]] (Corey Haines) | Bulk ad copy iteration (RSA headlines, FB ad variations) — strategy side |
| [[analytics-tracking]] (Corey) | Setting up GA4 / event tracking from scratch |

**When in doubt:** for any auditing or platform-specific deep dive → `/ads`. For greenfield strategy or copy iteration → Corey's.

## Direct relevance to Prenetics/IM8 work

Per [[project_attribution_platform_direct]]: IM8 is canonicalizing on platform-direct ROAS. Meta/Google native are wired; TikTok/AppLovin/Snapchat connectors still pending. `/ads attribution` and `/ads tracking` are directly applicable — they audit sGTM, CAPI Gateway, dedup logic, Consent Mode V2, AdAttributionKit (iOS view-through), and MMP integration health (AppsFlyer/Adjust/Branch/Singular).

`/ads google` and `/ads meta` deep dives could be run weekly against the IM8 ad accounts as a second-pair-of-eyes check — relevant to the [[feedback_numbers_reconcile]] discipline (metrics must reconcile to the dollar).

## License
MIT — fully open source, no commercial restriction.

## Cross-runtime
Also marked compatible with Codex CLI, Cursor, Windsurf, Gemini CLI, Goose (Experimental). For Claude Code: Verified.
