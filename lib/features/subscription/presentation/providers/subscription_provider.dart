import 'dart:developer' as developer;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/repositories/subscription_repository.dart';
import '../../domain/models/subscription.dart';

part 'subscription_provider.g.dart';

@riverpod
class SubscriptionNotifier extends _$SubscriptionNotifier {
  @override
  Stream<Subscription?> build() {
    final authState = ref.watch(authNotifierProvider);
    final userId = authState.valueOrNull?.id;

    if (userId == null) {
      return Stream.value(null);
    }

    final repository = ref.watch(subscriptionRepositoryProvider);
    return repository.subscriptionStream(userId);
  }

  Future<void> createTrialSubscription([String? userId]) async {
    developer.log('createTrialSubscription called with userId: $userId', name: 'SubscriptionNotifier');

    String? uid = userId;

    if (uid == null) {
      final authState = ref.read(authNotifierProvider);
      uid = authState.valueOrNull?.id;
      developer.log('Retrieved userId from auth state: $uid', name: 'SubscriptionNotifier');
    }

    if (uid == null) {
      developer.log('ERROR: User not authenticated', name: 'SubscriptionNotifier');
      throw Exception('User not authenticated');
    }

    developer.log('Creating trial subscription in repository for userId: $uid', name: 'SubscriptionNotifier');
    final repository = ref.read(subscriptionRepositoryProvider);
    final result = await repository.createTrialSubscription(uid);

    result.fold(
      (error) {
        developer.log('ERROR creating subscription: ${error.displayMessage}', name: 'SubscriptionNotifier');
        throw Exception(error.displayMessage);
      },
      (subscription) {
        developer.log('Subscription created successfully: ${subscription.id}', name: 'SubscriptionNotifier');
        // Invalidate to refresh the stream
        // Wrap in try-catch to handle cases where provider might be disposed
        try {
          ref.invalidateSelf();
        } catch (e) {
          developer.log('Warning: Could not invalidate self (provider disposed): $e', name: 'SubscriptionNotifier');
          // Provider might be disposed, but that's okay - the stream will update automatically
          // when Firestore emits the new document
        }
      },
    );
  }

  Future<void> refreshSubscription() async {
    ref.invalidateSelf();
  }
}

@riverpod
bool hasActiveSubscription(Ref ref) {
  final subscription = ref.watch(subscriptionNotifierProvider).valueOrNull;
  return subscription?.isActive ?? false;
}

@riverpod
int subscriptionDaysRemaining(Ref ref) {
  final subscription = ref.watch(subscriptionNotifierProvider).valueOrNull;
  return subscription?.daysRemaining ?? 0;
}

@riverpod
bool isTrialActive(Ref ref) {
  final subscription = ref.watch(subscriptionNotifierProvider).valueOrNull;
  return subscription?.isTrialActive ?? false;
}
