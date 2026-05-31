---
name: spec-kit
description: "GitHub Spec Kit — Spec-Driven Development CLI (`specify` v0.8.18). Per-project workflow with 9 commands (constitution, specify, clarify, plan, tasks, analyze, checklist, implement, taskstoissues). Installed via uv, NOT vendored to ~/.claude/skills/ to avoid overlap with GSD/SPARC/Superpowers."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# GitHub Spec Kit (`specify` CLI)

Repo: https://github.com/github/spec-kit
Installed: 2026-05-30 via `uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@v0.8.18`
Binary: `specify` (in `~/.local/bin/specify` or wherever uv puts it)

## Why CLI only, NOT vendored as skills

Already have 3 spec-driven dev frameworks:
- [[reference_gsd]] — GSD (Get Shit Done), 57 commands, Discuss→Plan→Execute→Verify→Ship
- [[sparc-methodology]] — Specification, Pseudocode, Architecture, Refinement, Completion
- [[using-superpowers]] / [[brainstorming]] / [[writing-plans]] / [[executing-plans]] — Obra Superpowers subagent-driven flow

Spec-Kit would be the 4th. Vendoring its 9 commands into `~/.claude/skills/` would shadow GSD commands and require `.specify/` scripts that don't exist globally. The official install pattern is **per-project**: `specify init my-project --integration claude` writes the right files into that project's `.claude/` and `.specify/`.

## When to use spec-kit (over GSD)

| Pick spec-kit when... | Pick GSD when... |
|---|---|
| Working with a team that wants a single canonical SDD methodology (GitHub-published, stable) | You want maximum command surface (57 commands) and tighter context-rot avoidance |
| Want auto-conversion from tasks.md → GitHub Issues (`/taskstoissues`) | All work stays inside the editor |
| Need cross-artifact consistency checking (`/analyze`) | You don't need post-spec analysis |
| Project lives on GitHub and uses GitHub Issues as the truth source | You don't use GitHub Issues heavily |

## How to use on a new project

```bash
# Initialize a new project with the Claude Code integration
specify init my-project --integration claude
cd my-project

# This installs into the project:
#   .claude/skills/{constitution,specify,clarify,plan,tasks,analyze,checklist,implement,taskstoissues}/SKILL.md
#   .specify/                  ← project state, hooks, integration catalogs
#   scripts/bash/check-prerequisites.sh

# Then in Claude Code (within that project) you can use:
#   /constitution               → set project principles
#   /specify <feature-desc>     → create spec.md from natural language
#   /clarify                    → 5 forced clarifying questions
#   /plan                       → generate plan.md
#   /tasks                      → generate tasks.md (dependency-ordered)
#   /analyze                    → consistency check spec↔plan↔tasks
#   /checklist                  → feature checklist
#   /implement                  → execute the plan
#   /taskstoissues              → push tasks.md → GitHub Issues
```

## Unique value pieces (vs GSD)

1. **`/taskstoissues`** — auto-creates GitHub issues from tasks.md via `github/github-mcp-server`. No equivalent in GSD.
2. **`/clarify`** — forces 5 targeted clarifying questions to fill spec gaps. Complements [[brainstorming]] from Superpowers.
3. **`/analyze`** — cross-artifact consistency check. Unique.
4. **`/constitution`** — project-principles doc kept in sync with templates.

## Other commands

```bash
specify check              # verify required tools
specify integration list   # browse available integrations (claude, copilot, gemini, cursor, codex, etc.)
specify extension list     # browse extensions
specify preset list        # browse presets (project templates)
specify workflow list      # built-in automation workflows
specify self check         # self-diagnose CLI install
```

## Catalog of integrations

Spec-Kit supports: Claude Code, GitHub Copilot, Gemini CLI, Cursor, Windsurf, Amp, Codex CLI, plus community integrations.

## When NOT to use

- Single-developer side project — overhead > benefit; just code
- Quick bugfix — use [[focused-fix]] or [[karpathy-guidelines]] instead
- Anything where you already have a working GSD plan — don't switch mid-flight

## Cross-reference

For the **vendored-skills equivalent** of this workflow, use the [[reference_gsd]] commands (which are already in `~/.claude/skills/` via the GSD install). Spec-kit and GSD are alternatives, not stackable.
