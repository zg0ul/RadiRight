import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/subscription_tier.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

@freezed
class Subscription with _$Subscription {
  const Subscription._();

  const factory Subscription({
    required String id,
    required String userId,
    required SubscriptionTier tier,
    required DateTime startDate,
    required DateTime endDate,
    @Default(false) bool isTrialUsed,
    DateTime? trialEndDate,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  bool get isActive {
    if (tier == SubscriptionTier.none) return false;
    return DateTime.now().isBefore(endDate);
  }

  bool get isTrialActive {
    if (tier != SubscriptionTier.trial) return false;
    if (trialEndDate == null) return false;
    return DateTime.now().isBefore(trialEndDate!);
  }

  int get daysRemaining {
    if (!isActive) return 0;
    return endDate.difference(DateTime.now()).inDays;
  }

  bool get isExpired => !isActive;

  factory Subscription.createTrial({
    required String userId,
    int trialDays = 7,
  }) {
    final now = DateTime.now();
    final trialEnd = now.add(Duration(days: trialDays));
    return Subscription(
      id: '',
      userId: userId,
      tier: SubscriptionTier.trial,
      startDate: now,
      endDate: trialEnd,
      isTrialUsed: true,
      trialEndDate: trialEnd,
    );
  }
}
