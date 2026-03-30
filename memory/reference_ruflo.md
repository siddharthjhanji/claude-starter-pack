---
name: reference_ruflo_claudeflow
description: Comprehensive reference for ruflo / claude-flow v3.5 multi-agent orchestration framework — commands, agent types, swarm topologies, hooks, intelligence system, dual-mode patterns
type: reference
---

# Ruflo / Claude-Flow v3.5 Reference

> `ruflo@3.5.0` = `claude-flow@3.5.0` = `@claude-flow/cli@3.5.0` (all the same framework, three npm aliases)
> 5,900+ commits · 134 skills · 259 MCP tools · 60+ agent types · 8 AgentDB controllers

## Core Mental Model

**Claude Flow coordinates. Claude Code creates.**
- MCP tools (`mcp__claude-flow__*`, `mcp__ruv-swarm__*`) = coordination only (topology, memory, routing)
- Claude Code Task tool = actual execution (file reads/writes, code generation, bash)
- Never wait for claude-flow to execute — YOU execute work via Task tool

## Quick Setup

```bash
# Add MCP servers (one-time)
claude mcp add claude-flow npx claude-flow@v3alpha mcp start
claude mcp add ruv-swarm npx ruv-swarm mcp start

# Start daemon
npx claude-flow@v3alpha daemon start

# Health check
npx claude-flow@v3alpha doctor --fix
```

## 26 CLI Commands (140+ Subcommands)

| Command | Key Subcommands | Use |
|---------|----------------|-----|
| `init` | `--wizard`, `--preset` | Project setup |
| `agent` | `spawn`, `list`, `status`, `stop`, `metrics`, `pool` | Agent lifecycle |
| `swarm` | `init`, `status`, `scale`, `stop` | Multi-agent coordination |
| `memory` | `store`, `retrieve`, `search`, `list`, `clear` | AgentDB (HNSW indexed) |
| `mcp` | `start`, `stop`, `status`, `tools` | MCP server management |
| `task` | `create`, `assign`, `list`, `complete` | Task lifecycle |
| `session` | `start`, `end`, `restore`, `export` | Session persistence |
| `hooks` | 17 hooks + `worker` subcommands | Self-learning lifecycle |
| `hive-mind` | `init`, `spawn`, `consensus`, `status` | Byzantine fault-tolerant swarms |
| `neural` | `train`, `status`, `patterns`, `predict` | Pattern learning |
| `security` | `scan`, `audit`, `cve`, `threats` | Security scanning |
| `plugins` | `list`, `install`, `enable`, `disable` | Plugin management |
| `daemon` | `start`, `stop`, `status`, `trigger` | Background workers |
| `doctor` | `--fix` | System diagnostics |

## Default Swarm Initialization

```javascript
// Always use this for complex tasks (3+ files)
mcp__ruv-swarm__swarm_init({
  topology: "hierarchical",  // anti-drift default
  maxAgents: 8,
  strategy: "specialized"
})
```

## Swarm Topologies

| Topology | Use Case |
|----------|----------|
| `hierarchical` | Default — coordinator + workers, tight control |
| `mesh` | Fully connected peers, eventual consistency |
| `hierarchical-mesh` | Hybrid — recommended for large tasks |
| `ring` | Sequential pipeline |
| `star` | Central hub, all workers connect to one |
| `adaptive` | Dynamic based on load |

## 3-Tier Model Routing

| Tier | Handler | Latency | Cost | Trigger |
|------|---------|---------|------|---------|
| 1 | Agent Booster (WASM) | <1ms | $0 | `[AGENT_BOOSTER_AVAILABLE]` — simple transforms |
| 2 | Haiku | ~500ms | $0.0002 | Complexity <30% |
| 3 | Sonnet/Opus | 2-5s | $0.003-0.015 | Complexity >30%, architecture, security |

When you see `[AGENT_BOOSTER_AVAILABLE]`, use Edit tool directly — no LLM needed.

## Agent Types (60+)

### Core
`coder`, `reviewer`, `tester`, `planner`, `researcher`, `system-architect`

### Data / ML (IM8-relevant)
`agent-data-ml-model`, `agent-architecture`, `agent-dev-backend-api`, `agent-migration-plan`

### Swarm Coordination
`hierarchical-coordinator`, `mesh-coordinator`, `adaptive-coordinator`
`swarm-memory-manager`, `collective-intelligence-coordinator`

### Consensus / Distributed
`byzantine-coordinator`, `raft-manager`, `gossip-coordinator`
`consensus-builder`, `crdt-synchronizer`, `quorum-manager`

### SPARC Methodology
`sparc-coord`, `sparc-coder`, `specification`, `pseudocode`, `architecture`, `refinement`

