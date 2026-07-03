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

**agent-reach** (Panniantong/Agent-Reach v1.4.0, MIT) — routing skill that gives agents access to **17 platforms via free CLI tools** including ones Firecrawl can't handle well: **Chinese platforms** (小红书 Xiaohongshu, 微博 Weibo, B站 Bilibili, 抖音 Douyin, 雪球 Xueqiu, WeChat 公众号) plus Twitter/X (no API key), Reddit (bypasses 403), LinkedIn, YouTube subtitles, V2EX, podcasts, RSS. Only the routing brain is vendored (SKILL.md + 6 category references, ~44KB total); upstream CLI tools (`twitter`, `rdt`, `xhs-cli`, `yt-dlp`, `mcporter`) install on demand via one-line official installer (no API keys needed; all data stays local). Bilingual triggers (Chinese + English). Especially valuable for IM8 work — Chinese health/wellness market intelligence — and for the trading bot project (雪球 stock sentiment, 哔哩哔哩 retail trader videos). Complements [[firecrawl-scrape]] (English web), [[defuddle]] (clean MD), [[reference_youtube_clipper]] (full clipper pipeline). See `memory/reference_agent_reach.md` for the install decision matrix.

**video-use (browser-use/video-use, MIT)** — conversation-driven video editor for raw footage. LLM never watches the video; reads it via ElevenLabs Scribe (word-level timestamps + speaker diarization + audio events) and pulls visual frames only at decision points. Handles talking heads, montages, tutorials, launch films, interviews. Bundles:
- `video-use` — main editing skill: cuts filler words + dead space, 30ms audio fades at every cut, auto colour grading (warm cinematic / neutral punch / custom ffmpeg chain), burns 2-word-UPPERCASE subtitles by default, generates animation overlays via HyperFrames / Remotion / Manim / PIL in parallel sub-agents, self-evaluates rendered cuts, persists session memory in `project.md`
- `manim-video` — bundled sub-skill for 3Blue1Brown-style math/algorithm/technical explainer animations via Manim Community Edition

Complementary to existing video-toolchain skills: use `video-use` for RAW FOOTAGE editing, `remotion-best-practices` for programmatic React video, `huashu-design` for HTML-medium exports, `youtube-clipper-skill` for downloading + clipping existing YouTube content. Runtime deps NOT auto-installed: needs `brew install ffmpeg`, optional `brew install yt-dlp`, and an ElevenLabs API key. See `memory/reference_video_use.md` for the full decision matrix.

**Hindsight Agent Memory (vectorize-io/hindsight, MIT)** — 6 skills from the production-grade agent memory system that claims SOTA on LongMemEval (independently reproduced by Virginia Tech Sanghani Center). Backend = Docker + PostgreSQL + LLM provider (OpenAI/Anthropic/Gemini/Groq/Ollama/LMStudio/MiniMax). Designed for "learning, not just remembering" — distinguishes itself from RAG and knowledge graphs by extracting reusable mental models from experience:

- `hindsight-docs` — 1.4MB reference docs (full OpenAPI spec, dev guides, SDK references); the official recommendation for any coding agent working with Hindsight
- `hindsight-architect` — memory-system DESIGN skill; produces implementation plan with bank config + tag schema + code outline. Useful before writing any memory-system code, even non-Hindsight
- `hindsight-cloud` / `hindsight-local` / `hindsight-self-hosted` — three deployment modes (Vectorize SaaS, single-user local, team self-hosted Docker)
- `hindsight-create-agent` — builds Hindsight-backed Claude Code subagent files with persistent memory (renamed from `create-agent` to avoid namespace collision)

Skipped Hindsight-monorepo-specific: `code-review`, `hs-release`, Cursor-specific `hindsight-recall`. See `memory/reference_hindsight.md` for the Hindsight-vs-claude-mem-vs-AgentDB decision matrix.

**Cybersecurity skills (57 total, 2 sources)** — combined from Masriyan/Claude-Code-CyberSecurity-Skill (all 15 broad domains, renamed to drop `NN-` prefixes) + curated 42 from mukul975/Anthropic-Cybersecurity-Skills (712 of 754 deliberately not vendored — heavy forensics/red-team specialization, would add ~75k tokens metadata/session).

