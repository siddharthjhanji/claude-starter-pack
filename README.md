# Claude Starter Pack

Everything needed to bootstrap a Claude Code instance with the same memory, commands, skills, and knowledge base from scratch.

## Quick Start

```bash
git clone https://github.com/siddharthjhanji/claude-starter-pack
cd claude-starter-pack
bash install.sh
```

The install script will:
- Copy all memory files to your Claude project memory directory
- Install the `/security-review` command globally
- Install all bundled skills in `skills/` to `~/.claude/skills/`
- Install GET SHIT DONE (GSD) and Firecrawl CLI via npx
- Print install instructions for any remaining external skills

---

## What's Included

### Memory Files (`memory/`)

Claude's persistent knowledge base — automatically loaded at session start.

| File | Contents |
|------|----------|
| `MEMORY.md` | Index of all memory entries |
| `reference_im8_brand.md` | IM8 brand colors, fonts, logos, CSS tokens |
| `feedback_im8_frontend_design.md` | IM8 design rules — luxury dark crimson aesthetic, gold shimmer |
| `reference_claude_mem.md` | claude-mem plugin — semantic memory via SQLite + Chroma |
| `reference_claude_code_action.md` | claude-code-action GitHub Action — @claude mentions, PR review |
| `reference_ui_ux_pro_max.md` | UI/UX Pro Max — 67 styles, 161 patterns, 99 UX rules |
| `reference_awesome_claude_code.md` | Awesome Claude Code directory — best skills, hooks, templates |
| `reference_security_review.md` | Security Review — /security-review command + GitHub Action |
| `reference_n8n_skills.md` | n8n Skills — 7 skills for n8n workflow building |
| `reference_geo_seo.md` | GEO-SEO Claude — 13 skills for Generative Engine Optimization |
| `reference_seomachine.md` | SEO Machine — 26 marketing skills, content pipeline |
| `reference_claude_skills.md` | alirezarezvani/claude-skills — 205 skills across 9 domains |
| `reference_youtube_clipper.md` | YouTube Clipper — video clipping + bilingual subtitles |
| `reference_gsd.md` | GET SHIT DONE — spec-driven dev, wave-based parallel execution |

> **IM8 brand always overrides generic UI/design recommendations.** When building anything for IM8, use the fonts, logos, and color scheme from `reference_im8_brand.md`.

### Commands (`commands/`)

Custom slash commands installed to `~/.claude/commands/`.

| Command | Description |
|---------|-------------|
| `/security-review` | 3-phase security audit of current branch changes |

### Bundled Skills (`skills/`)

All folders here are copied to `~/.claude/skills/` by `install.sh`. They cover three major buckets:

**Corey Haines' Marketing Skills** (32 skills) — full funnel: `seo-audit`, `ai-seo`, `programmatic-seo`, `copywriting`, `copy-editing`, `page-cro`, `signup-flow-cro`, `onboarding-cro`, `form-cro`, `popup-cro`, `paywall-upgrade-cro`, `paid-ads`, `ad-creative`, `email-sequence`, `cold-email`, `customer-research`, `churn-prevention`, `analytics-tracking`, `ab-test-setup`, `pricing-strategy`, `lead-magnets`, `free-tool-strategy`, `marketing-ideas`, `marketing-psychology`, `social-content`, `content-strategy`, `competitor-alternatives`, `referral-program`, `revops`, `sales-enablement`, `launch-strategy`, `schema-markup`, `site-architecture`, `product-marketing-context`.

**Firecrawl Blog's "Best Claude Code Skills 2026"** (12 collections, 47 individual skills) — see [Best Claude Code Skills](https://www.firecrawl.dev/blog/best-claude-code-skills):

