# GRAP

GRAP is a mobile marketing studio built with Flutter. It helps teams create AI-assisted marketing content, images, and social media posts from a single app.

## Project Scope

GRAP focuses on three core marketing workflows:

| Area | Description |
|------|-------------|
| **Marketing content generation** | Write blogs, ads, emails, and other copy with AI-assisted prompts and templates. |
| **Marketing image generation** | Create visuals, banners, and campaign artwork with style and aspect-ratio controls. |
| **Social media post generation** | Draft and preview posts for platforms such as Instagram, with publish-ready layouts. |

Supporting capabilities include auth, profile settings, usage and billing, subscriptions, history, and social account linking.

## Tech Stack

- **Flutter** (Android & iOS)
- **Riverpod** — state management and dependency injection
- **GoRouter** — declarative navigation
- **Google Fonts** — Plus Jakarta Sans & Inter

## Directory Flow

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # MaterialApp + theme + router
│
├── core/                     # Shared infrastructure
│   ├── constants/            # App name, routes, branding
│   ├── routing/              # GoRouter configuration
│   ├── theme/                # Colors, spacing, typography, ThemeData
│   └── widgets/              # Reusable UI primitives
│
└── features/                 # Feature modules (clean architecture)
    ├── auth/
    │   ├── domain/           # Entities, repository contracts, use cases
    │   ├── data/             # Datasources + repository implementations
    │   └── presentation/     # Providers, pages, feature widgets
    │
    └── studio/               # Marketing studio screens & logic
        ├── domain/
        ├── data/
        └── presentation/     # pages, widgets, shell (bottom nav)
```

**Dependency rule:** `presentation → domain ← data`. The domain layer has no Flutter imports.

For the full module map, design patterns, and scalability notes, see [ARCHITECTURE.txt](ARCHITECTURE.txt).

## Coding Guidelines

Project conventions, architecture rules, theme tokens, typography, and spacing are documented in:

**[guide/CODE_GUIDELINES.md](guide/CODE_GUIDELINES.md)**

Read that file before adding features or UI.

## Getting Started

```bash
flutter pub get
flutter run -d android   # or your device id
flutter run -d ios
flutter test
```

## Platforms

- `android/` — Android shell
- `ios/` — iOS shell

Web, desktop, and Linux targets are not included in this project.