### GitHub / DevOps
`github-modes`, `pr-manager`, `code-review-swarm`, `ops-cicd-github`
`release-manager`, `workflow-automation`, `repo-architect`

### Security
`security-architect`, `security-auditor`, `security-manager`
Via `@claude-flow/security`: `InputValidator`, `PathValidator`, `SafeExecutor`, `PasswordHasher`, `TokenGenerator`

### Performance
`perf-analyzer`, `performance-benchmarker`, `performance-engineer`

## Dual-Mode Collaboration (Claude Code + Codex)

```
Level 0: [🔵 Architect]           # runs first
Level 1: [🟢 Coder, 🔵 Tester]    # depends on Architect
Level 2: [🔵 Reviewer]            # depends on Coder + Tester
Level 3: [🟢 Optimizer]           # depends on Reviewer
```

| Task Type | Platform | Reason |
|-----------|----------|--------|
| Architecture | 🔵 Claude | Strong reasoning |
| Implementation | 🟢 Codex | Fast code gen |
| Security review | 🔵 Claude | Threat modeling |
| Performance opt | 🟢 Codex | Code-level |
| Testing strategy | 🔵 Claude | Coverage analysis |
| Refactoring | 🟢 Codex | Bulk transforms |

```bash
# Pre-built collaboration templates
npx claude-flow-codex dual run feature --task "Add user authentication with OAuth"
npx claude-flow-codex dual run security --target "./src"
npx claude-flow-codex dual run refactor --target "./src/legacy"
```

## Auto-Swarm Trigger Pattern (single message)

```javascript
// STEP 1: Init MCP
mcp__ruv-swarm__swarm_init({ topology: "hierarchical", maxAgents: 8, strategy: "specialized" })

// STEP 2: Spawn ALL agents in SAME message
Task("Coordinator", "Initialize session via: npx claude-flow@v3alpha hooks session-start", "hierarchical-coordinator")
Task("Researcher", "Analyze requirements. Store findings in memory.", "researcher")
Task("Architect", "Design approach based on research.", "system-architect")
Task("Coder", "Implement following architect's design.", "coder")
Task("Tester", "Write tests for implementation.", "tester")
Task("Reviewer", "Review quality and security.", "reviewer")
```

**Invoke swarm when:** 3+ files, new feature, cross-module refactor, API changes with tests, security changes, DB schema changes

**Skip swarm for:** single-file edits, 1-2 line fixes, docs, config changes

## 17 Hooks + 12 Background Workers

### Core Hooks
```bash
npx claude-flow@v3alpha hooks pre-task --description "[task]"
npx claude-flow@v3alpha hooks post-task --task-id "[id]" --success true
npx claude-flow@v3alpha hooks post-edit --file "[file]" --train-patterns
npx claude-flow@v3alpha hooks session-start --session-id "[id]"
npx claude-flow@v3alpha hooks session-end --export-metrics true
npx claude-flow@v3alpha hooks route --task "[task]"
```

### 12 Background Workers
| Worker | Priority | Purpose |
|--------|----------|---------|
| `ultralearn` | normal | Deep knowledge acquisition |
| `optimize` | high | Performance optimization |
| `consolidate` | low | Memory consolidation |
| `audit` | critical | Security analysis |
| `map` | normal | Codebase mapping |
| `testgaps` | normal | Test coverage analysis |
| `document` | normal | Auto-documentation |
| `refactor` | normal | Refactoring suggestions |

```bash
npx claude-flow@v3alpha hooks worker list
npx claude-flow@v3alpha hooks worker dispatch --trigger audit
```

## Memory System (AgentDB + HNSW)

```bash
# Store
npx claude-flow@v3alpha memory store --namespace [ns] --key "[key]" --value "[val]"

# Retrieve
npx claude-flow@v3alpha memory retrieve --namespace [ns] --key "[key]"

# Search (150x-12,500x faster with HNSW)
npx claude-flow@v3alpha memory search --namespace [ns] --query "[natural language query]"
```

Namespaces: `swarm`, `collaboration`, `patterns`, `session`

## RuVector Intelligence System

4-step pipeline:
1. **RETRIEVE** — Fetch patterns via HNSW (150x–12,500x faster)
2. **JUDGE** — Evaluate with verdicts (success/failure/partial)
3. **DISTILL** — Extract learnings via LoRA fine-tuning
4. **CONSOLIDATE** — Prevent forgetting via EWC++ (Elastic Weight Consolidation)

Components:
- **SONA** (<0.05ms): Self-Optimizing Neural Architecture
- **MoE**: Mixture of Experts for specialized routing
- **Flash Attention**: 2.49x–7.47x speedup
- **ReasoningBank**: 32% fewer tokens via retrieval

## Token Optimization

