import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/routing/routes.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/subscription/presentation/providers/subscription_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final subscriptionState = ref.watch(subscriptionNotifierProvider);

    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        if (!context.mounted) return;

        authState.when(
          data: (user) {
            if (user == null) {
              context.go(AppRoutes.login);
            } else {
              subscriptionState.when(
                data: (subscription) {
                  if (subscription == null || !subscription.isActive) {
                    context.go(AppRoutes.trialExpired);
                  } else {
                    context.go(AppRoutes.home);
                  }
                },
                loading: () {},
                error: (_, __) => context.go(AppRoutes.trialExpired),
              );
            }
          },
          loading: () {},
          error: (_, __) => context.go(AppRoutes.login),
        );
      });
      return null;
    }, [authState, subscriptionState]);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medical_services_outlined,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'RadiRight',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'ACR Appropriateness Criteria',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
