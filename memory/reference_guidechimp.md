---
name: guidechimp-tour-builder
description: "Custom skill that wraps Labs64/GuideChimp (npm). Generates production-ready GuideChimp tours — step JSON, init code, plugin wiring, route configs for SPAs. Pairs with onboarding-cro for strategy. EUPL-1.2 or commercial license."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4acd8e0c-c6b0-44e9-a1ea-93274c928bba
---

# GuideChimp Tour Builder (custom skill)

Skill: `~/.claude/skills/guidechimp-tour-builder/` (also in starter-pack)
Wraps: https://github.com/Labs64/GuideChimp (v5.x on npm)
Live examples: https://github.com/Labs64/GuideChimp-tours

## What it generates
- Step JSON / JS arrays
- Init code for React, Vue, vanilla
- Route-keyed tours for SPAs (Vue Router plugin built-in)
- Analytics wiring (Segment, GA4, Mixpanel)
- IM8-branded CSS overrides

## When to invoke
- "Build me an onboarding tour for X"
- "I need an in-app walkthrough"
- "Generate GuideChimp config for the dashboard"
- "Set up product tour for [feature]"

## When NOT to invoke
- Strategy/copy only → [[onboarding-cro]] or [[signup-flow-cro]]
- No code access (Shopify/Webflow) → recommend a no-code tool instead
- Just wants a Chrome-extension-style tour without shipping code → mention GuideChimp Chrome Extension

## Critical hard rules baked into the skill
1. Refuses brittle selectors (e.g., `.css-1abc234`) — demands stable `data-tour-id`
2. Sets `exitOverlay: false` by default for required onboarding flows
3. Always wires analytics on `onAfterChange` + `onStop`
4. Gates first-visit flows with localStorage / feature flag (never on-mount only)
5. Surfaces the commercial-license question for closed-source apps

## Why this is custom, not vendored
GuideChimp itself is a JS library, not a skill. This is a wrapper that teaches Claude to USE it productively without the user having to look up the API surface every time.

## License
GuideChimp is dual-licensed EUPL-1.2 OR commercial. **For IM8 / Prenetics (closed-source) the commercial license applies** — see https://www.labs64.com/guidechimp/#guidechimp-licensing. The skill flags this proactively.

## Cross-skill workflow
```
[[onboarding-cro]] → strategy + step list
[[copywriting]] → polish titles/descriptions
guidechimp-tour-builder → ship the JS
[[analytics-tracking]] → instrument funnel
[[ab-test-setup]] → test variants
```
