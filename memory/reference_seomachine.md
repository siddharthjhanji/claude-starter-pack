---
name: SEO Machine
description: Claude Code workspace for long-form SEO content creation — commands, agents, and 26 marketing skills covering research, writing, optimization, CRO, WordPress publishing, landing pages, and analytics-driven prioritization.
type: reference
---

Repo: https://github.com/TheCraigHewitt/seomachine
Install: `git clone` → `pip install -r data_sources/requirements.txt` → `claude-code .`
License: MIT | Author: TheCraigHewitt

---

## Architecture: Command → Agent Model

**Commands** (`.claude/commands/`) orchestrate multi-step workflows.
**Agents** (`.claude/agents/`) are specialized roles auto-invoked by commands.
**Skills** (`.claude/skills/`) are 26 standalone marketing expertise modules.
**Python pipeline** (`data_sources/modules/`) provides real analytics: GA4, GSC, DataForSEO.

**Content pipeline directory flow:**
```
topics/ → research/ → drafts/ → review-required/ → published/
rewrites/   landing-pages/   audits/
```

**Context files** (customize these for any business):
- `context/brand-voice.md` — tone, messaging pillars
- `context/style-guide.md` — grammar, formatting
- `context/seo-guidelines.md` — keyword and structure rules
- `context/internal-links-map.md` — key pages for internal linking
- `context/features.md` — product features
- `context/competitor-analysis.md` — competitive intel
- `context/cro-best-practices.md` — conversion guidelines
- `context/landing-page-templates.md` — landing page structures

---

## Commands

### Content Creation
| Command | Usage | What It Does |
|---------|-------|-------------|
| `/research [topic]` | `/research podcast hosting` | Keyword research + top-10 competitor analysis + content brief in `research/` |
| `/write [topic]` | `/write podcast hosting guide` | 2,000–3,000+ word SEO article; auto-triggers 4 agents post-write |
| `/article [topic]` | `/article best project management tools` | Mandatory 4-step pipeline: SERP analysis → social research → planning → section-by-section writing |
| `/rewrite [topic]` | `/rewrite existing-post.md` | Updates content from analysis findings; saves to `rewrites/` |
| `/optimize [file]` | `/optimize drafts/article.md` | Final SEO audit: keyword density, placement, meta, links, structure |
| `/analyze-existing [URL\|file]` | `/analyze-existing https://site.com/post` | Content health score + SEO audit + update priority recommendation |
| `/cluster [topic]` | `/cluster content marketing` | Full topic cluster: pillar page + 8-12 supporting articles + linking map |
| `/scrub [file]` | `/scrub drafts/article.md` | Removes invisible Unicode watermarks (U+200B, U+FEFF, etc.), replaces AI em-dash patterns |
| `/priorities` | `/priorities` or `/priorities quick` | Analytics-driven content roadmap using all 5 research modules (~10 min) or quick wins only |
| `/publish-draft [file]` | `/publish-draft drafts/article.md` | Publishes to WordPress via REST API with Yoast SEO metadata |

### Research Commands
| Command | What It Does |
|---------|-------------|
| `/research-serp "keyword"` | SERP analysis: content type, avg word count, SERP features, difficulty, intent |
| `/research-gaps` | Competitor gap analysis: what 7 competitors rank for that you don't |
| `/research-trending` | Trending topics: 7-day vs 30-day impression growth from GSC |
| `/research-performance` | Content performance matrix: Stars / Overperformers / Underperformers / Declining |
| `/research-topics` | Topical authority clusters: strong / moderate / weak + coverage gaps |

### Landing Page Commands
| Command | Usage | What It Does |
|---------|-------|-------------|
| `/landing-write [topic]` | `--type seo\|ppc --goal trial\|demo\|lead` | Conversion-optimized landing page (not blog article) |
| `/landing-audit [URL\|file]` | `--goal trial\|demo\|lead` | CRO audit: score 0-100, above-fold, CTAs, trust signals, friction |
| `/landing-research [topic]` | `--type seo\|ppc` | Research brief for landing page: keyword, intent, 5-10 competitor pages |
| `/landing-competitor [URL]` | `/landing-competitor https://competitor.com/pricing` | Deep competitor page analysis: headline, CTA, trust signals, structure |
| `/landing-publish [file]` | `--noindex --template slug` | Publishes as WordPress page (not post); requires score ≥75 |

