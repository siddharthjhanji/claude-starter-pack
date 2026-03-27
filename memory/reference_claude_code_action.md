---
name: Claude Code Action (GitHub Action)
description: GitHub Action for automating Claude on PRs/issues — @claude mentions, auto PR review, CI fixes, issue triage. Cloned at /tmp/claude-code-action.
type: reference
---

Repo: https://github.com/anthropics/claude-code-action
Usage: `anthropics/claude-code-action@v1`
License: MIT

## What It Does
GitHub Action that lets Claude respond to @claude mentions on issues/PRs (tag mode) OR run automated tasks via `prompt` input (agent mode). Mode is auto-detected.

## Two Modes (Auto-detected)
- **Tag mode**: triggered by `@claude` in comments/issues/PRs — Claude sees full context and responds interactively
- **Agent mode**: triggered when `prompt:` input is provided — Claude runs a task autonomously

## Quickstart
Run `/install-github-app` in Claude Code terminal, OR:
1. Install https://github.com/apps/claude on your repo
2. Add `ANTHROPIC_API_KEY` to repo secrets
3. Copy `examples/claude.yml` to `.github/workflows/`

## Minimal Workflow (claude.yml)
```yaml
name: Claude Code
on:
  issue_comment:
    types: [created]
  pull_request_review_comment:
    types: [created]
  issues:
    types: [opened, assigned]
  pull_request_review:
    types: [submitted]

jobs:
  claude:
    if: |
      (github.event_name == 'issue_comment' && contains(github.event.comment.body, '@claude')) ||
      (github.event_name == 'pull_request_review_comment' && contains(github.event.comment.body, '@claude')) ||
      (github.event_name == 'pull_request_review' && contains(github.event.review.body, '@claude')) ||
      (github.event_name == 'issues' && (contains(github.event.issue.body, '@claude') || contains(github.event.issue.title, '@claude')))
    runs-on: ubuntu-latest
    permissions:
      contents: write
      pull-requests: write
      issues: write
      id-token: write
      actions: read
    steps:
      - uses: actions/checkout@v6
        with: { fetch-depth: 1 }
      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
```

## Key Inputs
| Input | Purpose | Default |
|---|---|---|
| `anthropic_api_key` | Anthropic API key | - |
| `prompt` | Task for agent mode | - |
| `claude_args` | CLI args (model, tools, max-turns) | "" |
| `trigger_phrase` | What triggers Claude | `@claude` |
| `track_progress` | Show checkbox progress | false |
| `use_sticky_comment` | Single comment vs many | false |
| `settings` | JSON settings (env, hooks, perms) | "" |
| `additional_permissions` | e.g. `actions: read` for CI | "" |
| `use_bedrock` / `use_vertex` / `use_foundry` | Cloud provider auth | false |
| `allowed_bots` | Bot usernames allowed to trigger | "" |
| `plugins` | Plugin names to install | "" |
| `plugin_marketplaces` | Plugin marketplace Git URLs | "" |

## Key Outputs
- `structured_output` — JSON from `--json-schema` in claude_args
- `branch_name` — branch Claude created
- `session_id` — for `--resume`
- `execution_file` — path to output file

## Common claude_args Patterns
```yaml
claude_args: |
  --model claude-sonnet-4-6
  --max-turns 10
  --allowedTools "Bash(npm install),Bash(npm run test),Edit,Read,Write"
  --system-prompt "Follow our coding standards"
  --json-schema '{"type":"object","properties":{"is_flaky":{"type":"boolean"}}}'
  --mcp-config '{"mcpServers": {"my-server": {"command": "npx", "args": ["-y", "@example/server"]}}}'
```

## Automation Patterns

### PR Review (auto on PR open)
```yaml
on:
  pull_request:
    types: [opened, synchronize, ready_for_review]
jobs:
  review:
    runs-on: ubuntu-latest
    permissions: { contents: read, pull-requests: write, id-token: write }
    steps:
      - uses: actions/checkout@v6
        with: { fetch-depth: 1 }
      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          track_progress: true
          prompt: |
            REPO: ${{ github.repository }}
            PR NUMBER: ${{ github.event.pull_request.number }}
            Review this PR for code quality, security, performance, tests, and docs.
          claude_args: |
            --allowedTools "mcp__github_inline_comment__create_inline_comment,Bash(gh pr comment:*),Bash(gh pr diff:*),Bash(gh pr view:*)"
```

### Issue Triage (auto-label)
```yaml
on:
  issues:
    types: [opened]
jobs:
  triage:
    runs-on: ubuntu-latest
    permissions: { issues: write, id-token: write }
    steps:
      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
          prompt: |
            ISSUE NUMBER: ${{ github.event.issue.number }}
            REPO: ${{ github.repository }}
            Label this issue with appropriate labels (bug, enhancement, documentation, etc.)
          claude_args: |
            --allowedTools "Bash(gh issue edit:*),Bash(gh issue view:*),Bash(gh label list:*)"
```

### CI Failure Auto-Fix
```yaml
on:
  workflow_run:
    workflows: ["CI"]
    types: [completed]
permissions:
  contents: write
  pull-requests: write
  actions: read
# ... then use prompt to analyze and fix the failure
```

### Structured Output
```yaml
- id: analyze
  uses: anthropics/claude-code-action@v1
  with:
    anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
    prompt: "Check if this is a flaky test. Return: is_flaky (bool), confidence (0-1), summary (string)"
    claude_args: |
      --json-schema '{"type":"object","properties":{"is_flaky":{"type":"boolean"},"confidence":{"type":"number"},"summary":{"type":"string"}}}'
- if: fromJSON(steps.analyze.outputs.structured_output).is_flaky == true
  run: gh workflow run CI
```

## Built-in Commands (.claude/commands/)
- `/review-pr` — Comprehensive review using 5 subagents (code-quality, performance, test-coverage, docs, security)
- `/commit-and-pr` — Commit changes and create PR
- `/label-issue` — Triage and label issues

## Built-in Agents (.claude/agents/)
- `code-quality-reviewer` — Clean code, error handling, maintainability, SOLID principles
- `security-code-reviewer` — Vulnerability analysis, OWASP, input sanitization
- `test-coverage-reviewer` — Test quality, coverage gaps, edge cases
- `performance-reviewer` — Bottlenecks, DB queries, memory issues
- `documentation-accuracy-reviewer` — Docs accuracy, README, API docs

## Security Notes
- Runs on YOUR GitHub runner, not Anthropic's
- Never commit API keys — always use `${{ secrets.ANTHROPIC_API_KEY }}`
- `allowed_non_write_users: '*'` is risky — only for limited-permission workflows
- Commit signing: use `use_commit_signing: true` (simple) or `ssh_signing_key` (full git CLI)
- Custom GitHub App: need Contents/Issues/PRs Read+Write permissions

## Cloud Providers
- **AWS Bedrock**: `use_bedrock: true` + OIDC auth + `AWS_REGION` env
- **Google Vertex AI**: `use_vertex: true` + OIDC + `ANTHROPIC_VERTEX_PROJECT_ID`
- **Microsoft Foundry**: `use_foundry: true` + `ANTHROPIC_FOUNDRY_RESOURCE`