| Feature | Savings |
|---------|---------|
| ReasoningBank retrieval | -32% |
| Agent Booster edits | -15% |
| Cache (95% hit rate) | -10% |
| Optimal batch size | -20% |

## SPARC Methodology

For complex implementations, always follow S→P→A→R→C order:

```bash
# Specification: define requirements + acceptance criteria
npx @claude-flow/cli hooks route --task "specification: [requirements]"

# Pseudocode: high-level logic
npx @claude-flow/cli hooks route --task "pseudocode: [feature]"

# Architecture: system structure + interfaces
npx @claude-flow/cli hooks route --task "architecture: [design]"

# Refinement: iterate on feedback
npx @claude-flow/cli hooks route --task "refinement: [feedback]"

# Completion: finalize + tests + docs
npx @claude-flow/cli hooks route --task "completion: [feature]"
```

## Headless Parallel Execution (`claude -p`)

```bash
# Spawn multiple headless instances in parallel
claude -p "Analyze src/ingestion/ for issues" &
claude -p "Write tests for dbt models" &
claude -p "Review src/quality/ for gaps" &
wait

# With model selection + budget
claude -p --model haiku "Format this config"
claude -p --model opus --max-budget-usd 0.50 "Design schema"

# Session continuation
claude -p --session-id "abc-123" "Start analyzing"
claude -p --resume "abc-123" "Continue with models"
```

## Agent Routing Codes

| Code | Task Type | Agents |
|------|-----------|--------|
| 1 | Bug Fix | coordinator, researcher, coder, tester |
| 3 | Feature | coordinator, architect, coder, tester, reviewer |
| 5 | Refactor | coordinator, architect, coder, reviewer |
| 7 | Performance | coordinator, perf-engineer, coder |
| 9 | Security | coordinator, security-architect, auditor |
| 11 | Memory/DB | coordinator, memory-specialist, perf-engineer |
| 13 | Docs | researcher, api-docs (mesh topology) |

## Concurrency Rules (Critical)

- ALL todos → ONE `TodoWrite` call (5-10+ items)
- ALL agent spawns → ONE message (parallel Task calls)
- ALL file reads/writes → ONE message
- ALL bash commands → ONE message (chained with `&&`)
- ALL memory operations → ONE message
- NEVER continuously check status after spawning — wait for results

## Key Packages

| Package | Path | Purpose |
|---------|------|---------|
| `@claude-flow/cli` | `v3/@claude-flow/cli/` | CLI entry (26 commands) |
| `@claude-flow/codex` | `v3/@claude-flow/codex/` | Dual-mode Claude+Codex |
| `@claude-flow/hooks` | `v3/@claude-flow/hooks/` | 17 hooks + 12 workers |
| `@claude-flow/memory` | `v3/@claude-flow/memory/` | AgentDB + HNSW |
| `@claude-flow/security` | `v3/@claude-flow/security/` | Input validation, CVE |
| `@claude-flow/embeddings` | plugin | Vector embeddings, hyperbolic |

## 134 Skills by Category

**Agent types (60+):** `agent-architecture`, `agent-coder`, `agent-data-ml-model`, `agent-dev-backend-api`, `agent-hierarchical-coordinator`, `agent-memory-coordinator`, `agent-migration-plan`, `agent-security-manager`, `agent-tester`, `agent-reviewer`, + 50 more

**Swarm patterns:** `swarm-orchestration`, `swarm-advanced`, `hive-mind`, `hive-mind-advanced`, `stream-chain`

**Memory:** `memory-management`, `agentdb-memory-patterns`, `agentdb-vector-search`, `agentdb-learning`, `reasoningbank-agentdb`, `reasoningbank-intelligence`

**SPARC:** `sparc-methodology`, `agent-specification`, `agent-pseudocode`, `agent-architecture`, `agent-refinement`

**GitHub:** `github-automation`, `github-code-review`, `github-multi-repo`, `github-workflow-automation`, `github-release-management`

**Security:** `security-audit`, `claims`

**Performance:** `performance-analysis`, `agentdb-optimization`

**Neural/Intelligence:** `neural-training`, `agent-sona-learning-optimizer`, `agent-neural-network`, `flow-nexus-neural`

**V3-specific:** `v3-cli-modernization`, `v3-ddd-architecture`, `v3-integration-deep`, `v3-memory-unification`, `v3-performance-optimization`, `v3-security-overhaul`, `v3-swarm-coordination`

## Source & Docs

- GitHub: https://github.com/ruvnet/claude-flow
- Local clone: `/Users/Prenetics/Documents/ruflo`
- CLAUDE.md: `/Users/Prenetics/Documents/ruflo/CLAUDE.md`
- AGENTS.md: `/Users/Prenetics/Documents/ruflo/AGENTS.md`