---

## Agents (auto-invoked or called manually)

### After `/write` — these 4 auto-run:
1. **seo-optimizer** — on-page audit, keyword density (target 1-2%), SERP feature optimization, score 0-100
2. **meta-creator** — 5 meta title variations (50-60 chars) + 5 description variations (150-160 chars) with A/B guidance
3. **internal-linker** — strategic internal link recommendations with anchor text + SEO impact prediction
4. **keyword-mapper** — keyword placement map, distribution heatmap, cannibalization risk detection

### Other Agents:
| Agent | Purpose |
|-------|---------|
| **content-analyzer** | Chains 5 Python modules for search intent, keyword density, length comparison, readability, SEO quality (0-100) |
| **editor** | Transforms AI-pattern content into human-sounding writing with humanity scoring + specific rewrites |
| **performance** | GA4 + GSC + DataForSEO opportunity scoring — identifies highest-ROI content tasks |
| **headline-generator** | 10+ headline variations with proven formulas + conversion scoring + A/B test strategy |
| **cro-analyst** | Psychological CRO analysis: cognitive load, loss aversion, social proof, trust signals |
| **landing-page-optimizer** | CRO score 0-100 across 5 categories: above-fold, CTAs, trust, structure, SEO |
| **cluster-strategist** | Pillar/spoke architecture, cannibalization prevention, internal linking architecture, sequencing |

---

## Python Analysis Pipeline

Located in `data_sources/modules/`:

| Module | What It Does |
|--------|-------------|
| `search_intent_analyzer.py` | Classifies intent: informational / navigational / transactional / commercial |
| `keyword_analyzer.py` | Density, distribution, clustering, stuffing risk detection |
| `content_length_comparator.py` | Benchmarks word count against top 10-20 SERP results |
| `readability_scorer.py` | Flesch Reading Ease, grade level, sentence structure |
| `seo_quality_rater.py` | Comprehensive SEO score 0-100 |
| `landing_page_scorer.py` | CRO score 0-100 for landing pages |
| `opportunity_scorer.py` | 8-factor weighted scoring: Volume(25%) Position(20%) Intent(20%) Competition(15%) Cluster(10%) CTR(5%) Freshness(5%) Trend(5%) |

### Standalone Research Scripts (run from repo root):
```bash
python3 research_quick_wins.py           # page 2 keywords (positions 11-20)
python3 research_competitor_gaps.py      # keywords competitors rank for, you don't
python3 research_performance_matrix.py   # stars/overperformers/underperformers/declining
python3 research_priorities_comprehensive.py
python3 research_serp_analysis.py "kw"
python3 research_topic_clusters.py
python3 research_trending.py
python3 seo_baseline_analysis.py
python3 seo_bofu_rankings.py
python3 seo_competitor_analysis.py
```

### Data Integrations:
- `google_analytics.py` — GA4: traffic, engagement, conversions
- `google_search_console.py` — rankings, impressions, clicks, CTR
- `dataforseo.py` — SERP positions, keyword metrics, competitor gaps
- `data_aggregator.py` — unified analytics across all sources
- `wordpress_publisher.py` — REST API publishing with Yoast SEO fields

---

## 26 Marketing Skills

All in `.claude/skills/`. Triggered automatically by context or invoked by name.

### The Meta-Skill
**`growth-lead`** — Senior growth advisor persona (15+ yrs experience). Direct, data-driven, no hedging. Core beliefs: strategy = saying no, distribution > creation, revenue is the only metric, done > perfect. Always identifies bottleneck first.

### Copywriting & CRO
| Skill | Trigger Keywords | What It Does |
|-------|-----------------|-------------|
| `copywriting` | "write copy", "improve this copy", "headline help", "CTA copy" | Marketing copy for any page (homepage, pricing, feature, about) |
| `page-cro` | "CRO", "isn't converting", "improve conversions" | Page conversion audit + prioritized recommendations |
| `form-cro` | "form", "form conversion" | Form-specific CRO |
| `signup-flow-cro` | "signup flow", "registration" | Signup/registration flow optimization |
| `onboarding-cro` | "onboarding", "activation" | Post-signup activation optimization |
| `popup-cro` | "popup", "modal", "exit intent" | Popup/modal optimization |
| `paywall-upgrade-cro` | "paywall", "upgrade flow" | Paywall and upgrade conversion |

