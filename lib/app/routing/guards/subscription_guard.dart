import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../features/subscription/presentation/providers/subscription_provider.dart';
import '../routes.dart';

String? subscriptionGuard(
  BuildContext context,
  GoRouterState state,
  WidgetRef ref,
) {
  final subscriptionState = ref.read(subscriptionNotifierProvider);

  return subscriptionState.when(
    data: (subscription) {
      if (subscription == null || !subscription.isActive) {
        return AppRoutes.trialExpired;
      }
      return null;
    },
    loading: () => null,
    error: (_, __) => AppRoutes.trialExpired,
  );
}