- **15 broad domains (Masriyan):** `recon-osint`, `vulnerability-scanner`, `exploit-development`, `reverse-engineering`, `malware-analysis`, `threat-hunting`, `incident-response`, `network-security`, `web-security`, `cloud-security`, `csoc-automation`, `log-analysis`, `crypto-analysis`, `red-team-ops`, `blue-team-defense`
- **42 curated micro-skills (mukul):** Cloud/Azure-focused (`analyzing-azure-activity-logs-for-threats`, `auditing-azure-active-directory-configuration`, `building-cloud-siem-with-sentinel`, `auditing-aws-s3-bucket-permissions`, `auditing-gcp-iam-permissions`, `auditing-cloud-with-cis-benchmarks`), k8s/container (`analyzing-kubernetes-audit-logs`, `auditing-kubernetes-cluster-rbac`), supply chain (`analyzing-sbom-for-supply-chain-vulnerabilities`, `building-devsecops-pipeline-with-gitlab-ci`), web app (`analyzing-api-gateway-access-logs`, `analyzing-certificate-transparency-for-phishing`), detection (`building-detection-rules-with-sigma`, `building-detection-rule-with-splunk-spl`), IR (`triaging-security-incident`, `automating-ioc-enrichment`), identity (`building-identity-federation-with-saml-azure-ad`, `analyzing-active-directory-acl-abuse`), threat intel (`analyzing-threat-actor-ttps-with-mitre-attack`, `analyzing-threat-landscape-with-misp`), and network analysis.

All mukul skills include MITRE ATT&CK, NIST CSF, and D3FEND mappings in frontmatter. Apache 2.0 (mukul). Complementary to existing security skills (Trail of Bits, Snyk, compliance-os, ciso-advisor, ciso-review) — fills detection-engineering, Azure-specific audit, and SOC workflow gaps. See `memory/reference_cybersecurity_skills.md` for full skill list + skipped-categories rationale.

**huashu-design** (alchaincyf/huashu-design, 花叔Design, MIT) — comprehensive HTML-as-design-medium skill. Produces clickable hi-fi prototypes (iOS/web app mockups with real interactions), 1920×1080 HTML presentation decks exportable to PPTX (pptxgenjs) and PDF (pdf-lib), 60fps animations exportable to MP4/GIF (Playwright video recording), infographics, and voiceover-narrated long videos (Doubao TTS + BGM mix). Three differentiated mechanisms:
- **40 native HTML style library** (20 web + 20 PPT) as fallback against AI slop
- **3-perspective design consultant** when requirements are ambiguous (parallel real visual variants)
- **5-dimension review system** for design critique

Skill embodies the right specialist per task (animator / UX designer / slide designer / prototyper). 23 reference files in `references/` loaded on demand. Triggers in both Chinese (做原型, 交互原型, HTML演示, 动画Demo, 设计变体, 评审) and English (prototype, UI mockup, iOS prototype, export MP4/GIF, voiceover). Tech deps installed on demand: `playwright`, `pptxgenjs`, `pdf-lib`, `sharp`. **IM8 brand still overrides** for any IM8 work (same rule as for frontend-design / impeccable). Bundled 5.2MB (5 large bgm-*.mp3 files excluded — easily re-pulled from source). See `memory/reference_huashu_design.md` for the full skill-comparison matrix vs `frontend-design`, `impeccable`, `refactoring-ui`, `remotion-best-practices`, etc.

**Nango meta-skills (2 from nangohq/nango)** — Nango itself is an integration platform alternative to Fivetran/Workato (800+ APIs, used by Replit/Ramp/Mercor), NOT vendored as a skill. Two project-agnostic meta-skills from its `.agents/skills/` were taken:
- `agent-builder` — 920-line Claude Code subagent design expert (frontmatter, tool config, model selection, delegation patterns) + EXAMPLES.md. Pairs with existing `agent-architecture`/`agent-designer`/`skill-builder`.
- `creating-skills` — 482-line meta-skill on writing high-quality SKILL.md files (discoverability, scannability, when-to-create). Alternative angle to `skill-creator` (Anthropic) and `skill-builder` (claude-flow).

The other 6 Nango skills (`running-tests`, `creating-database-migrations`, etc.) are tied to the Nango monorepo's paths/tooling and were skipped. See `memory/reference_nango.md` for Nango platform notes (Fivetran trade-off matrix relevant to IM8 data work).

