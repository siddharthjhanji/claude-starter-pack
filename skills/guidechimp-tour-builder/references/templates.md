# GuideChimp Templates — copy-paste starting points

## 1. Minimal CDN tour (no build step)

```html
<!doctype html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/guidechimp@5/dist/guidechimp.min.css">
<script src="https://cdn.jsdelivr.net/npm/guidechimp@5/dist/guidechimp.min.js"></script>

<button data-tour="cta">Sign up</button>

<script>
  const tour = [
    { element: '[data-tour="cta"]', title: 'Get started', description: 'Click here.', position: 'top' }
  ];
  document.addEventListener('DOMContentLoaded', () => guideChimp(tour).start());
</script>
```

## 2. React: hook-based starter

```jsx
import { useEffect, useRef } from 'react';
import guideChimp from 'guidechimp';
import 'guidechimp/dist/guidechimp.min.css';

const STORAGE_KEY = 'app.onboarding.v1';

export function useOnboardingTour(steps, { startOnMount = true } = {}) {
  const guideRef = useRef(null);

  useEffect(() => {
    if (localStorage.getItem(STORAGE_KEY) === 'done') return;
    const guide = guideChimp(steps, {
      exitOverlay: false,
      showProgressbar: true,
      scrollBehavior: 'smooth',
    });
    guide.on('onStop', () => localStorage.setItem(STORAGE_KEY, 'done'));
    guideRef.current = guide;
    if (startOnMount) guide.start();
    return () => guide?.stop();
  }, [steps, startOnMount]);

  return guideRef;
}
```

## 3. Vue 3: composable with router integration

```ts
import { onMounted } from 'vue';
import { useRouter } from 'vue-router';
import guideChimp from 'guidechimp';
import vueRouter from 'guidechimp/dist/plugins/vueRouter.min.js';
import 'guidechimp/dist/guidechimp.min.css';

guideChimp.extend(vueRouter);

export function useTour(routeAwareTour) {
  const router = useRouter();
  onMounted(() => {
    const guide = guideChimp(routeAwareTour, { router });
    guide.start();
  });
}
```

## 4. Route-keyed tour (SPA, multiple pages)

```js
const tour = {
  "/onboarding/welcome": [
    { element: '#start-btn', title: 'Welcome!', description: 'Click to begin.' }
  ],
  "/onboarding/profile": [
    { element: '#first-name', title: 'Your name', description: 'Tell us who you are.' },
    { element: '#avatar-upload', title: 'Profile photo', description: 'Optional.' }
  ],
  "/dashboard.*": [
    { element: '[data-tour="kpi-cards"]', title: 'Your KPIs', description: 'Updated hourly.' },
    { element: '[data-tour="add-data"]', title: 'Add data', description: 'Connect a source.' }
  ]
};
```

## 5. Beacon (persistent hotspot) — not a sequential tour

```js
import guideChimp from 'guidechimp';
import beacons from 'guidechimp/dist/plugins/beacons.min.js';

guideChimp.extend(beacons);

const guide = guideChimp([]);
guide.showBeacon({
  element: '#new-feature',
  title: 'New: AI assistant',
  description: 'Try our new AI assistant — click here.',
  position: 'right'
});
```

## 6. Branded styling (IM8 example — deep crimson + gold)

```css
/* override CSS variables — load AFTER guidechimp.min.css */
:root {
  --gc-color-primary: #A40011;          /* IM8 crimson */
  --gc-color-primary-text: #FFFFFF;
  --gc-color-accent: #D4A84B;           /* IM8 gold */
  --gc-color-bg-tooltip: #2D0A10;       /* IM8 deep crimson */
  --gc-color-text-tooltip: #F5F0E8;
  --gc-tooltip-border-radius: 4px;      /* IM8 prefers sharp corners */
}
.guidechimp-tooltip-title {
  font-family: 'ABC Arizona Flare', serif;
  font-weight: 500;
}
.guidechimp-tooltip-description {
  font-family: 'Aeonik', sans-serif;
}
```

## 7. Analytics wiring (segment / GA4 / mixpanel)

```js
guide
  .on('onStart',        ()                 => track('onboarding_started',  { variant: 'v1' }))
  .on('onAfterChange',  ({ currentStep })  => track('onboarding_step',     { idx: currentStep.index, title: currentStep.title }))
  .on('onStop',         ()                 => track('onboarding_completed'))
  .on('onError',        (err)              => track('onboarding_error',    { msg: err.message }));

function track(event, props) {
  if (window.analytics) analytics.track(event, props);     // Segment
  if (window.gtag)      gtag('event', event, props);       // GA4
  if (window.mixpanel)  mixpanel.track(event, props);
}
```

## 8. Custom action buttons

```js
const tour = [{
  element: '#some-element',
  title: 'Custom buttons',
  description: 'Below this tooltip you\'ll see custom CTAs.',
  buttons: [
    { title: 'Open docs', class: 'gc-btn-secondary', onClick: () => window.open('/docs', '_blank') },
    { title: 'Skip tour',  class: 'gc-btn-skip',      onClick: (gc) => gc.stop() },
  ]
}];
```

## 9. Lazy-load pattern with the lazyLoading plugin

```js
import guideChimp from 'guidechimp';
import lazyLoading from 'guidechimp/dist/plugins/lazyLoading.min.js';

guideChimp.extend(lazyLoading);

const tour = [{
  element: '[data-tour="async-widget"]',
  title: 'Loaded async',
  description: 'GuideChimp will wait up to 5s for this to render.',
  lazyLoading: { waitFor: '[data-tour="async-widget"]', timeout: 5000 }
}];
```

## 10. Stop the tour from outside

```js
const guide = guideChimp(tour);
guide.start();

// Later, e.g., when user clicks "Skip" outside the tour UI:
document.querySelector('#skip-onboarding').addEventListener('click', () => guide.stop());
```
