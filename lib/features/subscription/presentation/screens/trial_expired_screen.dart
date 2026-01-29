import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/routing/routes.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class TrialExpiredScreen extends ConsumerWidget {
  const TrialExpiredScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.timer_off_outlined,
                size: 100,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 32),
              Text(
                l10n.trialExpired,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.subscriptionExpired,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.7),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              ElevatedButton.icon(
                onPressed: () => context.go(AppRoutes.contactInfo),
                icon: const Icon(Icons.phone_outlined),
                label: Text(l10n.contactForSubscription),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () async {
                  await ref.read(authNotifierProvider.notifier).signOut();
                  if (context.mounted) {
                    context.go(AppRoutes.login);
                  }
                },
                icon: const Icon(Icons.logout),
                label: Text(l10n.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
