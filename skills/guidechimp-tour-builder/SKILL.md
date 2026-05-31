---
name: guidechimp-tour-builder
description: Generate GuideChimp tours for user onboarding, feature adoption, in-app walkthroughs, employee training, and product tours. Use when the user wants to build an in-app product tour, onboarding flow, feature highlight, guided walkthrough, hotspot/beacon, tooltip sequence, or interactive tutorial — and is ready to ship JavaScript code, not just strategy. Produces step JSON, init code, hooks (onBeforeChange/onAfterChange), and route-based tour configs for SPAs (Angular/Vue/React). Pairs with onboarding-cro and signup-flow-cro for strategy. For the strategy/copy side only, prefer onboarding-cro.
license: EUPL-1.2 (or commercial)
---

# GuideChimp Tour Builder

Build production-ready GuideChimp tours: step definitions, init code, plugin wiring, and SPA route configs.

## When to trigger

User wants any of these AS SHIPPABLE CODE (not just strategy):
- In-app product tour / onboarding flow
- Feature highlight walkthrough
- Hotspot / beacon / tooltip sequence
- Interactive in-app tutorial
- Employee training walkthrough
- Route-aware tour for an SPA (Angular/Vue/React)
- A tour that triggers on lazy-loaded or post-render content

For strategy/copy only (what steps to include, what each tooltip should say), use [[onboarding-cro]] or [[signup-flow-cro]] first, then come back here to ship the code.

## Three things to nail before generating code

1. **Selectors** — ask the user for CSS selectors of each target element. Stable attributes (`data-tour-id`, `aria-label`) beat brittle CSS like `:nth-child` or auto-generated classes. If they haven't added stable attributes, recommend adding them in the same PR.
2. **Trigger** — when should the tour start? First visit (localStorage gate), feature flag, manual button, query param like `?tour=onboarding`, or after a specific user action?
3. **Tour shape** — single flat tour (`[steps]`) or route-keyed tour (`{ "/path/.*": [steps] }`) for an SPA?

## Install (pick one)

```bash
# npm
npm install guidechimp

# CDN (no build step)
<script src="https://cdn.jsdelivr.net/npm/guidechimp@5/dist/guidechimp.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/guidechimp@5/dist/guidechimp.min.css">

# ES6 import
import GuideChimp from 'guidechimp';
import 'guidechimp/dist/guidechimp.min.css';
```

## Step shape (the only thing you really need to know)

```js
{
  element: '[data-tour-id="create-button"]',   // required (omit for centered "fake step")
  title: 'Create your first dashboard',
  description: 'Click here to start. <a href="/docs">Learn more</a>.',  // HTML allowed
  position: 'bottom',          // 'top' | 'bottom' | 'left' | 'right' (default: 'bottom')
  interaction: true,           // allow clicks on the highlighted element (default: true)
  class: 'tour-step-create',   // extra CSS class on the tooltip
  buttons: [                   // optional custom buttons (in addition to next/prev)
    { title: 'Skip', class: 'gc-btn-skip', onClick: () => guide.stop() }
  ],
  beforeChange: async ({ toStep }) => { /* hook before this step shows */ },
  afterChange:  async ({ fromStep }) => { /* hook after this step hides */ },
}
```

## Two tour shapes

**A) Flat tour** — simple, runs in order regardless of URL:
```js
const tour = [
  { element: '#nav-create', title: 'Create', description: 'Start here.' },
  { element: '#nav-reports', title: 'Reports', description: 'See your data.' },
  { title: 'You\'re all set!', description: 'No element = centered "fake step".' }
];
guideChimp(tour, options).start();
```

**B) Route-keyed tour** (for SPAs) — steps grouped by URL pattern; GuideChimp picks the matching key:
```js
const tour = {
  "/dashboards/.*/view/.*": [
    { element: "button[data-key='create']", title: "Create Dashboard", description: "..." }
  ],
  "/reports/.*": [
    { element: "#new-report", title: "New Report", description: "..." }
  ]
};
```

## Boilerplate: first-visit onboarding tour

