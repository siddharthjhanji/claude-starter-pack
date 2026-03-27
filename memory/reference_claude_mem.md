---
name: claude-mem Persistent Memory System
description: Cross-session memory tool — automatically captures tool usage, generates summaries, injects context. Installed at ~/.claude/plugins/marketplaces/claude-mem/
type: reference
---

Repo: https://github.com/thedotmack/claude-mem
Version: 10.6.2 | License: AGPL-3.0 | Author: Alex Newman (@thedotmack)

## What It Does
Persistent memory across Claude Code sessions. Automatically:
1. Captures all tool usage (PostToolUse hook → observation)
2. Generates semantic summaries (Stop hook)
3. Injects relevant context into future sessions (SessionStart hook)
4. Stores in SQLite + Chroma vector DB at ~/.claude-mem/

## Install Location
- Plugin: ~/.claude/plugins/marketplaces/claude-mem/plugin/
- Database: ~/.claude-mem/claude-mem.db
- Logs: ~/.claude-mem/logs/worker-YYYY-MM-DD.log
- Web UI: http://localhost:37777

## Hook Lifecycle
Setup → SessionStart → UserPromptSubmit → PostToolUse → Stop → SessionEnd

## 5 Skills Available (via Skill tool)
- **mem-search** — Search past work. Use 3-layer workflow: search (index) → timeline → get_observations (full detail)
- **make-plan** — Phased implementation plans with documentation discovery
- **do** — Execute phased plans with subagents + verification
- **timeline-report** — Timeline reports of past observations
- **smart-explore** — Intelligent codebase exploration

## mem-search Parameters
query, limit (max 100), project, type (observations/sessions/prompts),
obs_type (bugfix/feature/decision/discovery/change), dateStart, dateEnd, offset, orderBy

## Privacy
Wrap sensitive content in `<private>...</private>` tags — excluded from observations.

## Worker Management
```bash
node ~/.claude/plugins/marketplaces/claude-mem/plugin/scripts/worker-service.cjs start|stop|status|logs
```
