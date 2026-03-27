---
name: Claude Skills (alirezarezvani)
description: 205 production-ready skills across 9 domains — engineering, product, marketing, C-level advisory, compliance, PM, finance, business growth. 16 cs-* agents, 19 slash commands, 254 stdlib-only Python tools. Multi-platform: Claude Code, Codex, Gemini CLI, Cursor, Aider.
type: reference
---

Repo: https://github.com/alirezarezvani/claude-skills
Version: v2.1.2 | License: MIT | Author: alirezarezvani

---

## Architecture

```
Skill package pattern:
  skill-name/
  ├── SKILL.md          # Master doc + workflows
  ├── scripts/          # Python CLI tools (stdlib only, no ML/LLM calls)
  ├── references/       # Expert knowledge bases
  └── assets/           # User templates

Agent pattern (cs-* prefix):
  Single .md file with YAML frontmatter — ORCHESTRATES skills, doesn't replace them
  References skills via relative paths ../../domain-skill/
```

**Knowledge flow:** `references/` → `SKILL.md` workflows → `scripts/` execution → `assets/` templates

---

## 9 Domains — 205 Skills Total

### 🔧 Engineering — Core (26 skills + sub-collections)

**Core skills:** senior-fullstack, senior-frontend, senior-backend, senior-devops, senior-secops, senior-qa, senior-data-scientist, senior-data-engineer, senior-ml-engineer, senior-prompt-engineer, senior-computer-vision, google-workspace-admin, a11y-audit

**Playwright Pro (9+3 skills):** Test generation, flaky fix, Cypress/Selenium migration, TestRail, BrowserStack, 55 templates

**Self-Improving Agent (5+2 skills):** auto-memory curation, pattern promotion, skill extraction, memory health

**Key Python tools:**
- `senior-fullstack/scripts/project_scaffolder.py` — full project scaffolding
- `senior-fullstack/scripts/code_quality_analyzer.py` — code quality scoring
- `senior-data-scientist/scripts/experiment_designer.py` — experiment design
- `senior-data-scientist/scripts/statistical_analyzer.py` — statistical analysis
- `senior-data-engineer/scripts/pipeline_orchestrator.py` — pipeline orchestration
- `senior-data-engineer/scripts/etl_generator.py` — ETL generation
- `senior-ml-engineer/scripts/model_deployment_pipeline.py` — ML deployment
- `senior-ml-engineer/scripts/llm_integration_builder.py` — LLM integration
- `senior-prompt-engineer/scripts/prompt_optimizer.py` — prompt optimization
- `senior-prompt-engineer/scripts/rag_system_builder.py` — RAG setup
- `senior-computer-vision/scripts/vision_model_trainer.py`

---

### ⚡ Engineering — POWERFUL Tier (30 skills)

25 advanced production-grade skills:

| Skill | What It Does |
|-------|-------------|
| `agent-designer` | Multi-agent orchestration, tool schemas, performance evaluation |
| `agent-workflow-designer` | Sequential, parallel, router, orchestrator, evaluator patterns |
| `rag-architect` | RAG pipeline builder, chunking optimizer, retrieval evaluator |
| `database-designer` | Schema analyzer, ERD generation, index optimizer, migration generator |
| `database-schema-designer` | Requirements → migrations, types, seed data, RLS policies |
| `migration-architect` | Migration planner, compatibility checker, rollback generator |
| `skill-security-auditor` | 🔒 Scans skills for command injection, code exec, exfiltration, prompt injection, supply chain risks → PASS/WARN/FAIL |
| `ci-cd-pipeline-builder` | Stack detector → GitHub Actions / GitLab CI config generator |
| `mcp-server-builder` | OpenAPI spec → working MCP server (Python + TypeScript) |
| `pr-review-expert` | Blast radius analysis, security scan, coverage delta |
| `api-design-reviewer` | REST API linter, breaking change detector, design scorecard |
| `api-test-suite-builder` | Scan API routes → complete test suites (Vitest, Pytest) |
| `dependency-auditor` | Multi-language scanner, license compliance, upgrade planner |
| `release-manager` | Changelog generator, semantic version bumper, readiness checker |
| `observability-designer` | SLO designer, alert optimizer, dashboard generator |
| `performance-profiler` | Node/Python/Go profiling, bundle analysis, load testing |
| `monorepo-navigator` | Turborepo/Nx/pnpm workspace management + impact analysis |
| `changelog-generator` | Conventional commits → structured changelogs |
| `codebase-onboarding` | Auto-generate onboarding docs from any codebase |
| `runbook-generator` | Codebase → operational runbooks with commands |
| `git-worktree-manager` | Parallel dev sessions with port isolation, env sync |
| `env-secrets-manager` | .env management, leak detection, rotation workflows |
| `incident-commander` | Incident response playbook, severity classifier, PIR generator |
| `tech-debt-tracker` | Codebase debt scanner, prioritizer, trend dashboard |
| `interview-system-designer` | Interview loop designer, question bank, calibrator |

**Security audit command:**
```bash
python3 engineering/skill-security-auditor/scripts/skill_security_auditor.py /path/to/skill/
```