| Source | Skills bundled |
|--------|----------------|
| **Firecrawl CLI** (firecrawl/firecrawl-cli) | `firecrawl-scrape`, `firecrawl-search`, `firecrawl-crawl`, `firecrawl-map`, `firecrawl-interact`, `firecrawl-parse`, `firecrawl-agent`, `firecrawl-monitor`, `firecrawl-download`, `firecrawl-cli` |
| **Karpathy Guidelines** (forrestchang/andrej-karpathy-skills) | `karpathy-guidelines` — think before coding, simplicity first, surgical changes, goal-driven execution |
| **Anthropic Frontend Design** (anthropics/skills) | `frontend-design` — bans Inter/Roboto, pushes bold aesthetic direction |
| **Obra Superpowers** (obra/superpowers) | `brainstorming`, `writing-plans`, `executing-plans`, `subagent-driven-development`, `test-driven-development`, `using-git-worktrees`, `requesting-code-review`, `receiving-code-review`, `dispatching-parallel-agents`, `systematic-debugging`, `verification-before-completion`, `finishing-a-development-branch`, `using-superpowers`, `writing-skills` |
| **Vercel Agent Skills** (vercel-labs/agent-skills) | `web-design-guidelines`, `react-best-practices`, `composition-patterns` |
| **Anthropic Document Skills** (anthropics/skills) | `pdf`, `docx`, `xlsx`, `pptx` |
| **Anthropic Webapp Testing** (anthropics/skills) | `webapp-testing` — Playwright-based local browser testing |
| **Trail of Bits Security** (trailofbits/skills) | `static-analysis`, `semgrep-rule-creator`, `semgrep-rule-variant-creator`, `variant-analysis`, `audit-context-building`, `spec-to-code-compliance`, `second-opinion`, `skill-improver`, `gh-cli`, `git-cleanup` |
| **Remotion Best Practices** (remotion-dev/skills) | `remotion-best-practices` — programmatic video in React |
| **Anthropic Skill Creator** (anthropics/skills) | `skill-creator` — interactive Q&A to build your own skills |

**Claude-Flow Tooling** (claude-flow v3.5) — `swarm-orchestration`, `swarm-advanced`, `hive-mind`, `sparc-methodology`, `v3-ddd-architecture`, `v3-swarm-coordination`, `neural-training`, `agentdb-memory-patterns`, `agentdb-vector-search`, `memory-management`, `hooks-automation`, `workflow-automation`, `verification-quality`, `performance-analysis`, `github-automation`, `github-code-review`, `pair-programming`, `skill-builder`, plus 7 agent skills (`agent-coder`, `agent-tester`, `agent-researcher`, `agent-architecture`, `agent-data-ml-model`, `agent-security-manager`).

**SaaS Evaluation Skills** (kirillpolevoy/claude-saas-eval-skills) — lifestyle SaaS opportunity evaluation ($1–3M ARR, solo/duo team):
- `niche-idea-generator` — generate 5–10 niche SaaS hypotheses based on your unique advantages
- `niche-research-first-pass` — distribution-first first-pass eval; kills ideas without concrete GTM paths
- `niche-success-scorecard` — 0–100 weighted score with go/no-go thresholds

**Snyk Studio Recipes (8 skills)** — security/SBOM tooling from snyk/studio-recipes:
- `snyk-fix`, `secure-dependency-health-check`, `secure-at-inception`, `sbom-analyzer`, `iac-security`, `drift-detector`, `container-security`, `ai-inventory` (AIBOM for Python AI/ML projects)

**Anthropic Skills — extended set (10 more)** — beyond the original 7 in the Firecrawl list, from anthropics/skills:
- Design/creative: `algorithmic-art`, `canvas-design`, `theme-factory`, `brand-guidelines`, `web-artifacts-builder`
- Communication: `internal-comms`, `slack-gif-creator`
- Document collaboration: `doc-coauthoring`
- Dev tooling: `mcp-builder`, `claude-api` (build/migrate Anthropic SDK apps with prompt caching)

