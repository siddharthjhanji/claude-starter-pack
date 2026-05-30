---
name: wondel-skills
description: "wondelai/skills — 42 classic books/frameworks distilled as invokable Claude skills. Product (Lean Startup, Inspired, JTBD, Hooked), strategy (Blue Ocean, Crossing the Chasm, Obviously Awesome), engineering (Clean Code, DDD, DDIA, Pragmatic Programmer)."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# Wondel Skills — 42 Classic Books as Skills

Repo: https://github.com/wondelai/skills
Vendored 2026-05-30: all 42 in `~/.claude/skills/`. Each is a knowledge base from a well-known book or framework, structured so Claude can apply the book's frameworks when triggered.

## Catalog by domain

### Product & UX (16)
- `lean-startup` — Build–Measure–Learn cycle (Eric Ries)
- `lean-ux` — hypothesis-driven UX (Gothelf/Seiden)
- `design-sprint` — 5-day GV sprint (Knapp)
- `inspired-product` — product mgmt principles (Cagan)
- `continuous-discovery` — outcome over output (Torres)
- `jobs-to-be-done` — JTBD interview + framing
- `mom-test` — customer interview rules (Fitzpatrick)
- `hooked-ux` — habit loops (Eyal)
- `microinteractions` — small-detail UX (Saffer)
- `top-design` — top-tier visual design
- `design-everyday-things` — affordances & signifiers (Norman)
- `ux-heuristics` — Nielsen's 10 + audits
- `refactoring-ui` — Tailwind-flavored UI fixes (Schoger/Wathan)
- `web-typography` — type pairing & hierarchy
- `ios-hig-design` — Apple HIG for SwiftUI/UIKit
- `high-perf-browser` — Core Web Vitals & perf

### Marketing / Sales / Strategy (17)
- `obviously-awesome` — positioning canvas (Dunford)
- `blue-ocean-strategy` — uncontested markets (Kim/Mauborgne)
- `crossing-the-chasm` — early-adopter → mainstream (Moore)
- `hundred-million-offers` — irresistible offer construction (Hormozi)
- `one-page-marketing` — 9-square marketing plan (Dib)
- `predictable-revenue` — outbound SDR machine (Ross)
- `storybrand-messaging` — StoryBrand 7-part framework (Miller)
- `scorecard-marketing` — interactive quiz lead gen
- `contagious` — STEPPS virality (Berger)
- `made-to-stick` — SUCCESs framework (Heath bros)
- `influence-psychology` — Cialdini's 6 principles
- `negotiation` — Never Split the Difference (Voss)
- `cro-methodology` — funnel audit + A/B test design
- `improve-retention` — cohort retention playbook
- `traction-eos` — EOS / Traction operating system (Wickman)
- `37signals-way` — REWORK / Shape Up principles
- `drive-motivation` — autonomy/mastery/purpose (Pink)

### Engineering (9)
- `clean-code` — Uncle Bob's readability rules
- `clean-architecture` — dependency rule + boundaries (Martin)
- `domain-driven-design` — DDD strategic & tactical patterns (Evans)
- `software-design-philosophy` — Ousterhout's complexity management
- `refactoring-patterns` — Fowler's catalog
- `pragmatic-programmer` — DRY, orthogonality, tracer bullets (Hunt/Thomas)
- `release-it` — stability patterns: circuit breakers, bulkheads, timeouts (Nygard)
- `ddia-systems` — Designing Data-Intensive Apps (Kleppmann)
- `system-design` — capacity, queues, caching, sharding

## How they work
Each skill loads the book's mental model + checklist into context when triggered. Useful for: code reviews, product decisions, pitch deck framing, retention diagnosis. Not a substitute for the books themselves; a way to put their frameworks one trigger away.

## Trigger style
Most skills name the book ("when the user mentions Blue Ocean" / "STEPPS" / "JTBD"). For diagnoses without a named framework, Claude picks the right one — e.g., "my landing page isn't converting" → [[cro-methodology]]; "should we even build this?" → [[mom-test]] + [[continuous-discovery]].