```js
import guideChimp from 'guidechimp';
import 'guidechimp/dist/guidechimp.min.css';

const ONBOARDING_KEY = 'im8.onboarding.v1.completed';

const tour = [
  { element: '[data-tour="sidebar-home"]',     title: 'Welcome',  description: 'Here\'s your dashboard home.', position: 'right' },
  { element: '[data-tour="add-data"]',         title: 'Add Data', description: 'Connect a source to start.',   position: 'bottom' },
  { element: '[data-tour="invite-team"]',      title: 'Invite',   description: 'Bring your team in.',          position: 'left' },
  { title: 'You\'re ready.', description: 'Anything else? See the help menu.' }
];

const options = {
  position: 'bottom',
  showProgressbar: true,
  exitEscape: true,
  exitOverlay: false,        // don't let backdrop-click kill an onboarding flow
  scrollBehavior: 'smooth',
};

const guide = guideChimp(tour, options);

guide.on('onStop', () => {
  localStorage.setItem(ONBOARDING_KEY, '1');
});

if (!localStorage.getItem(ONBOARDING_KEY)) {
  // wait for DOM ready / data load before starting
  document.addEventListener('DOMContentLoaded', () => guide.start());
}
```

## SPA lazy-load pattern (Vue/React/Angular)

For elements that render after route change or async fetch, use the `onBeforeChange` hook to wait:

```js
const tour = [{
  element: '[data-tour="async-widget"]',
  title: 'Async element',
  description: 'Loaded after a fetch.',
  beforeChange: async () => {
    // wait up to 5s for the element to render
    await waitForSelector('[data-tour="async-widget"]', 5000);
  }
}];

function waitForSelector(sel, timeout = 3000) {
  return new Promise((resolve, reject) => {
    const start = Date.now();
    const tick = () => {
      if (document.querySelector(sel)) return resolve();
      if (Date.now() - start > timeout) return reject(new Error('timeout'));
      requestAnimationFrame(tick);
    };
    tick();
  });
}
```

Or use the [Lazy-loading plugin](https://github.com/Labs64/GuideChimp/wiki/Lazy-loading-plugin) for declarative `waitFor`.

## Plugins worth knowing

Load with `guideChimp.extend(pluginName)`:

| Plugin | Use when |
|---|---|
| `beacons` | You want persistent hotspots (pulsing dots) instead of a sequential tour |
| `blurredOverlay` | Backdrop should blur the page background rather than dim it |
| `lazyLoading` | Steps target elements that render after navigation/fetch |
| `vueRouter` | Tour spans multiple Vue Router routes (built-in handler) |
| `i18n` | Multi-language tours |
| `removeAttribution` | Hide GuideChimp branding (commercial license required) |
| `licensing` | Validate commercial license at runtime |

Full list: https://github.com/Labs64/GuideChimp/wiki/Plugins

## Events (use sparingly)

```js
guide
  .on('onStart',         (...args)         => analytics.track('tour_started'))
  .on('onBeforeChange',  ({ toStep })      => { /* before step shows */ })
  .on('onAfterChange',   ({ currentStep }) => analytics.track('tour_step', { idx: currentStep.index }))
  .on('onStop',          ()                => analytics.track('tour_completed'));
```

## Hard rules

1. **Don't use brittle selectors.** If the user's selector looks like `.css-1abc234`, refuse to generate the tour and ask them to add `data-tour-id` attributes first. Tours that break on the next deploy are worse than no tour.
2. **Set `exitOverlay: false` for required onboarding.** A misclick on the backdrop kills the flow otherwise.
3. **Always emit analytics events on `onAfterChange` and `onStop`.** Onboarding tours without funnel data can't be improved.
4. **Gate with localStorage / feature flag, never just on-mount.** Otherwise the tour fires every page load.
5. **For commercial use, surface the licensing question.** GuideChimp is EUPL-1.2 (copyleft) OR commercial. If the user is shipping closed-source, mention the commercial license requirement — don't silently assume it's fine.

## When NOT to use this skill

- User wants strategy only ("what should my onboarding flow look like?") → [[onboarding-cro]]
- User is on Shopify/Webflow without custom JS access → recommend Intro.js Lite or a no-code tool, not GuideChimp
- User needs a tour without writing any code → mention the GuideChimp Chrome Extension; the skill stops there
- Backend-only / no UI → not applicable

## Cross-skill workflow

```
1. [[onboarding-cro]] or [[signup-flow-cro]]  → decide steps + copy + success metric
2. [[copywriting]] or [[brand-copywriter]]    → polish step titles + descriptions
3. guidechimp-tour-builder (this skill)       → ship the JS
4. [[ab-test-setup]] or [[analytics-tracking]] → instrument the funnel
```

## License reference

GuideChimp is dual-licensed:
- **EUPL-1.2** (free, but copyleft — your code that uses it must also be open-sourced if distributed)
- **Commercial** ([Labs64](https://www.labs64.com/guidechimp/#guidechimp-licensing)) — required for closed-source products

For IM8 / Prenetics commercial work, the commercial license applies. Flag this in any tour you ship.
