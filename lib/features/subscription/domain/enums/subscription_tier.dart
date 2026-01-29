enum SubscriptionTier {
  none,
  trial,
  monthly,
  yearly;

  String get displayName => switch (this) {
        SubscriptionTier.none => 'None',
        SubscriptionTier.trial => 'Trial',
        SubscriptionTier.monthly => 'Monthly',
        SubscriptionTier.yearly => 'Yearly',
      };

  bool get isPaid => this == monthly || this == yearly;
}
