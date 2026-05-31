---
name: impeccable
description: "pbakaus/impeccable v3.5 — frontend-design skill that improves on Anthropic's frontend-design. 1 skill, 23 commands (via /impeccable subcommand), 7 domain references (typography, color, spatial, motion, interaction, responsive, UX writing), 27 deterministic anti-pattern rules + 12-rule LLM critique pass. Apache 2.0. IM8 brand still overrides."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Impeccable (pbakaus)

Repo: https://github.com/pbakaus/impeccable
Site: https://impeccable.style
Vendored: 2026-05-30 — skill at `~/.claude/skills/impeccable/`, agent at `~/.claude/agents/impeccable-manual-edit-applier.md`

## What it adds beyond [[frontend-design]]
- **7 domain reference files** loaded on every command: typography, color-and-contrast, spatial-design, motion-design, interaction-design, responsive-design, ux-writing
- **23 subcommands** invoked as `/impeccable <command> [target]`: craft, shape, audit, critique, animate, bolder, colorize, delight, layout, overdrive, quieter, typeset, adapt, clarify, distill, harden, onboard, optimize, polish, init, document, extract, live
- **27 deterministic anti-pattern rules** — runs without LLM/API key (e.g., kills purple-to-blue gradients, Inter for everything, rounded-square icon tiles above headings, cards-in-cards, gray text on colored backgrounds)
- **12-rule LLM critique pass** for subjective issues
- **Brand vs product register** — defaults adjust based on whether you're designing marketing pages vs in-product UI

## When to use
Trigger on any frontend/UI work: "redesign", "polish", "audit this page", "make it bolder", "make it quieter", etc.

## ⚠️ IM8 brand overrides this
Per [[feedback_im8_frontend_design]] and [[reference_im8_brand]]: when working on anything IM8, use IM8's deep crimson + gold palette and ABC Arizona Flare / Aeonik fonts. Impeccable's defaults DO NOT apply to IM8 work. Same rule that overrides Anthropic's [[frontend-design]] and [[reference_ui_ux_pro_max]] applies here.

## Companion CLI / browser extension
- CLI: `npx impeccable` runs the 27 deterministic rules locally with no LLM cost
- Browser extension: same anti-pattern checks live on any page

## Relationship to other design skills
| Skill | Best for |
|---|---|
| [[frontend-design]] (Anthropic) | Generic bold aesthetic direction, simpler scope |
| **impeccable** | Production frontend with the same direction + structured craft + anti-patterns |
| [[refactoring-ui]] (Wondel/Tailwind) | Polish-pass on existing UIs using Tailwind conventions |
| [[web-design-guidelines]] (Vercel) | Audit-only mode against 100+ accessibility/UX rules |
| [[reference_ui_ux_pro_max]] | 67 styles + 161 industry patterns library |
| **IM8 brand** | Always wins for IM8 work |
