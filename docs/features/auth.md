# Authentication Feature

## Overview

The authentication feature handles user registration, login, and session management using Firebase Authentication.

## Data Models

### AppUser
```dart
@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String email,
    String? name,
    String? photoUrl,
    required DateTime createdAt,
    DateTime? lastLoginAt,
  }) = _AppUser;
}
```

## Architecture

### Datasources

#### AuthDatasource (Abstract)
```dart
abstract class AuthDatasource {
  Stream<AppUser?> get authStateChanges;
  Future<AppUser?> get currentUser;
  Future<AppUser> signInWithEmailAndPassword({...});
  Future<AppUser> registerWithEmailAndPassword({...});
  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
}
```

#### FirebaseAuthDatasource
Implements `AuthDatasource` using Firebase Auth.

### Repository

```dart
abstract class AuthRepository {
  Stream<AppUser?> get authStateChanges;
  Future<Either<AppError, AppUser>> signIn({...});
  Future<Either<AppError, AppUser>> register({...});
  Future<Either<AppError, void>> signOut();
}
```

### Providers

#### AuthNotifier
```dart
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Stream<AppUser?> build() {
    return ref.watch(authRepositoryProvider).authStateChanges;
  }

  Future<void> signIn({...});
  Future<void> register({...});
  Future<void> signOut();
}
```

#### AuthFormState
Manages form state for login/register screens.

## Screens

### LoginScreen
- Email/password input
- Form validation
- Navigation to register
- Error display

### RegisterScreen
- Name, email, password, confirm password
- Creates trial subscription on success
- Navigation to login

## Firebase Structure

```
users/
  {userId}/
    - email: string
    - name: string (optional)
    - createdAt: timestamp
```

## Usage

```dart
// Check auth state
final user = ref.watch(authNotifierProvider).valueOrNull;

// Sign in
await ref.read(authNotifierProvider.notifier).signIn(
  email: 'user@example.com',
  password: 'password123',
);

// Sign out
await ref.read(authNotifierProvider.notifier).signOut();
```

## Route Guards

The `AuthGuard` redirects unauthenticated users to the login screen:

```dart
if (!isLoggedIn && !isOnAuthPage) {
  return AppRoutes.login;
}
```
