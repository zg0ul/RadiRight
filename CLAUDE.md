# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

RadiRight is a Flutter mobile app that helps doctors choose appropriate radiological exams based on ACR (American College of Radiology) Appropriateness Criteria. It uses decision trees to guide clinicians through clinical scenarios to imaging recommendations. Supports English and Arabic (RTL).

## Common Commands

```bash
# Install dependencies
flutter pub get

# Run code generation (Riverpod, Freezed, JSON serialization)
dart run build_runner build --delete-conflicting-outputs

# Generate localization files from ARB files
flutter gen-l10n

# Run the app
flutter run

# Analyze code
flutter analyze

# Format code
dart format .
```

After modifying any file with `@riverpod`, `@freezed`, or `@JsonSerializable` annotations, run `build_runner` to regenerate the `.g.dart` / `.freezed.dart` files.

After modifying `lib/l10n/app_en.arb` or `lib/l10n/app_ar.arb`, run `flutter gen-l10n`.

## Architecture

**Clean Architecture with feature-based modules.** Each feature in `lib/features/` follows:
- `data/` — Datasource interfaces + implementations (Firebase), repositories
- `domain/` — Models (Freezed), enums, business logic services
- `presentation/` — Riverpod providers/notifiers, screens, widgets

**Key directories:**
- `lib/app/` — App-level config: routing (GoRouter), theming (Material 3 light/dark), app config
- `lib/core/` — Shared services (CacheService, SecureStorage), error handling, network (Dio), utilities, constants
- `lib/shared/` — Cross-feature models and widgets
- `lib/l10n/` — ARB localization files (en, ar)
- `assets/data/decision_trees/` — Decision tree JSON files

## State Management — Riverpod 3.x

All providers use `@riverpod` annotation with code generation. Patterns:

```dart
@riverpod                                    // Auto-dispose simple provider
Type name(Ref ref) => ...;

@Riverpod(keepAlive: true)                   // Kept alive (e.g., DecisionEngine)
class MyNotifier extends _$MyNotifier { ... }
```

The app uses `hooks_riverpod` + `flutter_hooks` — widgets extend `HookConsumerWidget` or `ConsumerWidget`.

## Navigation — GoRouter

Routes defined in `lib/app/routing/app_router.dart` with auth and subscription guards. Route path constants live in `lib/app/routing/routes.dart`. The router itself is a Riverpod provider (`appRouterProvider`).

## Error Handling — Either + Sealed Classes

Repositories return `Either<AppError, T>` (from `fpdart`). `AppError` is a Freezed sealed class with variants: `network`, `auth`, `firebase`, `validation`, `unknown`. `RepositoryErrorMapper` maps exceptions to the appropriate `AppError`.

## Decision Engine

Core assessment logic in `lib/features/assessment/domain/services/decision_engine.dart`. It's a `@Riverpod(keepAlive: true)` notifier that:
- Loads a decision tree (from JSON) for a selected topic
- Traverses `DecisionNode` (sealed: `QuestionNode` | `ResultNode`)
- Supports conditional/computed navigation rules, back navigation, answer history tracking
- Produces `ImagingRecommendation` results with appropriateness levels and radiation info

Decision tree JSON lives in `assets/data/decision_trees/`. Node schema includes bilingual text fields (`questionText` / `questionTextAr`).

## Data Models

All models use Freezed for immutability and JSON serialization. Key models:
- `DecisionNode` (sealed) — `QuestionNode` | `ResultNode`
- `Topic`, `Panel`, `AnswerOption`, `ImagingRecommendation`
- `AppUser`, `Subscription`

## Firebase

- **Auth**: Email/password via `FirebaseAuthDatasource`
- **Firestore**: Collections — `users/{userId}`, `subscriptions/{userId}`, `assessmentHistory/{docId}`
- All Firebase calls abstracted behind datasource interfaces for testability

## Localization

ARB-based with `flutter gen-l10n`. Template: `lib/l10n/app_en.arb`. Access via `AppLocalizations.of(context)!.keyName`. Locale state managed by `localeNotifierProvider`. Arabic locale triggers RTL layout via `Directionality` widget in `root_app_widget.dart`.

## Responsive Design

Uses `flutter_screenutil` with design base 430x932. Spacing constants defined in `lib/core/constants/`.

## Conventions

- **Files**: snake_case. **Classes**: PascalCase. **Functions/vars**: camelCase.
- Conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`
- No hardcoded user-facing strings — all text goes through l10n ARB files
- All new features follow the `data/domain/presentation` layer structure
- Backend calls abstracted through datasource interfaces
