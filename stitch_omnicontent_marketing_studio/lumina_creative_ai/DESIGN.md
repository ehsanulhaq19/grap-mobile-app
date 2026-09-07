---
name: Lumina Creative AI
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#494454'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#7b7486'
  outline-variant: '#cbc3d7'
  surface-tint: '#6d3bd7'
  primary: '#6b38d4'
  on-primary: '#ffffff'
  primary-container: '#8455ef'
  on-primary-container: '#fffbff'
  inverse-primary: '#d0bcff'
  secondary: '#006c49'
  on-secondary: '#ffffff'
  secondary-container: '#6cf8bb'
  on-secondary-container: '#00714d'
  tertiary: '#a12e70'
  on-tertiary: '#ffffff'
  tertiary-container: '#c0488a'
  on-tertiary-container: '#fffbff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#e9ddff'
  primary-fixed-dim: '#d0bcff'
  on-primary-fixed: '#23005c'
  on-primary-fixed-variant: '#5516be'
  secondary-fixed: '#6ffbbe'
  secondary-fixed-dim: '#4edea3'
  on-secondary-fixed: '#002113'
  on-secondary-fixed-variant: '#005236'
  tertiary-fixed: '#ffd8e7'
  tertiary-fixed-dim: '#ffafd3'
  on-tertiary-fixed: '#3d0026'
  on-tertiary-fixed-variant: '#85145a'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  headline-xl:
    fontFamily: Plus Jakarta Sans
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 36px
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.05em
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 4px
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  xxl: 48px
  container-margin: 20px
  gutter: 16px
---

## Brand & Style

This design system is built on the principles of **Sophisticated Professionalism** and **Charming Creativity**. It targets marketing professionals who require an AI tool that feels like a high-end concierge rather than a cold utility.

The aesthetic blends **Modern Minimalism** with **Glassmorphism**. It utilizes generous whitespace, soft translucent layers for AI-driven insights, and a tactile, friendly interface. The emotional response should be one of calm confidence, where the user feels empowered by a polite, intelligent assistant. All interactions should feel fluid and lightweight, avoiding heavy visual weight in favor of airy, elevated surfaces.

## Colors

The palette is designed to be gentle on the eyes while clearly signaling intent through soft color associations.

- **Primary (Violet):** Used for the core AI identity, primary calls to action, and creative generation states.
- **Secondary (Mint):** Reserved for "success" states, approval actions, and performance metrics. It acts as a polite nod to the user's progress.
- **Tertiary (Rose/Peach):** Used sparingly for highlights, warm notifications, or "human-centric" features like collaboration.
- **Neutrals (Slate):** Professional grays ensure high legibility for long-form marketing copy and structural borders.
- **Background (Off-White):** Provides a warm, creamy canvas that feels more premium and approachable than pure white.

## Typography

The typography system uses **Plus Jakarta Sans** for headlines to provide a soft, modern, and slightly geometric personality that feels friendly. **Inter** is utilized for body copy and UI labels to ensure maximum legibility and a systematic, clean feel.

To maintain the premium feel, use tight letter-spacing on large headlines and generous line-heights for body content to facilitate easy reading of generated marketing copy.

## Layout & Spacing

This design system employs a **Fluid Grid** model optimized for mobile-first interactions. The core spacing unit is **4px**, with most components utilizing the **16px (md)** or **24px (lg)** increments to ensure an airy, uncrowded layout.

- **Mobile:** 4-column grid with 20px side margins and 16px gutters.
- **Safe Areas:** Adhere strictly to mobile safe-area insets for top and bottom bars.
- **Vertical Rhythm:** Content blocks should be separated by 32px or 48px to clearly distinguish between different sections of the AI generation flow.

## Elevation & Depth

Hierarchy is established through **Tonal Layering** and **Ambient Shadows**.

1.  **Base Layer:** The off-white background (#F9FAFB).
2.  **Surface Layer:** Primary cards and containers use pure white (#FFFFFF) with a very soft, diffused shadow (Blur: 20px, Y: 4px, Opacity: 4% of #64748B).
3.  **Glass Layer (AI Elements):** Components that represent "AI Thinking" or "Generated Insights" use a backdrop filter (Blur: 12px) with a semi-transparent white fill (80% opacity). This creates a sense of depth and intelligence.
4.  **Interactive States:** On press, elements should slightly decrease in elevation (less shadow) to simulate physical feedback.

## Shapes

The shape language is defined by **High Roundedness** to project warmth and approachability.

- **Standard Elements (Buttons, Inputs, Small Cards):** Use a 16px radius (rounded-lg equivalent).
- **Large Containers (Sheet Modals, Full-Width Cards):** Use a 24px radius (rounded-xl) for a more organic, modern appearance.
- **Avatars & Status Indicators:** Utilize full pill-shapes or circles.

Borders should be kept minimal, using a 1px stroke in a light slate gray (#E2E8F0) only when necessary to define boundaries on white surfaces.

## Components

### Buttons
- **Primary:** Filled with #8B5CF6, white text, 16px corner radius. Subtle hover/active state with a slight darken.
- **Secondary (Polite):** Ghost style with #10B981 border and text, or soft-fill with 10% opacity of the secondary color.
- **AI Action:** Gradient fill (Primary to Tertiary) with a subtle glassmorphic shimmer overlay.

### Input Fields
- Outlined with a 1px slate-200 border. On focus, the border transitions to Primary Violet with a 2px soft glow. Labels should always be visible above the field in Label-MD style.

### Cards
- White background, 16px radius, soft ambient shadow. For AI-generated previews, use the Glassmorphism style with a very thin #FFFFFF33 border.

### Chips & Tags
- Used for marketing categories or keywords. Pill-shaped (fully rounded) with a soft background (e.g., 5% Primary color) and bolded text for the label.

### AI Progress/Loading
- Instead of a traditional spinner, use a pulsing, soft-blurred lavender orb that moves organically, reflecting the "creative" nature of the engine.

### Lists
- Clean, borderless list items separated by whitespace or a 1px hairline divider that stops 16px from the edges.