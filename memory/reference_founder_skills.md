---
name: founder-skills
description: "ognjengt/founder-skills — 14 vendored founder/marketer skills. Reads FOUNDER_CONTEXT.md from project root for shared business context (similar to Corey's product-marketing-context)."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Founder Skills (ognjengt)

Repo: https://github.com/ognjengt/founder-skills
Vendored 2026-05-30: 14 of 15 in `~/.claude/skills/` (skipped `marketing-ideas` — Corey Haines version wins).

## Skills

| Skill | Use when |
|---|---|
| `prd-generator` | Build a standalone PRD (does NOT read FOUNDER_CONTEXT) |
| `strategic-planning` | Strategic / annual planning |
| `go-to-market-plan` | New product GTM strategy |
| `product-hunt-launch-plan` | Product Hunt launch playbook |
| `pricing-strategist` | Pricing plans, tiers, packaging (interactive Q&A) |
| `competitor-intel` | Competitive research and intel briefs |
| `brand-copywriter` | Brand voice copywriting |
| `viral-hook-creator` | Viral hooks for social/email |
| `linkedin-writer` | LinkedIn post writing |
| `x-writer` | Twitter/X post and thread writing |
| `lead-magnet-generator` | Lead magnet ideation + outline |
| `outreach-specialist` | Cold outreach sequences (overlaps with [[cold-email]] — try both) |
| `cro-optimization` | CRO audits (overlaps with [[cro-methodology]] and [[page-cro]]) |
| `sop-creator` | Standard operating procedure docs |

## Shared context — FOUNDER_CONTEXT.md

Most of these skills look for `FOUNDER_CONTEXT.md` in the project root (not `~/.claude/`). It's a brief about: product, ICP, positioning, current channels, brand voice. Similar concept to Corey Haines' [[product-marketing-context]] (`.agents/product-marketing-context.md`).

**When using these skills in a new project**: drop a FOUNDER_CONTEXT.md at the repo root first, or paste the context inline.

`prd-generator` is the exception — explicitly DOES NOT read FOUNDER_CONTEXT (PRDs are meant to be standalone).

## Overlap notes
- `cro-optimization` (founder) vs [[cro-methodology]] (Wondel) vs [[page-cro]] (Corey) — three approaches; founder is most action-oriented for SaaS, Wondel is most book-grounded (Make It Stick patterns), Corey is most tactical.
- `outreach-specialist` (founder) vs [[cold-email]] (Corey) — both cover cold email; outreach-specialist is broader (multi-channel including LinkedIn DMs).
- `marketing-ideas` from this repo was SKIPPED — [[marketing-ideas]] from Corey Haines was already installed.
