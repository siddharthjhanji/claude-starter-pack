---
name: Awesome Claude Code Resource Directory
description: Curated list of the best Claude Code skills, agents, hooks, slash commands, tooling, CLAUDE.md templates, and orchestrators from github.com/hesreallyhim/awesome-claude-code
type: reference
---

Source: https://github.com/hesreallyhim/awesome-claude-code

---

## Latest Additions (as of 2026-03-27)
- **Ruflo** (ruvnet) — multi-agent swarm orchestration, self-learning, vector memory, security guardrails
- **Claude Scientific Skills** (K-Dense-AI) — research, science, engineering, analysis, finance, writing skills
- **parry** (vaporif) — prompt injection scanner for hooks; scans tool inputs/outputs for injection, secrets, exfiltration

---

## Agent Skills

| Name | Author | What It Does |
|------|--------|-------------|
| AgentSys | avifenesh | Full workflow automation: PR mgmt, code cleanup, perf investigation, drift detection, multi-agent code review |
| Book Factory | Robert Guss | Nonfiction book creation pipeline |
| cc-devops-skills | akin-ozer | DevOps IaC skills for any platform (AWS, GCP, Azure, k8s) |
| Claude Code Agents | Paul UndeadList | E2E dev workflow, parallel auditors, fix cycles, browser QA |
| Claude Codex Settings | fatih akyon | GitHub, Azure, MongoDB, Tavily, Playwright plugins |
| Claude Scientific Skills | K-Dense | Research, science, engineering, finance, writing skills |
| Codex Skill | klaudworks | Prompt Codex from Claude Code with session continuity |
| Compound Engineering Plugin | EveryInc | Turns past mistakes into lessons; agents + skills + commands |
| Context Engineering Kit | Vlad Goncharov | Advanced context engineering patterns, minimal token footprint |
| Everything Claude Code | Affaan Mustafa | Comprehensive resources across all core engineering domains |
| Fullstack Dev Skills | jeffallan | 65 skills across frameworks; Jira/Confluence; `/common-ground` |
| read-only-postgres | jawwadfirdousi | Safe SELECT/SHOW/EXPLAIN/WITH queries with row limits |
| Superpowers | Jesse Vincent | Planning, reviewing, testing, debugging — full SDLC coverage |
| Trail of Bits Security Skills | Trail of Bits | CodeQL, Semgrep, variant analysis, fix verification, diff review |
| TÂCHES Resources | TÂCHES | Agents, skills, commands; meta-skills like skill-auditor, hook creation |
| Web Assets Generator | Alon Wolenitz | Favicons, PWA icons, Open Graph images, HTML meta tags |

---

## Workflows & Knowledge Guides

| Name | Author | What It Does |
|------|--------|-------------|
| AB Method | Ayoub Bensalah | Spec-driven, incremental missions with subagents |
| Agentic Workflow Patterns | ThibautMelen | Mermaid diagrams + code for all Anthropic agentic patterns |
| Claude Code Handbook | nikiforovall | Best practices, tips, distributable plugins |
| Claude Code Infrastructure Showcase | diet103 | Hooks auto-select correct Skill for current context |
| Claude Code PM | Ran Aroussi | Full project management: agents, slash commands, docs |
| Claude Code Repos Index | Daniel Rosehill | 75+ CC repos: CMS, IoT, deep research, agentic workflows |
| Claude Code System Prompts | Piebald AI | All parts of Claude Code's system prompt, updated per version |
| Claude Code Tips | ykdojo | 35+ tips: voice input, container workflows, conversation cloning, multi-model |
| Claude Code Ultimate Guide | Florian BRUNIAUX | Beginner-to-power-user guide, templates, quizzes, cheatsheet |
| Claude CodePro | Max Ritter | Spec-driven, TDD, cross-session memory, semantic search, hooks |
| ClaudoPro Directory | ghost | Hooks, slash commands, subagents for specialized tasks |
| Context Priming | disler | Systematic project context priming commands |
| Design Review Workflow | Patrick Ellis | Automated UI/UX review: responsive, accessibility subagents |
| Laravel TALL Stack Starter | tott | Tailwind + AlpineJS + Laravel + Livewire intelligent assistance |
| learn-faster-kit | Hugo Lau | FASTER self-teaching framework: active learning, spaced repetition |
| RIPER Workflow | Tony Narlock | Research → Innovate → Plan → Execute → Review phases |
| Simone | Helmi | Project management system: docs, guidelines, planning processes |
| **Ralph Wiggum** | various | Autonomous loop technique — runs agent until spec is fulfilled |
| awesome-ralph | Martin Joly | Curated list of Ralph resources |
| ralph-orchestrator | mikeyobrien | Ralph loop with circuit breakers, rate limiting, 75+ tests |

---

## Tooling

### General
| Name | What It Does |
|------|-------------|
| cc-sessions | Opinionated productive dev with Claude Code |
| cc-tools | Go-based hooks/utilities: linting, testing, statusline |
| ccexp | TUI for discovering/managing CC config files and commands |
| cchistory | Lists all bash commands Claude ran in a session |
| Claude Code Templates | Full collection of all categories + usage dashboard + analytics |
| Claude Hub | Webhook → GitHub PR/issue @mention integration |
| claude-code-tools | Session continuity, context recovery, Rust full-text search, tmux skill |
| claudekit | Auto-save checkpoints, 20+ subagents (oracle/gpt-5, code-reviewer, ts-expert) |
| Container Use | Safe isolated dev environments for multiple agents (by dagger) |
| recall | Full-text search Claude Code sessions in terminal |
| Rulesync | Auto-generate/convert configs between Claude Code and other AI agents |
| run-claude-docker | Docker runner forwarding workspace to isolated container |
| SuperClaude | Commands, cognitive personas, "Introspection" and "Orchestration" modes |
| Vibe-Log | Analyzes prompts, session analytics, pretty HTML reports, statusline |
| VoiceMode MCP | Natural voice conversation with Claude Code (Whisper.cpp + Kokoro) |

