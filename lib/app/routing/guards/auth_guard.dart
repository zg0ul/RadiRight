import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../routes.dart';

String? authGuard(BuildContext context, GoRouterState state, WidgetRef ref) {
  final authState = ref.read(authNotifierProvider);

  return authState.when(
    data: (user) {
      if (user == null) {
        return AppRoutes.login;
      }
      return null;
    },
    loading: () => null,
    error: (_, __) => AppRoutes.login,
  );
}

String? noAuthGuard(BuildContext context, GoRouterState state, WidgetRef ref) {
  final authState = ref.read(authNotifierProvider);

  return authState.when(
    data: (user) {
      if (user != null) {
        return AppRoutes.home;
      }
      return null;
    },
    loading: () => null,
    error: (_, __) => null,
  );
}
