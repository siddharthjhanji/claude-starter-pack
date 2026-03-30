---
name: oh-my-claudecode (OMC)
description: Multi-agent orchestration layer for Claude Code — Team pipelines, magic keywords, 19 agents, 32 skills, CLI tools, hooks, multi-AI (Codex/Gemini)
type: reference
---

## Overview
**oh-my-claudecode (OMC)** — Teams-first multi-agent orchestration for Claude Code. Zero learning curve.
- Repo: https://github.com/yeachan-heo/oh-my-claudecode
- npm package: `oh-my-claude-sisyphus` (note: NOT oh-my-claudecode)
- Current version: 4.9.3
- CLI binary: `omc`

## Installation
```bash
# Marketplace (recommended)
/plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode
/plugin install oh-my-claudecode

# npm
npm i -g oh-my-claude-sisyphus@latest
```

## Setup
```bash
/setup
/omc-setup
```

## Orchestration Modes

| Mode | What | Use For |
|------|------|---------|
| **Team** (canonical) | Staged pipeline: team-plan→team-prd→team-exec→team-verify→team-fix | Coordinated multi-agent tasks |
| **omc team** (CLI) | tmux workers: claude/codex/gemini processes in split panes | Codex/Gemini CLI tasks |
| **ccg** | Tri-model: /ask codex + /ask gemini, Claude synthesizes | Mixed backend+UI |
| **Autopilot** | Autonomous single lead agent | End-to-end feature work |
| **Ultrawork (ulw)** | Max parallelism | Burst parallel fixes/refactors |
| **Ralph** | Persistent verify/fix loops | Tasks that must fully complete |
| **Pipeline** | Sequential staged processing | Multi-step transformations |

Enable Teams in `~/.claude/settings.json`:
```json
{ "env": { "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1" } }
```

## Magic Keywords (auto-detected in prompts)

| Keyword | Effect |
|---------|--------|
| `autopilot` | Full autonomous execution |
| `ralph` | Persistence mode (includes ultrawork) |
| `ulw` | Maximum parallelism |
| `ralplan` | Iterative planning consensus |
| `deep-interview` | Socratic requirements clarification |
| `deepsearch` | Codebase-focused search routing |
| `ultrathink` | Deep reasoning mode |
| `cancelomc` / `stopomc` | Stop active OMC modes |
| `deslop` / `ai-slop-cleaner` | Clean AI-generated slop |
| `tdd` | Test-driven development mode |

Team orchestration is EXPLICIT via `/team` (no keyword trigger).

## CLI Tools
```bash
omc team N:codex|gemini|claude "task"   # tmux CLI workers
omc ask claude|codex|gemini "prompt"    # Provider advisor, saves to .omc/artifacts/ask/
omc wait [--start|--stop]               # Rate limit auto-resume daemon
omc hud                                 # Live HUD rendering
omc team status <name>                  # Check team status
omc team shutdown <name>                # Shutdown team
```

## 19 Specialized Agents (prefix: `oh-my-claudecode:`)
explore (haiku), analyst (opus), planner (opus), architect (opus), debugger (sonnet), executor (sonnet), verifier (sonnet), tracer (sonnet), security-reviewer (sonnet), code-reviewer (opus), test-engineer (sonnet), designer (sonnet), writer (haiku), qa-tester (sonnet), scientist (sonnet), document-specialist (sonnet), git-master (sonnet), code-simplifier (opus), critic (opus)

## 32 Skills (invoke via `/oh-my-claudecode:<name>`)
Workflow: autopilot, ralph, ultrawork, team, ccg, ultraqa, omc-plan, ralplan, sciomc, external-context, deepinit, deep-interview, ai-slop-cleaner
Utilities: ask-codex, ask-gemini, cancel, note, learner, omc-setup, mcp-setup, hud, omc-doctor, omc-help, trace, release, project-session-manager, skill, writer-memory, ralph-init, configure-notifications, learn-about-omc

## Custom Skills (user-defined)
```yaml
# .omc/skills/my-skill.md
---
name: Skill Name
description: what it does
triggers: ["keyword1", "keyword2"]
source: extracted
---
Content...
```
- Project scope: `.omc/skills/` (higher priority, version-controlled)
- User scope: `~/.omc/skills/` (all projects)
- Auto-inject: matching skills load into context by trigger keywords
- Manage: `/skill list|add|remove|edit|search`
- Auto-learn: `/learner` extracts patterns with quality gates

## Hooks (hooks.json)
| Event | Scripts |
|-------|---------|
| UserPromptSubmit | keyword-detector, skill-injector |
| SessionStart | session-start, project-memory-session, setup-init (init), setup-maintenance (maintenance) |
| PreToolUse | pre-tool-enforcer |
| PermissionRequest (Bash) | permission-handler |
| PostToolUse | post-tool-verifier, project-memory-posttool |
| PostToolUseFailure | post-tool-use-failure |
| SubagentStart/Stop | subagent-tracker, verify-deliverables |
| PreCompact | pre-compact, project-memory-precompact |
| Stop | context-guard-stop, persistent-mode, code-simplifier |
| SessionEnd | session-end |

## State Management (`.omc/` directory)
- `.omc/state/` — mode state JSON files
- `.omc/notepad.md` — session-persistent notes
- `.omc/project-memory.json` — cross-session knowledge
- `.omc/plans/` — PRD and test-spec planning docs
- `.omc/sessions/*.json` — session summaries
- `.omc/state/agent-replay-*.jsonl` — replay logs
- `.omc/artifacts/ask/` — provider advisor outputs

## MCP Tools Available (after `omc setup`)
- State: `state_read/write/clear/list_active/get_status`
- Memory: `project_memory_read/write/add_note/add_directive`
- Notepad: `notepad_read/write_priority/write_working/write_manual/prune/stats`
- Code Intel: `lsp_hover/goto_definition/find_references/diagnostics`, `ast_grep_search/replace`, `python_repl`
- Trace: `trace_timeline`, `trace_summary`
- Teams: `TeamCreate/Delete`, `SendMessage`, `TaskCreate/List/Get/Update`

## Multi-AI Orchestration (optional)
- Gemini CLI: `npm install -g @google/gemini-cli` — UI/docs, 1M token context
- Codex CLI: `npm install -g @openai/codex` — code review, architecture
- ~$60/month for 3 Pro plans (Claude + Gemini + ChatGPT)

## Notifications
```bash
omc config-stop-callback telegram --enable --token <tok> --chat <id>
omc config-stop-callback discord --enable --webhook <url>
omc config-stop-callback slack --enable --webhook <url>
```

## OpenClaw Integration
Forward session events to OpenClaw gateway for automated responses.
Config: `~/.claude/omc_config.openclaw.json`
Events: session-start, stop, keyword-detector, ask-user-question, pre-tool-use, post-tool-use

## Commit Protocol (OMC style)
Conventional commit + trailers:
- `Constraint:` — active constraint that shaped the decision
- `Rejected:` — alternative | reason rejected
- `Directive:` — warning for future modifiers
- `Confidence:` high|medium|low
- `Scope-risk:` narrow|moderate|broad
- `Not-tested:` uncovered edge cases

## Key Patterns
- **ralplan-first**: when ralph is active, PRD + test-spec must exist before any implementation
- **separate passes**: writer pass creates content, reviewer/verifier evaluates — never self-approve
- **visual iteration**: use `$visual-verdict` every iteration for visual tasks
- **model routing**: haiku=quick lookups, sonnet=standard, opus=architecture/deep analysis
- Kill switches: `DISABLE_OMC`, `OMC_SKIP_HOOKS` (comma-separated)