### IDE Integrations
- **Claude Code Chat** (VS Code) — elegant chat interface
- **claude-code-ide.el** (Emacs) — ediff suggestions, LSP diagnostics, MCP tools
- **claude-code.nvim** (Neovim) — seamless CC integration
- **Claudix** (VS Code) — Vue 3/TS extension with session mgmt, file ops, streaming

### Usage Monitors
- **ccflare / better-ccflare** — beautiful web dashboard, comprehensive metrics
- **CC Usage** (ryoppippi) — CLI cost/token dashboard from local logs
- **Claude Code Usage Monitor** — real-time terminal: burn rate, predictions, progress bars
- **Claudex** — browser for conversation history, full-text search, local/no telemetry

### Orchestrators
| Name | What It Does |
|------|-------------|
| Auto-Claude | Full SDLC automation, kanban UI, agent orchestration |
| Claude Squad | Terminal app managing multiple CC/Codex/Aider agents in parallel workspaces |
| Claude Swarm | CC session connected to swarm of CC agents |
| Claude Task Master | Task mgmt for AI-driven dev, works with Cursor |
| Happy Coder | Spawn/control multiple CCs from phone/desktop with push notifications |
| Ruflo | Multi-agent swarms, vector memory, self-learning, security guardrails |
| TSK | Rust CLI delegating tasks to agents in sandboxed Docker, returns git branches |

### Config Managers
- **claude-rules-doctor** — detects dead `.claude/rules/` files with broken glob patterns
- **ClaudeCTX** — switch entire CC configuration with one command

---

## Hooks

| Name | What It Does |
|------|-------------|
| Britfix | Converts American → British English in comments/docstrings only |
| CC Notify | Desktop notifications for input needs / task completion + VS Code jump |
| cchooks | Python SDK simplifying hook writing |
| Claude Code Hook Comms | Multi-agent @-mention communication via hooks |
| claude-hooks | TypeScript system for flexible hook configuration |
| Claudio | OS-native sounds via hooks (joy!) |
| Dippy | AST-based auto-approve safe bash, prompt destructive ops — fixes permission fatigue |
| parry | Prompt injection scanner (early dev) |
| TDD Guard | Monitors file ops, blocks changes violating TDD principles |
| TypeScript Quality Hooks | TS compile + ESLint auto-fix + Prettier, SHA256 config caching |

---

## Slash Commands

### Version Control & Git
`/commit`, `/commit-fast`, `/create-pr`, `/create-pull-request`, `/create-worktrees`, `/fix-github-issue`, `/fix-issue`, `/fix-pr`, `/husky`, `/update-branch-name`, `/analyze-issue`

### Code Analysis & Testing
`/check`, `/code_analysis`, `/optimize`, `/repro-issue`, `/tdd`, `/tdd-implement`

### Context Loading & Priming
`/context-prime`, `/initref`, `/load-llms-txt`, `/prime`, `/rsi`

### Documentation
`/add-to-changelog`, `/create-docs`, `/docs`, `/explain-issue-fix`, `/update-docs`

### CI / Deployment
`/release`, `/run-ci`

### Project & Task Management
`/create-command`, `/create-prp`, `/do-issue`, `/prd-generator`, `/todo`

### Miscellaneous
`/create-hook`, `/mermaid` (SQL schema → Mermaid ER diagrams), `/linux-desktop-slash-commands`

---

## CLAUDE.md File Templates

### Language-Specific (good reference patterns)
- **HASH** (hashintel) — Rust docs, PR review process
- **LangGraphJS** (langchain-ai) — TypeScript, monorepo, yarn workspaces
- **Metabase** — Clojure REPL-driven development
- **Giselle** — pnpm + Vitest, naming conventions
- **pre-commit-hooks** (aRustyDev) — **exemplary CLAUDE.md** — thorough but not verbose, no ALL-CAPS shouting

### Domain-Specific
- **Design Review Workflow** (Patrick Ellis) — UI/UX review with subagents
- **Network Chronicles** — AI game character integration

### Project Scaffolding & MCP
- **Basic Memory** — MCP for bidirectional LLM-markdown knowledge base
- **claude-code-mcp-enhanced** — emphatic coding agent instructions with compliance checks

---

## Alternative Clients
- **Crystal** (stravu) — desktop app for orchestrating/monitoring CC agents
- **Omnara** — command center syncing CC across terminal, web, mobile; team collab
- **Claude Squad** — terminal multi-agent manager
- **claude-tmux** — tmux popup of all CC instances with git worktree/PR support
- **claude-esp** — streams CC hidden output (thinking, tool calls, subagents) to separate terminal

---

## Key Patterns & Techniques to Know

1. **Ralph Wiggum Loop** — run agent autonomously against a prompt file until task complete; use circuit breakers + rate limits
2. **Context Priming** — load `/prime` or `/context-prime` at session start with project structure + key docs
3. **Spec-Driven Development** — write spec first, Claude implements against it (AB Method, RIPER, Claude CodePro)
4. **Hook-Based Quality Gates** — TDD Guard, TypeScript Quality Hooks block bad changes automatically
5. **Multi-Agent Parallelism** — dispatch parallel auditors (security, perf, test coverage) simultaneously
6. **Session Continuity** — `recall`, `claude-code-tools`, `claudekit` restore context across sessions
7. **Container Safety** — `run-claude-docker`, `viwo-cli`, Container Use for `--dangerously-skip-permissions`
8. **`/common-ground` pattern** — surface Claude's hidden assumptions about your project before coding