---

### 🎯 Product (14 skills + 16 Python tools + 8 slash commands)

| Skill | Tools | Purpose |
|-------|-------|---------|
| `product-manager-toolkit` | rice_prioritizer.py, customer_interview_analyzer.py | RICE scoring, interview NLP analysis |
| `agile-product-owner` | user_story_generator.py | User story generation, sprint planning |
| `product-strategist` | okr_cascade_builder.py | OKR cascade, strategic planning |
| `ux-researcher-designer` | persona_generator.py | Persona generation, user research synthesis |
| `ui-design-system` | design_token_generator.py | Design tokens, component systems |
| `competitive-teardown` | competitive_matrix.py | SWOT, positioning matrix, gap analysis |
| `landing-page-generator` | landing_page_scaffolder.py | Next.js TSX + Tailwind CSS (4 styles, 7 section generators) |
| `saas-scaffolder` | saas_scaffolder.py | Full SaaS project: auth, billing, dashboard, landing |
| `product-analytics` | analytics_kpi_designer.py | KPI design, retention/cohort/funnel analysis |
| `experiment-designer` | experiment_designer.py | A/B test design, sample size planning |
| `product-discovery` | assumption_mapper.py | Discovery frameworks, assumption mapping |
| `roadmap-communicator` | changelog_generator.py | Roadmap communication, changelog generation |
| `code-to-prd` | codebase_analyzer.py, prd_scaffolder.py | Reverse-engineer any codebase into PRD |
| `research-summarizer` | research_synthesizer.py | Research synthesis and summarization |

**Slash commands:** `/rice`, `/okr`, `/persona`, `/user-story`, `/competitive-matrix`, `/prd`, `/sprint-plan`, `/code-to-prd`

---

### 📣 Marketing (43 skills — 7 pods + orchestration)

**Always read first:** `marketing-context/` (brand voice, personas, competitive landscape) → then `marketing-ops/` (routing matrix)

| Pod | Skills | Focus |
|-----|--------|-------|
| Content (8) | `content-production`, `content-strategy`, `content-humanizer` + 5 more | Blog posts, guides, brand voice, AI-pattern removal |
| SEO (5) | `ai-seo`, `seo-audit` + 3 more | GEO/AI search optimization + traditional SEO |
| CRO (6) | `page-cro`, `pricing-strategy` + 4 more | Conversion rate optimization |
| Channels (6) | `x-twitter-growth`, email, social, paid ads + 2 more | Channel-specific strategies |
| Growth (4) | Launch, referral, free tool strategy + 1 more | Growth levers |
| Intelligence (4) | Competitive intel, market research + 2 more | Market analysis |
| Sales (2) | Sales enablement + 1 more | Sales support |

**32 Python tools** including: `brand_voice_analyzer.py`, `marketing_budget_modeler.py`

---

### 💼 C-Level Advisory (28 skills — full C-suite + orchestration)

**10 C-Suite Roles** each with distinct reasoning technique + Python scripts:

| Role | Reasoning | Key Scripts |
|------|-----------|-------------|
| CEO | Tree of Thought | strategy_analyzer.py, financial_scenario_analyzer.py |
| CTO | ReAct | tech_debt_analyzer.py, team_scaling_calculator.py |
| COO | Step by Step | ops_efficiency_analyzer.py, okr_tracker.py |
| CPO | First Principles | pmf_scorer.py, portfolio_analyzer.py |
| CMO | Recursion of Thought | marketing_budget_modeler.py, growth_model_simulator.py |
| CFO | Chain of Thought | burn_rate_calculator.py, unit_economics_analyzer.py, fundraising_model.py |
| CRO | Chain of Thought | revenue_forecast_model.py, churn_analyzer.py |
| CISO | Risk-Based | risk_quantifier.py, compliance_tracker.py |
| CHRO | Empathy + Data | hiring_plan_modeler.py, comp_benchmarker.py |
| Executive Mentor | Adversarial | decision_matrix_scorer.py, stakeholder_mapper.py |

**Orchestration skills:**
- `cs-onboard` — Founder interview → company-context.md
- `chief-of-staff` — Routes questions, triggers board meetings
- `board-meeting` — 6-phase multi-agent deliberation
- `decision-logger` — Two-layer memory (raw + approved)
- `agent-protocol` — Inter-agent invocation, loop prevention, quality loop
- `context-engine` — Company context loading + anonymization

**Strategic skills:** board-deck-builder, scenario-war-room, competitive-intel, org-health-diagnostic, m&a-playbook, intl-expansion

**Culture & org skills:** culture-architect, company-os (EOS/Scaling Up), founder-coach, strategic-alignment, change-management (ADKAR), internal-narrative

**Executive Mentor slash commands:** `/em:challenge`, `/em:board-prep`, `/em:hard-call`, `/em:stress-test`, `/em:postmortem`

**C-Level layered below marketing/finance/engineering:** CMO → marketing-skill | CFO → finance | CRO → business-growth | CISO → ra-qm-team | CPO → product-team

---

