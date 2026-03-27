---
name: GET SHIT DONE (GSD)
description: Meta-prompting, context engineering, and spec-driven development system for Claude Code — solves context rot via fresh subagent contexts, wave-based parallel execution, and structured Discuss→Plan→Execute→Verify→Ship workflow.
type: reference
---

Repo: https://github.com/gsd-build/get-shit-done
Install: `npx get-shit-done-cc@latest`
License: MIT | Author: TÂCHES

---

## What It Solves

**Context rot** — quality degradation as Claude fills its context window. GSD runs heavy work (research, planning, execution, verification) in fresh subagent contexts (200k tokens each). Your main session stays at 30-40% context.

Multi-platform: Claude Code, OpenCode, Gemini CLI, Codex, Copilot, Cursor, Windsurf, Antigravity.

---

## Install

```bash
npx get-shit-done-cc@latest
# Interactive: choose runtime + global/local
# Or non-interactive:
npx get-shit-done-cc --claude --global   # ~/.claude/
npx get-shit-done-cc --claude --local    # ./.claude/
```

Verify: `/gsd:help`

Recommended mode:
```bash
claude --dangerously-skip-permissions
```

---

## Core Workflow: Discuss → Plan → Execute → Verify → Ship

### 1. New Project
```
/gsd:new-project
```
Questions → Research (parallel agents) → Requirements → Roadmap → Approval
Creates: `PROJECT.md`, `REQUIREMENTS.md`, `ROADMAP.md`, `STATE.md`, `.planning/research/`

**Existing codebase?** Run `/gsd:map-codebase` first — spawns parallel agents to analyze stack, architecture, conventions.

### 2. Discuss Phase
```
/gsd:discuss-phase [N] [--batch] [--auto] [--analyze]
```
Captures your implementation preferences BEFORE planning. System identifies gray areas by feature type:
- Visual features → layout, density, interactions, empty states
- APIs/CLIs → response format, flags, error handling
- Content systems → structure, tone, depth

Output `CONTEXT.md` feeds researcher + planner. The deeper you go, the more it builds YOUR vision.

`--batch`: Answer grouped questions at once instead of one-by-one
`assumptions` mode: Set `workflow.discuss_mode=assumptions` → reads codebase first, only asks you to correct wrong assumptions

Creates: `{phase_num}-CONTEXT.md`

### 3. Plan Phase
```
/gsd:plan-phase [N] [--auto] [--reviews] [--skip-research] [--skip-verify]
```
Research (guided by CONTEXT.md) → Create 2-3 atomic plans (XML structure) → Verify plans → Loop until pass

Each plan = small enough for a fresh context window.

Creates: `{phase_num}-RESEARCH.md`, `{phase_num}-{N}-PLAN.md`

**XML Plan format:**
```xml
<task type="auto">
  <name>Create login endpoint</name>
  <files>src/app/api/auth/login/route.ts</files>
  <action>
    Use jose for JWT (not jsonwebtoken - CommonJS issues).
    Validate credentials against users table.
    Return httpOnly cookie on success.
  </action>
  <verify>curl -X POST localhost:3000/api/auth/login returns 200 + Set-Cookie</verify>
  <done>Valid credentials return cookie, invalid return 401</done>
</task>
```

### 4. Execute Phase
```
/gsd:execute-phase <N>
```
Runs plans in **waves** — parallel where possible, sequential when dependent. Each executor gets fresh 200k context. Atomic git commit per task.

**Wave execution:**
```
WAVE 1 (parallel)       WAVE 2 (parallel)       WAVE 3
Plan 01 + Plan 02   →   Plan 03 + Plan 04   →   Plan 05
(User Model)            (Orders API)             (Checkout UI)
(Product Model)         (Cart API)               depends on 03+04
```

Prefer vertical slices (end-to-end feature) over horizontal layers (all models first) for better parallelism.

Creates: `{phase_num}-{N}-SUMMARY.md`, `{phase_num}-VERIFICATION.md`

Commit format: `feat(08-02): add email confirmation flow`

### 5. Verify Work
```
/gsd:verify-work [N]
```
Extracts testable deliverables → walk through one at a time → yes/no or describe what's wrong → auto-diagnose failures → create fix plans → re-run execute.

Creates: `{phase_num}-UAT.md`, fix plans if issues found