**Mafia Claude Skills (18 skills)** — Spanish-speaking community pack from alexdcd/Mafia-Claude-Skills:
- AI/automation: `agent-browser`, `prompt-master`, `openrouter` (400+ models via one API), `audio-transcriber`, `humanizer`, `process-interviewer`
- Research/decisions: `deep-research`, `fact-checker`, `decision-toolkit`
- Skill tooling: `find-skills`, `template-skill`, `repo-first-defense`, `frontier-plan-opencode-executor`
- Marketing/UI: `landing-page-mastery`, `frontend-slides`, `vercel-react-best-practices`
- Productivity: `file-organizer`, `gestor-autonomos`
- (Skipped: `frontend-design`, `mcp-builder` — already covered by Anthropic's versions.)

**Impeccable** (pbakaus/impeccable v3.5) — frontend-design skill upgrade. Beyond Anthropic's `frontend-design`: 7 domain references (typography, color, spatial, motion, interaction, responsive, UX writing), 23 subcommands invoked as `/impeccable craft|polish|audit|critique|animate|bolder|quieter|...`, 27 deterministic anti-pattern rules (kill purple-to-blue gradients, Inter for everything, cards-in-cards, etc.), plus a 12-rule LLM critique pass. Apache 2.0. Includes companion agent `impeccable-manual-edit-applier` in `agents/`. **IM8 brand still overrides.**

**Wondel Skills — 42 knowledge-base skills** — classic books and frameworks distilled into invokable skills (from wondelai/skills):
- **Product/UX**: `lean-startup`, `lean-ux`, `design-sprint`, `inspired-product`, `continuous-discovery`, `jobs-to-be-done`, `mom-test`, `hooked-ux`, `microinteractions`, `top-design`, `design-everyday-things`, `ux-heuristics`, `refactoring-ui`, `web-typography`, `ios-hig-design`, `high-perf-browser`
- **Marketing/Sales/Strategy**: `obviously-awesome`, `blue-ocean-strategy`, `crossing-the-chasm`, `hundred-million-offers`, `one-page-marketing`, `predictable-revenue`, `storybrand-messaging`, `scorecard-marketing`, `contagious`, `made-to-stick`, `influence-psychology`, `negotiation`, `cro-methodology`, `improve-retention`, `traction-eos`, `37signals-way`, `drive-motivation`
- **Engineering**: `clean-code`, `clean-architecture`, `domain-driven-design`, `software-design-philosophy`, `refactoring-patterns`, `pragmatic-programmer`, `release-it`, `ddia-systems`, `system-design`

**alirezarezvani/claude-skills subset (163 skills)** — vendored from a 339-skill production library covering 9 domains. Marketing folder skipped (duplicates Corey Haines); marketing/business-growth/product-team/etc. categories left in the source repo. Three categories installed:

- **Engineering (~79)** — `rag-architect`, `mcp-server-builder`, `llm-cost-optimizer`, `prompt-governance`, `statistical-analyst`, `runbook-generator`, `slo-architect`, `observability-designer`, `database-schema-designer`, `ci-cd-pipeline-builder`, `dependency-auditor`, `release-manager`, `performance-profiler`, `pr-review-expert`, `api-design-reviewer`, `api-test-suite-builder`, `migration-architect`, `code-tour`, `chaos-engineering`, `feature-flags-architect`, `git-worktree-manager`, `terraform-patterns`, `docker-development`, `kubernetes-operator`, `helm-chart-builder`, `agent-designer`, `agent-workflow-designer`, `workflow-builder`, `karpathy-coder`, plus more.
- **C-Level Advisory (~66)** — full C-suite advisors (`ceo-advisor`, `cto-advisor`, `coo-advisor`, `cpo-advisor`, `cmo-advisor`, `cfo-advisor`, `cro-advisor`, `ciso-advisor`, `chro-advisor`, `chief-data-officer-advisor`, `chief-ai-officer-advisor`, `chief-customer-officer-advisor`, `vpe-advisor`, `general-counsel-advisor`), board tooling (`board-deck-builder`, `board-meeting`, `boardroom`), strategic (`ma-playbook`, `scenario-war-room`, `culture-architect`, `change-management`, `competitive-intel`, `strategic-alignment`, `intl-expansion`, `org-health-diagnostic`, `founder-coach`, `founder-mode`), executive mentor commands (`board-prep`, `challenge`, `hard-call`, `postmortem`, `stress-test`), and `cs:*` review commands.
- **Finance + Compliance + RA-QM (~31)** — `financial-analyst`, `saas-metrics-coach`, `business-investment-advisor`, audit prep (`ai-act-readiness`, `aims-audit`, `fda-qsr-audit-prep`, `iso27001-audit-prep`, `iso13485-audit-prep`, `soc2-audit-prep`, `gdpr-audit-prep`, `compliance-readiness`), specialists (`mdr-745-specialist`, `qms-audit-expert`, `isms-audit-expert`, `gdpr-dsgvo-expert`, `risk-management-specialist`, `iso42001-specialist`, `eu-ai-act-specialist`, `fda-consultant-specialist`, `capa-officer`, `information-security-manager-iso27001`, `quality-manager-qms-iso13485`, `quality-manager-qmr`, `regulatory-affairs-head`, `quality-documentation-manager`).

---

## Skills & Tools — Manual Installation

These require external install steps. Memory files contain full documentation so Claude knows how to use them even before they're installed.

### GET SHIT DONE (GSD) — Spec-driven dev system
```bash
npx get-shit-done-cc@latest
```
Solves context rot. Fresh 200k subagent contexts. Wave-based parallel execution.
Commands: `/gsd:new-project`, `/gsd:plan-phase`, `/gsd:execute-phase`, `/gsd:quick`, etc.

### UI/UX Pro Max — 67 styles, 161 industry patterns
```bash
npx skills add https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
```
> Note: IM8 brand overrides this for all IM8 work.

### GEO-SEO Claude — Generative Engine Optimization (13 skills)
```bash
curl -fsSL https://raw.githubusercontent.com/zubair-trabzada/geo-seo-claude/main/install.sh | bash
```
Commands: `/geo audit <url>`, `/geo citability <url>`, `/geo llmstxt <url>`, etc.

### SEO Machine — Long-form content pipeline (26 marketing skills)
```bash
git clone https://github.com/TheCraigHewitt/seomachine
cd seomachine
pip install -r data_sources/requirements.txt
claude-code .
```
Commands: `/research`, `/write`, `/article`, `/optimize`, `/publish-draft`, `/priorities`, etc.

### Claude Skills by alirezarezvani — 205 skills across 9 domains
```bash
git clone https://github.com/alirezarezvani/claude-skills
```
Domains: engineering, product, marketing, C-level advisory, RA/QM, PM, finance, business growth.
16 agents (cs-* prefix), 3 personas (startup-cto, growth-marketer, solo-founder), 254 Python tools.

### YouTube Clipper — AI video clipping + bilingual subtitles
```bash
npx skills add https://github.com/op7418/Youtube-clipper-skill
# macOS: must use ffmpeg-full, NOT standard ffmpeg
brew install ffmpeg-full yt-dlp
```
6-phase workflow: Download → AI chapter analysis → User selection → Clip → Burn subtitles → Summary

### n8n Skills — 7 skills for n8n workflow building
```bash
git clone https://github.com/czlonkowski/n8n-skills
```
Requires n8n-mcp MCP server. Key skill: expression syntax (`{{ }}` double braces, `$json.body` for webhook data).

### claude-mem — Persistent semantic memory
```bash
# Install from Claude Code marketplace or:
npx @claude-mem/install
```
SQLite + Chroma vector DB. Worker at `localhost:37777`. 5 skills: mem-search, mem-add, mem-list, mem-delete, make-plan.

### claude-code-action — GitHub Action for @claude mentions
See `memory/reference_claude_code_action.md` for the full workflow YAML.
Enables: `@claude` mentions in PRs/issues, automated security review on push.

---

## Key Principles Claude Follows

### Design
- **IM8 brand is sacred**: deep crimson (#2D0A10, #A40011), gold (#D4A84B), ABC Arizona Flare (headings), Aeonik (body). Never purple, never Inter, never bright white.
- **UI/UX Pro Max** for non-IM8 work — luxury dark aesthetic by default.

### Development
- **GSD for any non-trivial project**: `/gsd:new-project` → discuss → plan → execute → verify → ship
- **Security review before merging**: `/security-review`
- **Vertical slices > horizontal layers** for better parallel execution in GSD

### SEO / Content
- **GEO-SEO** for AI citation optimization (ChatGPT, Claude, Perplexity, Gemini)
- **SEO Machine** for long-form content creation and publishing
- **GEO Score formula**: `(Platform×0.25) + (Content/EEAT×0.25) + (Technical×0.20) + (Schema×0.15) + (Brand×0.15)`

### n8n
- Expressions always use `{{ }}` double braces
- Webhook data: `{{ $json.body }}`
- Most-used tool: `n8n_update_partial_workflow` (38k uses, 99% success)

---

## IM8 Brand Reference (Private)

IM8 fonts, logos, and full brand assets are private and not included in this repo.
After cloning, copy them manually and update `memory/reference_im8_brand.md` with the paths.

---

## Keeping This Up to Date

When you install new skills or learn something worth remembering:
```bash
# 1. Update memory files
cp ~/.claude/projects/<encoded-path>/memory/*.md /path/to/claude-starter-pack/memory/

# 2. Add new commands
cp ~/.claude/commands/<new-command>.md /path/to/claude-starter-pack/commands/

# 3. Push to GitHub
cd /path/to/claude-starter-pack
git add -A
git commit -m "update: add <new-skill>"
git push
```
