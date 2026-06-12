---
name: hindsight
description: "vectorize-io/hindsight — production-grade agent memory system claiming SOTA on LongMemEval benchmark. MIT. 6 of 9 SKILL.md files vendored (docs, architect, cloud, local, self-hosted, create-agent renamed). Backend = Docker + PostgreSQL + LLM provider of choice. Worth evaluating against existing claude-mem (localhost:37777) and agentdb-* skills if a heavyweight team-grade memory system is needed."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Hindsight (vectorize-io)

Repo: https://github.com/vectorize-io/hindsight
Docs: https://hindsight.vectorize.io
Paper: https://arxiv.org/abs/2512.12818
License: MIT · Author: Vectorize (the vector-DB company)
Vendored: 2026-06-09 — 6 skills, ~1.5MB total

## What it is

**Agent memory system focused on "learning, not just remembering."** Distinguishes itself from:
- RAG (which retrieves source chunks)
- Knowledge graphs (which retrieve relationships)

Claims SOTA on **LongMemEval**, independently reproduced by Virginia Tech (Sanghani Center) and The Washington Post. Used in production at Fortune 500 + AI startups.

Core operations:
- **retain** — store experiences with mental-model dispositions
- **recall** — semantic + biomimetic retrieval (not just nearest-neighbor)
- **reflect** — process stored memories to extract learnings

## Architecture (what you'd run)

Docker container with:
- Python API (port 8888)
- Web UI (port 9999)
- PostgreSQL (bundled or external)
- LLM backend — pluggable: OpenAI, Anthropic, Gemini, Groq, Ollama, LMStudio, MiniMax

```bash
docker run -it --pull always --name hindsight \
  -p 8888:8888 -p 9999:9999 \
  -e HINDSIGHT_API_LLM_API_KEY=$OPENAI_API_KEY \
  -v hindsight-data:/home/hindsight/.pg0 \
  ghcr.io/vectorize-io/hindsight:latest
```

Or **Hindsight Cloud** — managed at hindsight.vectorize.io.

## Skills vendored (6 of 9)

| Skill | Use |
|---|---|
| **`hindsight-docs`** | Reference documentation (1.4MB, full openapi spec + dev docs + SDKs). Recommended by the project itself for any coding agent working with Hindsight. |
| **`hindsight-architect`** | Memory-system design skill — produces implementation plan with bank config, tag schema, and code outline. Useful BEFORE writing memory-system code, even if you don't use Hindsight. |
| **`hindsight-cloud`** | For using Hindsight Cloud (team-shared memory bank) |
| **`hindsight-local`** | For using `hindsight-embed` CLI locally (single-user) |
| **`hindsight-self-hosted`** | For using a self-hosted Hindsight Docker stack (team-shared, on-prem) |
| **`hindsight-create-agent`** | Renamed from `create-agent` to avoid namespace collision. Builds a Hindsight-backed Claude Code subagent file at `~/.claude/agents/<name>.md` |

## Skills NOT vendored (3 of 9)

- `.claude/skills/code-review` — Hindsight-monorepo-internal code review
- `.claude/skills/hs-release` — Hindsight-monorepo-internal release skill
- `hindsight-integrations/cursor/skills/hindsight-recall` — Cursor IDE specific

## Comparison to existing memory tooling

| System | Scope | Architecture | When you'd pick it |
|---|---|---|---|
| **[[reference_claude_mem]]** (already installed) | Personal, local | SQLite + Chroma, worker at localhost:37777 | Default for your personal session memory. Already in use. |
| **[[memory-management]]** (claude-flow agentdb) | Local or distributed | AgentDB with HNSW vector search | Already in use. Pattern storage + retrieval. |
| **[[agentdb-vector-search]]**, [[agentdb-memory-patterns]] | Embedded into Claude-Flow agents | AgentDB direct | Already in use. |
| **Hindsight (this)** | **Team/enterprise + production** | Docker + Postgres + LLM | Worth evaluating if building a memory-augmented product (not just augmenting Claude Code sessions). Higher operational cost (Docker, Postgres, LLM bill). Real benchmark advantage on long-memory recall. |

## When this matters for Prenetics/IM8 work

Hindsight is a real candidate to evaluate if any of these happen:
1. **IM8 app builds user-memory features** (e.g., "remember my goals," "remember my previous routines") — Hindsight is a turnkey backend for that
2. **Internal AI agents need team-shared memory** (e.g., a marketing-ops agent that remembers what worked across campaigns) — Hindsight Cloud or self-hosted addresses this
3. **Replacing your current claude-mem setup** for higher-volume / team-shared use cases — likely overkill for personal sessions

For personal Claude Code sessions: stick with claude-mem + the auto-memory system. Don't migrate.

## License + dependencies
- MIT (core)
- Requires an LLM API key (OpenAI, Anthropic, etc.) — Hindsight uses the LLM to process memories during retain/reflect operations
- Self-hosted needs Docker + ~1GB RAM + Postgres
- Cloud version is hosted at hindsight.vectorize.io (Vectorize SaaS)

## Trigger words

- "Hindsight", "agent memory", "long-term memory", "memory bank"
- "store this for later", "remember across sessions", "learn from experience"
- Implementation planning: "design a memory system for [...]" → `hindsight-architect`
- Creating subagents with memory: `hindsight-create-agent`
