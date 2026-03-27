---
name: GEO-SEO Claude Skill
description: 13-skill suite for Generative Engine Optimization (GEO) — optimizing websites for AI search platforms (ChatGPT, Claude, Perplexity, Gemini, Google AI Overviews). Includes audit, citability scoring, crawler analysis, schema, content, reporting, and agency CRM tools.
type: reference
---

Repo: https://github.com/zubair-trabzada/geo-seo-claude
Install: `curl -fsSL https://raw.githubusercontent.com/zubair-trabzada/geo-seo-claude/main/install.sh | bash`
License: MIT | Author: Zubair Trabzada

---

## What is GEO?

**Generative Engine Optimization** = optimizing for AI citation and recommendation (not just search rankings).
- GEO-optimized content gets 30–115% more visibility in AI responses (Georgia Tech / Princeton / IIT Delhi 2024)
- AI-referred traffic converts at **4.4x higher** than organic
- Brand mentions correlate **3x stronger** with AI visibility than backlinks
- AI search market projected at $7.3B by 2031; AI traffic growing 527% YoY

---

## GEO Readiness Score Formula

```
GEO Score = (Platform Score × 0.25) + (Content/E-E-A-T × 0.25) + (Technical × 0.20) + (Schema × 0.15) + (Brand Authority × 0.15)
```

| Score | Label | Meaning |
|-------|-------|---------|
| 85–100 | Excellent | Well-positioned, maintain advantage |
| 70–84 | Good | Targeted optimizations yield big results |
| 55–69 | Moderate | Gaps competitors may be exploiting |
| 40–54 | Below Average | Significant visibility barriers |
| 0–39 | Needs Attention | Critical issues, likely invisible in AI results |

---

## The 13 Skills

### 1. `geo-audit` — Full Audit Orchestrator
Command: `/geo audit <url>`
- Phase 1: Homepage fetch → business type detection (SaaS / Local / E-commerce / Publisher / Agency)
- Phase 2: Sitemap crawl (up to 50 URLs)
- Phase 3: Parallel subagent delegation across all categories
- Outputs: composite GEO Score + prioritised action plan

**Business type detection signals:**
- SaaS: pricing page, "Free trial" CTA, app.domain.com, feature tables
- Local: physical address, Maps embed, service area pages, LocalBusiness schema
- E-commerce: product listings, cart, price displays, product schema
- Publisher: blog-heavy nav, article schema, author pages, archives
- Agency: case studies, portfolio, team page, client logos

---

### 2. `geo-citability` — AI Citation Scoring (25% of GEO Score)
Scores how extractable/quotable content is for AI systems.

**Optimal citation block:** 134–167 words, self-contained, fact-rich, answers in first 1–2 sentences.

**Scoring rubric (0–100):**

| Category | Weight | What It Measures |
|----------|--------|-----------------|
| Answer Block Quality | 30% | Direct answer patterns, definition patterns ("X is...") |
| Statistical Density | 25% | Specific numbers, dates, named entities per 500 words |
| Self-Containment | 25% | Passages understandable without surrounding context |
| Structural Clarity | 20% | H2/H3 headings, lists, tables, scannable layout |

**High-citability patterns:**
- "X is [definition]." / "X refers to [explanation]."
- Answer in first sentence, then supporting detail
- "According to [Source], [specific stat]."
- Quantified comparisons: "X differs from Y in 3 ways: [list]"

**Low-citability patterns:** narrative/conversational openers, buried answers, hedging ("reportedly", "some say"), no specific data

---

### 3. `geo-crawlers` — AI Crawler Access Analysis

**Tier 1 — ALWAYS ALLOW (directly impacts AI search visibility):**
| Crawler | User-Agent | Platform |
|---------|-----------|---------|
| GPTBot | GPTBot | ChatGPT (300M+ weekly users) |
| OAI-SearchBot | OAI-SearchBot | ChatGPT search only (no training data) |
| ChatGPT-User | ChatGPT-User | User-initiated ChatGPT browsing |
| ClaudeBot | ClaudeBot | Anthropic Claude web search |
| PerplexityBot | PerplexityBot | Perplexity AI |
| Googlebot | Googlebot | Google Search + AI Overviews |
| Google-Extended | Google-Extended | Gemini AI training (blocking ≠ blocking Googlebot) |
| Bingbot | bingbot | Bing Copilot + ChatGPT via Bing |