### 6. Ship → Complete → Next
```
/gsd:ship [N] [--draft]         # Create PR from verified phase work
/gsd:complete-milestone          # Archive milestone, tag release
/gsd:new-milestone [name]        # Start next version
/gsd:next                        # Auto-detect and run next step
```

---

## Quick Mode
```
/gsd:quick [--full] [--discuss] [--research]
> What do you want to do? "Add dark mode toggle"
```

Ad-hoc tasks without full planning. Lives in `.planning/quick/001-task-name/`.
- `--discuss`: Gather gray areas before planning
- `--research`: Investigate approaches before planning
- `--full`: Enable plan-checking + verification

---

## Fast Mode
```
/gsd:fast <text>
```
Inline trivial tasks — skips planning entirely, executes immediately.

---

## Autonomous Mode
```
/gsd:autonomous [--from N]
```
Runs ALL remaining phases: discuss→plan→execute per phase. Pauses only for blockers/user decisions. After all phases: milestone audit → complete → cleanup.

---

## All Commands (57 total)

### Core Workflow
| Command | What it does |
|---------|--------------|
| `/gsd:new-project [--auto]` | Full init: questions → research → requirements → roadmap |
| `/gsd:discuss-phase [N]` | Capture implementation decisions |
| `/gsd:plan-phase [N]` | Research + plan + verify |
| `/gsd:execute-phase <N>` | Execute parallel waves |
| `/gsd:verify-work [N]` | Manual UAT |
| `/gsd:ship [N] [--draft]` | Create PR |
| `/gsd:next` | Auto-advance to next step |
| `/gsd:fast <text>` | Inline trivial task |
| `/gsd:autonomous [--from N]` | Run all phases hands-free |
| `/gsd:complete-milestone` | Archive + tag release |
| `/gsd:new-milestone [name]` | Start next version |
| `/gsd:forensics [desc]` | Post-mortem for failed workflow runs |
| `/gsd:milestone-summary [ver]` | Summary for team onboarding |
| `/gsd:audit-milestone` | Verify milestone definition of done |

### Phase Management
| Command | What it does |
|---------|--------------|
| `/gsd:add-phase` | Append phase to roadmap |
| `/gsd:insert-phase [N]` | Insert between phases |
| `/gsd:remove-phase [N]` | Remove future phase |
| `/gsd:list-phase-assumptions [N]` | See intended approach before planning |
| `/gsd:plan-milestone-gaps` | Create phases to close audit gaps |
| `/gsd:research-phase [N]` | Research only, no plan |

### UI Design
| Command | What it does |
|---------|--------------|
| `/gsd:ui-phase [N]` | Generate UI design contract (UI-SPEC.md) |
| `/gsd:ui-review [N]` | 6-pillar visual audit of implemented frontend |

### Session / Navigation
| Command | What it does |
|---------|--------------|
| `/gsd:progress` | Where am I? What's next? |
| `/gsd:pause-work` | Create handoff (HANDOFF.json) |
| `/gsd:resume-work` | Restore from last session |
| `/gsd:session-report` | Summary of work performed |
| `/gsd:health [--repair]` | Validate .planning/ integrity |
| `/gsd:stats` | Phase/plan/requirements/git metrics |
| `/gsd:manager` | Interactive command center |

### Workstreams & Workspaces
| Command | What it does |
|---------|--------------|
| `/gsd:workstreams list/create/switch/complete` | Parallel milestone workstreams |
| `/gsd:new-workspace` | Isolated workspace with repo worktrees |
| `/gsd:list-workspaces` | Show all workspaces |
| `/gsd:remove-workspace` | Remove + clean up |

### Code Quality
| Command | What it does |
|---------|--------------|
| `/gsd:review` | Cross-AI peer review |
| `/gsd:pr-branch` | Clean PR branch (filters .planning/ commits) |
| `/gsd:audit-uat` | Find phases missing UAT |
| `/gsd:debug [desc]` | Systematic debugging with persistent state |

### Backlog & Threads
| Command | What it does |
|---------|--------------|
| `/gsd:plant-seed <idea>` | Capture forward-looking ideas (surfaces at right milestone) |
| `/gsd:add-backlog <desc>` | Parking lot (999.x numbering) |
| `/gsd:review-backlog` | Promote or remove backlog items |
| `/gsd:thread [name]` | Persistent cross-session context threads |