### Strategy
| Skill | Trigger Keywords | What It Does |
|-------|-----------------|-------------|
| `content-strategy` | "content strategy", "what to write", "topic clusters" | Content plan: searchable + shareable content mix |
| `pricing-strategy` | "pricing", "freemium", "value metric", "Van Westendorp" | SaaS pricing tiers, packaging, willingness-to-pay research |
| `launch-strategy` | "launch", "Product Hunt", "go-to-market", "waitlist" | Phased launch strategy, channel selection, momentum |
| `marketing-ideas` | "marketing ideas", "growth ideas" | Generates channel + campaign ideas |

### Channels
| Skill | Trigger Keywords | What It Does |
|-------|-----------------|-------------|
| `email-sequence` | "email sequence", "drip campaign", "nurture", "lifecycle emails" | Full email sequence design: welcome, nurture, re-engagement |
| `social-content` | "social content", "social posts" | Social media content strategy + creation |
| `paid-ads` | "paid ads", "Google ads", "Facebook ads", "PPC" | Paid acquisition strategy |

### SEO
| Skill | Trigger Keywords | What It Does |
|-------|-----------------|-------------|
| `seo-audit` | "SEO audit", "SEO issues" | On-page SEO audit |
| `programmatic-seo` | "programmatic SEO", "pages at scale", "location pages", "vs pages" | Template-based SEO pages at scale (avoids thin content) |
| `competitor-alternatives` | "alternative page", "vs page", "comparison page" | 4 formats: singular alt, plural alts, you-vs-competitor, competitor-vs-competitor |
| `schema-markup` | "schema", "structured data", "rich results" | Schema.org markup strategy |

### Analytics & Testing
| Skill | Trigger Keywords | What It Does |
|-------|-----------------|-------------|
| `analytics-tracking` | "tracking", "analytics setup", "events" | Analytics implementation guidance |
| `ab-test-setup` | "A/B test", "split test", "experiment" | A/B test design, significance, interpretation |

### Growth Levers
| Skill | Trigger Keywords | What It Does |
|-------|-----------------|-------------|
| `referral-program` | "referral", "affiliate", "word of mouth", "viral loop" | Referral/affiliate program design + incentive structure |
| `free-tool-strategy` | "free tool", "calculator", "engineering as marketing", "lead gen tool" | Engineering-as-marketing: tool ideation, SEO value, lead gen |
| `marketing-psychology` | "psychology", "cognitive bias", "persuasion", "why people buy" | 70+ mental models for marketing: loss aversion, social proof, scarcity, etc. |

### Context
| Skill | What It Does |
|-------|-------------|
| `product-marketing-context` | Loaded first by all skills — provides product/audience context so skills don't re-ask known info |
| `copy-editing` | Editing and polish |

---

## Content Quality Standards

### Article Structure (`/write`)
- H1: primary keyword, compelling, <60 chars
- First 100 words: keyword in first paragraph
- H2/H3: keyword in 2-3 subheadings
- Length: 2,000–3,000+ words (benchmark against SERP top-10)
- Meta title: 50-60 chars
- Meta description: 150-160 chars
- Keyword density: 1-2%
- URL slug: keyword-based, hyphens, lowercase

### Landing Pages (`/landing-write`)
- SEO pages: longer, comprehensive, organic-traffic optimized
- PPC pages: shorter, distraction-free, paid-traffic optimized
- Must pass `/landing-audit` score ≥75 before publishing
- Goals: `trial` | `demo` | `lead`

### `/priorities` Performance Quadrants
| Quadrant | Definition | Action |
|----------|-----------|--------|
| ⭐ Stars | High traffic + good rankings | Maintain & expand |
| 🚀 Overperformers | High traffic + poor rankings | Learn why, improve SEO |
| ⚠️ Underperformers | Low traffic + good rankings | Fix CTR (title/meta) |
| 📉 Declining | Low traffic + poor rankings | Refresh or redirect |

### WordPress Publishing
- Uses REST API + custom MU-plugin (`wordpress/seo-machine-yoast-rest.php`)
- Exposes Yoast SEO fields: meta title, meta description, focus keyword
- Articles formatted in WordPress block format (HTML comments in Markdown)
- Blog posts: `--type post` | Pages: `--type page` | Custom post types: `--type [slug]`
