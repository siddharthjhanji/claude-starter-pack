---
name: Claude Code Security Review
description: Anthropic's AI-powered security review — /security-review slash command (installed globally) + GitHub Action for automated PR scanning
type: reference
---

Source: https://github.com/anthropics/claude-code-security-review
Action: `anthropics/claude-code-security-review@main`

## Slash Command (installed)
`/security-review` is installed at `~/.claude/commands/security-review.md`
- Runs on current branch diff vs origin/HEAD
- 3-phase: vulnerability identification → parallel false-positive filtering subtasks → confidence filter (≥8/10)
- Allowed tools: git diff/log/show/status, Read, Glob, Grep, LS, Task

## GitHub Action Setup (per-repo)
Add `.github/workflows/security.yml`:
```yaml
name: Security Review
permissions:
  pull-requests: write
  contents: read
on:
  pull_request:
jobs:
  security:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          ref: ${{ github.event.pull_request.head.sha || github.sha }}
          fetch-depth: 2
      - uses: anthropics/claude-code-security-review@main
        with:
          comment-pr: true
          claude-api-key: ${{ secrets.CLAUDE_API_KEY }}
```

## Key Action Inputs
| Input | Default | Notes |
|-------|---------|-------|
| `claude-api-key` | — | Required. Use `${{ secrets.CLAUDE_API_KEY }}` |
| `comment-pr` | true | Posts findings as PR comment |
| `upload-results` | true | Saves results as artifact |
| `exclude-directories` | — | Comma-separated dirs to skip |
| `claude-model` | claude-opus-4-1-20250805 | Can override model |
| `claudecode-timeout` | 20 | Minutes |
| `run-every-commit` | false | true = more false positives |
| `false-positive-filtering-instructions` | — | Path to custom filter file |
| `custom-security-scan-instructions` | — | Path to custom scan instructions |

## Vulnerabilities Detected
- SQL/command/XXE/template/NoSQL injection, path traversal
- Auth bypass, privilege escalation, IDOR, JWT flaws
- Hardcoded secrets, weak crypto, cert validation bypass
- RCE via deserialization, pickle/eval injection
- XSS (reflected, stored, DOM-based)
- Sensitive data logging, PII exposure

## Auto-Excluded (not reported)
DoS, rate limiting, memory exhaustion, outdated dependencies, Rust memory safety, test files, log spoofing, SSRF path-only, regex injection, open redirects (unless extremely high confidence)

## Security Warning
⚠️ Not hardened against prompt injection. Only use on trusted PRs. Set repo to "Require approval for all external contributors."
