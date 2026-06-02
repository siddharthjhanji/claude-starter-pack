---
name: hermes-agent
description: "Hermes Agent (Nous Research) — alternative self-hosted autonomous AI agent platform with persistent memory, scheduled jobs, and 10+ messaging integrations. NOT a Claude Code skill — competing/parallel product. Hermes-WebUI is its browser interface. Recorded for awareness only; nothing installed."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Hermes Agent + Hermes WebUI

Hermes Agent: https://hermes-agent.nousresearch.com/
Hermes WebUI: https://github.com/nesquena/hermes-webui (v0.51.192 as of 2026-05-31)
**Not installed** — Hermes is a competing agent platform, not a Claude Code skill or extension.

## What it is

**Hermes Agent** is Nous Research's autonomous agent that runs on your server (homelab / cloud VM), maintains persistent memory across sessions, and is reachable via terminal, messaging apps, or web UI.

**Hermes WebUI** (this repo) is a Python (FastAPI) + vanilla-JS web frontend for Hermes Agent — three-panel chat layout modelled on Claude.ai's UI. Runs in Docker or via `start.sh`. State dir: `~/.hermes/webui`.

## Key differentiators from Claude Code

| Feature | Hermes Agent | Claude Code |
|---|---|---|
| Hosting | Self-hosted on your server | Anthropic-hosted CLI |
| Memory | Persistent user profile + agent notes, auto-grows | Per-session + manual memory files |
| Provider | Multi-LLM (OpenAI, Anthropic, Google, DeepSeek, OpenRouter, etc.) | Claude only |
| Messaging | 10+ platforms (Telegram, Discord, Slack, Signal, email, ...) | Terminal only |
| Scheduled jobs | Native cron jobs running offline, delivering to messaging apps | Via external `/schedule` cron |
| Skills format | Hermes's own self-improving skill system (auto-written from experience) | Claude Agent Skills spec (SKILL.md) |
| Skills compatibility | Incompatible with Claude Code's SKILL.md format | Claude Code / Codex / Gemini CLI / Cursor |

## Why nothing was installed in this starter pack

1. **Wrong agent runtime** — Hermes skills aren't SKILL.md and wouldn't load into `~/.claude/skills/`
2. **Different agent product** — installing Hermes WebUI doesn't enhance Claude Code; it's a separate web server
3. Same situation as DeepSeek-Code-Whale (Whale CLI) — a competing AI agent tool

## When you might actually want it

Consider Hermes Agent (separate from Claude Code) if:
- You want a self-hosted agent reachable from your phone via Telegram/Discord without an Anthropic API account
- You need scheduled jobs that fire offline and push results to messaging apps
- You want a single agent that swaps between LLM providers
- You're OK with running a Python server + state directory on your hardware

For the Claude Code starter pack, [[reference_gsd]] / Superpowers / `/schedule` cover most of these needs through Claude.

## Install path (if you ever do want it standalone, NOT in starter-pack)

```bash
# Requires Hermes Agent already installed on the same machine
git clone https://github.com/nesquena/hermes-webui
cd hermes-webui
./bootstrap.py        # one-time setup
./start.sh            # or: ./ctl.sh start
# Then SSH tunnel from your laptop to reach the WebUI in a browser
```

Docker variants in `docker-compose.yml` / `docker-compose.three-container.yml`.
