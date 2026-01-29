# RadiRight Architecture

## Overview

RadiRight follows Clean Architecture principles with feature-based organization. This document explains the architectural decisions and patterns used throughout the codebase.

## Architectural Layers

### 1. Presentation Layer
- **Screens**: UI components that users interact with
- **Widgets**: Reusable UI building blocks
- **Providers**: State management using Riverpod 3.x

### 2. Domain Layer
- **Models**: Data structures (using Freezed for immutability)
- **Enums**: Type-safe enumerations
- **Services**: Business logic (e.g., DecisionEngine)

### 3. Data Layer
- **Datasources**: Data access interfaces and implementations
- **Repositories**: Data abstraction layer

## State Management

We use **Riverpod 3.x** with `@riverpod` annotations for code generation.

### Provider Types

```dart
// Simple provider
@riverpod
Dio dio(Ref ref) => Dio();

// Async provider
@riverpod
Future<List<Panel>> panels(Ref ref) async {
  final repository = ref.watch(assessmentRepositoryProvider);
  return repository.getPanels();
}

// Notifier (stateful)
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Stream<AppUser?> build() {
    return ref.watch(authRepositoryProvider).authStateChanges;
  }
}
```

## Navigation

Uses **go_router** for declarative navigation with route guards.

```dart
@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    redirect: (context, state) {
      // Auth and subscription guards
    },
    routes: [...],
  );
}
```

## Error Handling

### AppError (Sealed Class)
```dart
sealed class AppError {
  const factory AppError.network(...) = NetworkError;
  const factory AppError.auth(...) = AuthError;
  const factory AppError.firebase(...) = FirebaseError;
  // ...
}
```

### Repository Pattern with Either
```dart
Future<Either<AppError, User>> signIn(...) async {
  try {
    final user = await datasource.signIn(...);
    return Right(user);
  } catch (e) {
    return Left(RepositoryErrorMapper.mapException(e));
  }
}
```

## Data Models

Using **Freezed** for immutable data classes:

```dart
@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    required String id,
    required SubscriptionTier tier,
    // ...
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}
```

## Decision Engine

The core assessment logic uses a **Decision Tree** pattern:

```dart
sealed class DecisionNode {
  const factory DecisionNode.question({
    required String id,
    required String questionText,
    required List<AnswerOption> options,
  }) = QuestionNode;

  const factory DecisionNode.result({
    required String id,
    required List<ImagingRecommendation> recommendations,
  }) = ResultNode;
}
```

The `DecisionEngine` service:
1. Loads decision tree for selected topic
2. Maintains navigation state
3. Tracks answer history
4. Supports back navigation
5. Returns final recommendations

## Backend Abstraction

All Firebase calls are abstracted through interfaces:

```dart
abstract class AuthDatasource {
  Stream<AppUser?> get authStateChanges;
  Future<AppUser> signInWithEmailAndPassword(...);
  Future<void> signOut();
}

class FirebaseAuthDatasource implements AuthDatasource {
  // Firebase-specific implementation
}
```

This allows for future backend migration without changing business logic.

## Theming

Material 3 design with:
- Light/Dark themes
- Custom color palette for appropriateness indicators
- RTL-aware layouts

```dart
static ThemeData get lightTheme => ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(...),
  // ...
);
```

## Localization

Using Flutter's built-in localization with ARB files:

```
lib/l10n/
├── app_en.arb
└── app_ar.arb
```

Access translations:
```dart
final l10n = AppLocalizations.of(context)!;
Text(l10n.startAssessment);
```

## Testing Strategy

### Unit Tests
- Decision engine traversal
- Subscription calculations
- Appropriateness level mapping

### Widget Tests
- Screen rendering
- User interactions

### Integration Tests
- Full assessment flow
- Auth flow
