---
name: anthropic-skills-full
description: "anthropics/skills — official Anthropic skill catalog. All 17 skills now vendored locally. Covers documents, design/creative, dev tooling, communication."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Anthropic Skills — Full Catalog

Repo: https://github.com/anthropics/skills
Fully vendored: 2026-05-30 — all 17 skills in `~/.claude/skills/`

## Skills by domain

**Documents (4):** `pdf`, `docx`, `xlsx`, `pptx` — real file creation/parsing via Python (not text descriptions)

**Design & Creative (5):** `frontend-design` (bans Inter/Roboto), `algorithmic-art`, `canvas-design`, `theme-factory`, `brand-guidelines`

**Dev Tooling (4):** `claude-api` (build/migrate Anthropic SDK apps with prompt caching), `mcp-builder`, `webapp-testing` (Playwright), `web-artifacts-builder`

**Communication (2):** `internal-comms`, `slack-gif-creator`

**Other (2):** `skill-creator` (Q&A to build your own skills), `doc-coauthoring`

## When to consult
This is THE authoritative skill source. If a user needs anything in the above domains, prefer the Anthropic version over community alternatives (e.g., over Mafia's `frontend-design` or `mcp-builder` — both already covered here).
