---
name: Marketing Skills (coreyhaines31)
description: 34 marketing skills for AI agents — CRO, SEO, copywriting, paid ads, email, growth, strategy. Installed in claude-starter-pack/skills/
type: reference
---

## Source
Repo: https://github.com/coreyhaines31/marketingskills
Installed to: https://github.com/siddharthjhanji/claude-starter-pack/tree/main/skills

Built by Corey Haines. Foundation skill: `product-marketing-context` (read by all other skills first).

## 34 Skills by Category

### Conversion Optimization (CRO)
- `page-cro` — Any marketing page (homepage, landing, pricing)
- `signup-flow-cro` — Registration/trial activation flows
- `onboarding-cro` — Post-signup activation, time-to-value
- `form-cro` — Lead capture / contact forms (non-signup)
- `popup-cro` — Modals, overlays, slide-ins, banners
- `paywall-upgrade-cro` — In-app paywalls, upgrade screens, feature gates

### Content & Copy
- `copywriting` — Marketing page copy (homepage, landing, pricing)
- `copy-editing` — Edit and polish existing copy
- `cold-email` — B2B cold outreach emails and sequences
- `email-sequence` — Automated drip/lifecycle email flows
- `social-content` — LinkedIn, Twitter/X, Instagram scheduling & strategy

### SEO & Discovery
- `seo-audit` — Technical and on-page SEO diagnosis
- `ai-seo` — AI search optimization (AEO, GEO, LLMO, llms.txt)
- `programmatic-seo` — Scaled page generation from templates + data
- `site-architecture` — Page hierarchy, navigation, URL structure
- `competitor-alternatives` — Comparison and "alternatives to X" pages
- `schema-markup` — Structured data / JSON-LD

### Paid & Distribution
- `paid-ads` — Google, Meta, LinkedIn, Twitter/X campaigns
- `ad-creative` — Bulk ad creative generation and iteration
- `analytics-tracking` — GA4, event tracking setup and audit

### Measurement & Testing
- `ab-test-setup` — Experiment design, hypothesis, statistical significance

### Retention & Growth
- `churn-prevention` — Cancel flows, save offers, dunning, payment recovery
- `free-tool-strategy` — Marketing calculators and tools for lead gen / SEO
- `referral-program` — Referral and affiliate program design

### Strategy & Monetization
- `marketing-ideas` — 140 SaaS marketing idea frameworks
- `marketing-psychology` — Mental models and behavioral science applied to marketing
- `launch-strategy` — Product launches, feature announcements, release strategy
- `pricing-strategy` — Pricing, packaging, and monetization
- `content-strategy` — Content planning, topic decisions, editorial calendar
- `lead-magnets` — Lead magnet creation and optimization
- `customer-research` — Interviews, surveys, review mining, VOC, persona generation

### Sales & RevOps
- `revops` — Lead lifecycle, scoring, routing, pipeline management
- `sales-enablement` — Pitch decks, one-pagers, objection docs, demo scripts

### Foundation
- `product-marketing-context` — Central context doc read by ALL other skills first. Lives at `.agents/product-marketing-context.md`

## Usage
```
/page-cro          → optimize a marketing page
/email-sequence    → create drip campaign
/seo-audit         → diagnose SEO issues
/copywriting       → write marketing copy
```

## Skill interdependency
- All skills read `product-marketing-context` first
- `copywriting` ↔ `page-cro` ↔ `ab-test-setup`
- `revops` ↔ `sales-enablement` ↔ `cold-email`
- `seo-audit` ↔ `schema-markup` ↔ `ai-seo`
- `customer-research` → `copywriting`, `page-cro`, `competitor-alternatives`