### 🏥 Regulatory & QM (12 skills — HealthTech/MedTech)

**Strategic leadership:** regulatory-affairs-head, quality-manager-qmr

**Quality systems:** quality-manager-qms-iso13485, capa-officer, quality-documentation-manager (DHF/DMR/DHR)

**Risk & security:** risk-management-specialist (ISO 14971), information-security-manager-iso27001

**Regulatory specialists:** mdr-745-specialist (EU MDR 2017/745, Annex II/III, UDI), fda-consultant-specialist (510(k), PMA, QSR)

**Audit & compliance:** qms-audit-expert, isms-audit-expert, gdpr-dsgvo-expert, soc2-compliance (SOC 2 Type I/II)

---

### 📋 Project Management (6 skills)

senior-pm, scrum-master, jira-specialist, confluence-specialist, atlassian-admin, pm-templates

**Atlassian MCP integration** — direct Jira/Confluence operations via MCP tools

---

### 📈 Business & Growth (4 skills)

- `customer-success` — CS strategy, retention, health scoring
- `sales-engineer` — Technical sales support, POC design
- `revenue-ops` — RevOps infrastructure, pipeline analytics
- `contract-and-proposal-writer` — Contracts, SOWs, NDAs (US, EU, DACH jurisdictions)

---

### 💰 Finance (2 skills)

- `financial-analyst` — DCF valuation, budgeting, forecasting, financial modeling
- `saas-metrics-coach` — ARR, MRR, churn, LTV, CAC, unit economics

**Key script:**
```bash
python3 finance/saas-metrics-coach/scripts/metrics_calculator.py --mrr 80000 --customers 200 --churned 3 --json
```

---

## 16 Agents (cs-* prefix)

| Agent | Domain |
|-------|--------|
| cs-content-creator | Marketing |
| cs-demand-gen-specialist | Marketing |
| cs-ceo-advisor | C-Level |
| cs-cto-advisor | C-Level |
| cs-product-manager | Product |
| cs-product-strategist | Product |
| cs-agile-product-owner | Product |
| cs-ux-researcher | Product |
| cs-product-analyst | Product |
| cs-engineering-lead | Engineering |
| cs-workspace-admin | Engineering |
| cs-senior-engineer | Engineering |
| cs-growth-strategist | Business |
| cs-financial-analyst | Finance |
| cs-project-manager | PM |
| cs-quality-regulatory | RA/QM |

---

## 3 Personas

Pre-configured agent identities with curated skill loadouts + communication styles:

| Persona | Domain | Best For |
|---------|--------|---------|
| `startup-cto` | Engineering + Strategy | Architecture, tech stack, team building, tech due diligence |
| `growth-marketer` | Marketing + Growth | Content-led growth, launch, channel optimization, bootstrapped marketing |
| `solo-founder` | Cross-domain | One-person startups, side projects, MVP, wearing all hats |

---

## 4 Orchestration Patterns

| Pattern | Use When |
|---------|---------|
| Solo Sprint | Switch personas across project phases (side projects, MVPs) |
| Domain Deep-Dive | One persona + multiple stacked skills (architecture review, compliance audit) |
| Multi-Agent Handoff | Personas review each other's output (high-stakes decisions, launch readiness) |
| Skill Chain | Sequential skills without persona (content pipelines, checklists) |

**6-week product launch example:**
```
Wk 1-2: startup-cto + aws-solution-architect + senior-frontend → Build
Wk 3-4: growth-marketer + launch-strategy + copywriting + seo-audit → Prepare
Wk 5-6: solo-founder + email-sequence + analytics-tracking → Ship & iterate
```

---

## 19 Slash Commands

`/changelog`, `/tdd`, `/saas-health`, `/prd`, `/code-to-prd`, `/plugin-audit`, `/sprint-plan`, `/rice`, `/okr`, `/persona`, `/user-story`, `/competitive-matrix`, `/sprint-plan`, `/em:challenge`, `/em:board-prep`, `/em:hard-call`, `/em:stress-test`, `/em:postmortem` + more

---

## Key Python Script Examples

```bash
# SaaS metrics
python3 finance/saas-metrics-coach/scripts/metrics_calculator.py --mrr 80000 --customers 200 --churned 3 --json

# Brand voice analysis
python3 marketing-skill/content-production/scripts/brand_voice_analyzer.py article.txt

# Tech debt scoring
python3 c-level-advisor/cto-advisor/scripts/tech_debt_analyzer.py /path/to/codebase

# RICE prioritization
python3 product-team/product-manager-toolkit/scripts/rice_prioritizer.py features.csv

# Security audit a skill
python3 engineering/skill-security-auditor/scripts/skill_security_auditor.py /path/to/skill/

# Landing page (TSX + Tailwind)
python3 product-team/landing-page-generator/scripts/landing_page_scaffolder.py config.json --format tsx
```

---

## Multi-Platform Support

Works with: Claude Code, OpenAI Codex, Gemini CLI, Cursor, Aider, Windsurf, and 5 more.
Conversion script: `./scripts/convert.sh --tool cursor`
