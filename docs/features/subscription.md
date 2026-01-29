# Subscription Feature

## Overview

The subscription feature manages user subscription status, including trials and paid subscriptions. V1 uses manual contact for subscription activation.

## Data Models

### SubscriptionTier
```dart
enum SubscriptionTier {
  none,
  trial,
  monthly,
  yearly;
}
```

### Subscription
```dart
@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    required String id,
    required String userId,
    required SubscriptionTier tier,
    required DateTime startDate,
    required DateTime endDate,
    @Default(false) bool isTrialUsed,
    DateTime? trialEndDate,
  }) = _Subscription;

  // Computed properties
  bool get isActive;
  bool get isTrialActive;
  int get daysRemaining;
}
```

## Architecture

### Datasource

```dart
class FirebaseSubscriptionDatasource {
  Future<Subscription?> getSubscription(String userId);
  Stream<Subscription?> subscriptionStream(String userId);
  Future<Subscription> createTrialSubscription(String userId);
  Future<void> updateSubscription(Subscription subscription);
}
```

### Repository

```dart
abstract class SubscriptionRepository {
  Future<Either<AppError, Subscription?>> getSubscription(String userId);
  Stream<Subscription?> subscriptionStream(String userId);
  Future<Either<AppError, Subscription>> createTrialSubscription(String userId);
}
```

### Providers

```dart
@riverpod
class SubscriptionNotifier extends _$SubscriptionNotifier {
  @override
  Stream<Subscription?> build() {
    final userId = ref.watch(authNotifierProvider).valueOrNull?.id;
    return repository.subscriptionStream(userId);
  }

  Future<void> createTrialSubscription();
}

// Convenience providers
@riverpod
bool hasActiveSubscription(Ref ref);

@riverpod
int subscriptionDaysRemaining(Ref ref);

@riverpod
bool isTrialActive(Ref ref);
```

## Screens

### TrialExpiredScreen
- Shows when subscription/trial has expired
- Link to contact info
- Logout option

### ContactInfoScreen
- Contact email and phone
- Copy to clipboard
- Subscription pricing info

## Widgets

### TrialCountdownWidget
Displays remaining trial days with color-coded urgency:
- Green: 5+ days
- Yellow: 3-4 days
- Red: 1-2 days

## Firebase Structure

```
subscriptions/
  {userId}/
    - tier: string
    - startDate: timestamp
    - endDate: timestamp
    - isTrialUsed: boolean
    - trialEndDate: timestamp
```

## Configuration

```dart
// app_config.dart
static const int trialDays = 7;
static const double monthlyPrice = 99.0;
static const double yearlyPrice = 999.0;
static const String contactEmail = 'ali.amaierh5@gmail.com';
static const String contactPhone = '0789113306';
```

## Route Guards

The subscription guard restricts access when expired:

```dart
if (subscription == null || !subscription.isActive) {
  return AppRoutes.trialExpired;
}
```

## Usage

```dart
// Check subscription
final hasAccess = ref.watch(hasActiveSubscriptionProvider);

// Get days remaining
final days = ref.watch(subscriptionDaysRemainingProvider);

// Create trial on registration
await ref.read(subscriptionNotifierProvider.notifier)
    .createTrialSubscription();
```