**trading-multi-agent-architecture** (custom skill) — abstracts the Director→Sentiment→Quant→Risk→Execution pattern from AutoHedge (Swarms Corp) into a provider-agnostic Claude Code skill. Teaches structured agent decomposition for any trading/investment decision system: agent system prompts, JSON I/O contracts per role, single-loop discipline, parallel Sentiment+Quant execution, Risk-gates-Execution flow, reference implementation using the Claude Agent SDK. Pairs with `chart-patterns`, `position-sizer`, `breakout-trade-planner`, `statistical-analyst`, `signal-postmortem`. Directly applicable to the personal swing-trading bot project (per `memory/project_trading_bot.md`). Memory reference flags the Swarms Corp reputation caution — pattern abstracted, source not installed.

**Claude Ads** (AgriciDaniel/claude-ads v1.7.1, MIT) — multi-platform paid-advertising audit & optimization. Main `/ads` skill orchestrates 22 sub-skills + 10 agents (4 audit + 6 creative). 10-15 min full audit returns 0-100 health score with 209+ checks across:
- **Platforms:** `/ads google` (AI Max era, 80 checks), `/ads meta` (Andromeda+GEM+Lattice, 50 checks), `/ads youtube`, `/ads linkedin`, `/ads tiktok` (USDS post-divestiture, Smart+), `/ads microsoft`, `/ads apple`, `/ads amazon` (Sponsored Products/Brands/Display + DSP)
- **Cross-platform:** `/ads audit` (full parallel audit), `/ads attribution` (AdAttributionKit + GA4 + Consent Mode V2), `/ads tracking` (sGTM + CAPI Gateway + dedup + hashing), `/ads competitor`, `/ads landing`, `/ads budget`, `/ads math` (CAC/LTV/ROAS/MER), `/ads creative`, `/ads test`, `/ads dna <url>`, `/ads create`, `/ads generate`, `/ads photoshoot`
- **Agents:** audit-google, audit-meta, audit-budget, audit-compliance, audit-creative, audit-tracking, copy-writer, creative-strategist, format-adapter, visual-designer

Pairs with Corey Haines' `paid-ads`/`ad-creative` (strategy & bulk creative) — claude-ads is the audit/deep-dive side. Directly relevant to IM8's platform-direct ROAS work and Northbeam migration.

**guidechimp-tour-builder** (custom skill) — wraps [Labs64/GuideChimp](https://github.com/Labs64/GuideChimp) (npm JS library) so Claude can generate production in-app tours: step JSON, init code for React/Vue/vanilla, route-keyed configs for SPAs, plugin wiring (beacons, lazy-loading, vueRouter), analytics events, and IM8-branded CSS overrides. Refuses brittle selectors, defaults `exitOverlay: false` for required onboarding, surfaces the EUPL-1.2 vs commercial license question. Pairs with `onboarding-cro` (strategy) and `analytics-tracking` (instrumentation).

**Founder Skills** (ognjengt/founder-skills) — 14 founder/marketer skills. Most read from a `FOUNDER_CONTEXT.md` placed at project root (similar to Corey Haines' `product-marketing-context`):
- **Strategy/planning**: `strategic-planning`, `go-to-market-plan`, `product-hunt-launch-plan`, `prd-generator` (standalone PRDs — does NOT read FOUNDER_CONTEXT), `competitor-intel`, `pricing-strategist`
- **Content/copy**: `brand-copywriter`, `viral-hook-creator`, `linkedin-writer`, `x-writer`, `lead-magnet-generator`
- **Ops/growth**: `outreach-specialist`, `cro-optimization`, `sop-creator`
- (Skipped: `marketing-ideas` — Corey Haines version wins)

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

### GitHub Spec-Kit — Per-project SDD (alternative to GSD)
```bash
# CLI installs globally (install.sh handles this if `uv` is present):
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

# Then per project:
specify init my-project --integration claude
```
Writes 9 commands (`/specify`, `/clarify`, `/plan`, `/tasks`, `/analyze`, `/checklist`, `/implement`, `/constitution`, `/taskstoissues`) into the **project's** `.claude/skills/`. Pick this over GSD when (a) your project uses GitHub Issues heavily (`/taskstoissues` auto-creates them) or (b) the team wants a single canonical SDD methodology. See `memory/reference_spec_kit.md` for the GSD-vs-spec-kit decision matrix.

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