**Other crawlers:** Amazonbot (Alexa/Amazon AI), CCBot (Common Crawl), FacebookBot (Meta AI), Bytespider (TikTok), Applebot-Extended (Apple Intelligence)

**Key nuance:** Blocking `Google-Extended` does NOT block Googlebot. It only controls AI training usage. Allow unless specific data licensing concern.

---

### 4. `geo-llmstxt` — llms.txt Generation & Validation
The `llms.txt` standard (proposed Sept 2024, Jeremy Howard) — like robots.txt but tells AI systems what IS useful.

**File location:** Must be at `https://example.com/llms.txt`

**Format:**
```markdown
# [Site Name]

> [One-sentence description, under 200 characters]

## Docs

- [Page Title](https://example.com/page): Concise description of what this page covers.

## Optional

- [Less Critical Page](https://example.com/optional): Description.
```

**Benefits:** Faster AI comprehension, controlled narrative, higher citation accuracy, reduced hallucination about business facts. Only ~5% of sites have llms.txt as of early 2026 — early adopter advantage.

---

### 5. `geo-brand-mentions` — Brand Authority Score (15% of GEO Score)

**Platform importance for AI citations (Ahrefs Dec 2025 study, 75k brands):**

| Platform | Correlation | Why It Matters |
|----------|------------|----------------|
| YouTube | ~0.737 (strongest) | Transcripts indexed by all AI platforms; Gemini directly cites |
| Reddit | High | Heavy weight in AI training data; community discussions |
| LinkedIn | High | Professional authority signals; B2B AI citation preference |
| Twitter/X | Medium | Real-time mentions; Grok indexing |
| Podcasts | Medium | Transcript indexing growing |
| News/Press | Medium | High-authority unlinked mentions |

**Key insight:** Unlinked brand mentions predict AI citation better than backlinks or Domain Rating. Platform quality > link equity for GEO.

---

### 6. `geo-platform-optimizer` — Per-Platform Optimization

Only 11% of domains are cited by BOTH ChatGPT and Google AI Overviews for the same query. Each platform has distinct requirements.

#### Google AI Overviews (AIO)
- 92% of citations from top 10 organic — traditional SEO is the gateway
- 47% from below position 5 — AIO has own logic favoring clarity over rank
- Checklist: question-based H2/H3 headings, direct answer in first paragraph, tables for comparisons, ordered lists for steps, FAQ section, definitions/glossary, statistics with sources, publication date, author byline

#### ChatGPT
- Relies on Bing index + real-time browsing
- Prefers: clear entity definition, comprehensive topic coverage, cited sources, structured data

#### Perplexity
- Most aggressive real-time crawler
- Prioritizes: recency, citations/references, academic/authoritative tone

#### Gemini
- Google-native; Google-Extended crawler + Google Knowledge Graph
- Heavily weights: structured data, YouTube presence, Google Business Profile, Wikipedia entities

#### Bing Copilot
- Microsoft Bing index + OpenAI models
- Prefers: Bing Webmaster Tools verified, IndexNow submissions, schema markup

---

### 7. `geo-schema` — Structured Data Audit & Generation

Structured data = how AI models understand and trust your entity.

**Detection:** Must use `fetch_page.py` (not WebFetch) to get `<script type="application/ld+json">` blocks — WebFetch strips `<head>`.

**Format priority:** JSON-LD > Microdata > RDFa. Recommend migrating Microdata/RDFa to JSON-LD.

**Critical validation checks:**
- Valid JSON syntax
- Valid @type (Schema.org)
- Required + recommended properties
- sameAs links to social/platform profiles
- Server-rendered (not JS-injected) — Google Dec 2025: JS-injected schema faces delayed processing
- Nested correctly (author inside Article, address inside Organization)

---

### 8. `geo-technical` — Technical SEO + GEO Checks (20% of GEO Score)

**8 audit categories:**
1. Crawlability (robots.txt, AI crawler access, XML sitemaps)
2. Indexability (meta robots, canonical tags, noindex)
3. **Server-Side Rendering** — CRITICAL: AI crawlers do not execute JavaScript
4. Core Web Vitals (LCP, CLS, FID)
5. HTTPS & Security headers
6. Mobile-friendliness
7. Page speed
8. Internal linking depth (AI rarely cites pages >3 clicks from homepage)