### Utilities
| Command | What it does |
|---------|--------------|
| `/gsd:settings` | Configure model profile + workflow toggles |
| `/gsd:set-profile <profile>` | Switch model profile |
| `/gsd:do <text>` | Route freeform text to right GSD command |
| `/gsd:quick` | Ad-hoc task with GSD guarantees |
| `/gsd:add-todo [desc]` | Capture idea for later |
| `/gsd:check-todos` | List pending todos |
| `/gsd:note <text>` | Zero-friction idea capture |
| `/gsd:profile-user` | Developer behavioral profile |
| `/gsd:cleanup` | Clean up .planning/ artifacts |
| `/gsd:map-codebase [area]` | Analyze existing codebase |

---

## Configuration

File: `.planning/config.json` | Configure via `/gsd:settings`

### Core Settings
| Setting | Options | Default |
|---------|---------|---------|
| `mode` | `yolo`, `interactive` | `interactive` |
| `granularity` | `coarse`, `standard`, `fine` | `standard` |

### Model Profiles
| Profile | Planning | Execution | Verification |
|---------|----------|-----------|--------------|
| `quality` | Opus | Opus | Sonnet |
| `balanced` (default) | Opus | Sonnet | Sonnet |
| `budget` | Sonnet | Sonnet | Haiku |
| `inherit` | Inherit | Inherit | Inherit |

Switch: `/gsd:set-profile budget`

### Workflow Agents
| Setting | Default | What it does |
|---------|---------|--------------|
| `workflow.research` | `true` | Research domain before each phase |
| `workflow.plan_check` | `true` | Verify plans before execution |
| `workflow.verifier` | `true` | Confirm deliverables after execution |
| `workflow.auto_advance` | `false` | Auto-chain discuss→plan→execute |
| `workflow.discuss_mode` | `'discuss'` | `discuss` (interview) or `assumptions` (codebase-first) |
| `workflow.skip_discuss` | `false` | Skip discuss in autonomous mode |
| `workflow.text_mode` | `false` | Text-only (no TUI menus) |

### Git Branching
| Setting | Options | Default |
|---------|---------|---------|
| `git.branching_strategy` | `none`, `phase`, `milestone` | `none` |

### Execution
| Setting | Default |
|---------|---------|
| `parallelization.enabled` | `true` |
| `planning.commit_docs` | `true` |
| `hooks.context_warnings` | `true` |

### Agent Skills
```json
"agent_skills": {
  "executor": ["./skills/my-skill/"]
}
```
Inject project-specific skills into subagents at spawn time.

---

## Context Engineering Files

| File | Purpose |
|------|---------|
| `PROJECT.md` | Vision, always loaded |
| `REQUIREMENTS.md` | Scoped v1/v2 with phase traceability |
| `ROADMAP.md` | Where you're going, what's done |
| `STATE.md` | Decisions, blockers, session memory |
| `PLAN.md` | Atomic XML task with verify steps |
| `SUMMARY.md` | What happened, committed to history |
| `CONTEXT.md` | Implementation decisions per phase |
| `RESEARCH.md` | Domain investigation per phase |
| `todos/` | Ideas for later work |
| `threads/` | Cross-session context threads |
| `seeds/` | Forward-looking ideas (surfaces at right milestone) |

---

## 18 Subagents

`gsd-executor`, `gsd-planner`, `gsd-plan-checker`, `gsd-verifier`, `gsd-debugger`, `gsd-phase-researcher`, `gsd-project-researcher`, `gsd-roadmapper`, `gsd-codebase-mapper`, `gsd-ui-researcher`, `gsd-ui-auditor`, `gsd-ui-checker`, `gsd-nyquist-auditor`, `gsd-advisor-researcher`, `gsd-assumptions-analyzer`, `gsd-integration-checker`, `gsd-research-synthesizer`, `gsd-user-profiler`

---

## Key Design Principles

1. **Fresh context per plan** — Executors get 200k tokens with zero accumulated garbage. Main window stays at 30-40%.
2. **Vertical slices > horizontal layers** — Plan per feature end-to-end, not per layer (all models → all APIs → all UIs). Better wave parallelism.
3. **Atomic commits** — Every task gets its own commit. Git bisect finds exact failing task.
4. **Verify at every stage** — Plan checker before execute. Verifier after execute. UAT to confirm it works.
5. **No enterprise theater** — No sprint ceremonies or Jira workflows. Just describe what you want and build it.