**AI crawler scoring:**
- All major crawlers allowed: 5/5 pts
- Some blocked, Googlebot + Bingbot allowed: 3/5
- GPTBot or PerplexityBot blocked: 1/5
- Googlebot blocked: 0/5 (fatal)

---

### 9. `geo-content` — Content Quality & E-E-A-T (25% of GEO Score)

E-E-A-T = Experience + Expertise + Authoritativeness + Trustworthiness (25 pts each).

**Experience signals:** first-person accounts, original research/data, case studies with numbers, authentic screenshots, process demonstrations

**Expertise signals:** author credentials/bio, citations to primary sources, depth beyond surface coverage, industry-specific terminology used correctly

**Authoritativeness signals:** backlinks from industry publications, mentions on authoritative platforms, featured in press, Wikipedia entity

**Trustworthiness signals:** HTTPS, privacy policy, contact info, review platform presence, accurate business info across platforms

---

### 10. `geo-report` — Client-Facing Markdown Report

Aggregates all audit outputs into a single professional deliverable for business owners (not developers).
Output: `GEO-CLIENT-REPORT.md`
Inputs required: geo-platform-optimizer, geo-schema, geo-technical, geo-content outputs

---

### 11. `geo-report-pdf` — PDF Report with Charts

Requires: `pip install reportlab`
Script: `~/.claude/skills/geo/scripts/generate_pdf_report.py`

**Includes:** Score gauges, bar charts, platform readiness visualizations, color-coded tables, prioritized action plan.

**Input JSON schema:**
```json
{
  "url": "https://example.com",
  "brand_name": "...",
  "date": "YYYY-MM-DD",
  "geo_score": 65,
  "scores": { "ai_citability": 62, "brand_authority": 78, "content_eeat": 74, "technical": 72, "schema": 45, "platform_optimization": 59 },
  "platforms": { "Google AI Overviews": 68, "ChatGPT": 62, "Perplexity": 55, "Gemini": 60, "Bing Copilot": 50 },
  "executive_summary": "...",
  "findings": [{ "severity": "critical|high|medium", "title": "...", "description": "..." }],
  "quick_wins": ["..."]
}
```

---

### 12. `geo-prospect` — Agency CRM / Pipeline Manager

Data stored in `~/.geo-prospects/prospects.json` (persistent).

**Pipeline stages:** Lead → Qualified → Proposal Sent → Won → Lost

**Commands:**
```
/geo prospect new <domain>          # create prospect
/geo prospect list [status]         # view pipeline
/geo prospect show <id-or-domain>   # full detail
/geo prospect audit <id-or-domain>  # run quick audit + save
/geo prospect note <id> "<text>"    # add note with timestamp
/geo prospect status <id> <status>  # move pipeline stage
/geo prospect won <id> <monthly>    # mark won + contract value
/geo prospect lost <id> "<reason>"  # mark lost
/geo prospect pipeline              # visual summary + revenue forecast
```

---

### 13. `geo-compare` — Monthly Delta / Progress Report

Compare baseline vs. current audit → show client exactly what improved.
Best retention tool for a GEO agency.

```
/geo compare <domain> --baseline <date1> --current <date2>
```

Outputs: score delta per category, action item completion %, trend charts, client-friendly narrative.

---

## Quick Reference: Full Command Set

```
/geo audit <url>              # full audit with parallel subagents
/geo quick <url>              # 60-second snapshot
/geo citability <url>         # AI citation readiness score
/geo crawlers <url>           # AI crawler access map
/geo llmstxt <url>            # analyze/generate llms.txt
/geo brand <url>              # brand mention + authority score
/geo platform <url>           # per-platform optimization audit
/geo schema <url>             # schema.org audit + JSON-LD generation
/geo technical <url>          # technical SEO + GEO checks
/geo content <url>            # E-E-A-T + content quality
/geo report                   # generate client markdown report
/geo report-pdf               # generate PDF with charts
/geo prospect <cmd>           # CRM pipeline management
/geo proposal <domain>        # auto-generate service proposal
/geo compare <domain>         # monthly delta / progress report
```
