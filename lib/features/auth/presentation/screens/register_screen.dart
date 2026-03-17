import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/features/subscription/presentation/providers/subscription_provider.dart';
import 'package:radi_right/features/auth/presentation/providers/auth_provider.dart';
import 'package:radi_right/shared/widgets/app_logo.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final formState = ref.watch(authFormStateProvider);
    final formNotifier = ref.read(authFormStateProvider.notifier);

    return AppScaffold(
      showBackButton: false,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: Column(
            children: [
              const AppLogo(),
              AppSpacer.verticalMD,
              Text(
                l10n.appName,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacer.verticalMD,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.register,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
              ),
              AppSpacer.verticalMD,
              TextField(
                onChanged: formNotifier.setName,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: l10n.name,
                  prefixIcon: const UnconstrainedBox(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    child: HugeIcon(icon: AppIcons.person),
                  ),
                ),
              ),
              AppSpacer.verticalSM,
              TextField(
                onChanged: formNotifier.setEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: l10n.email,
                  prefixIcon: const UnconstrainedBox(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    child: HugeIcon(icon: AppIcons.email),
                  ),
                ),
              ),
              AppSpacer.verticalSM,
              TextField(
                onChanged: formNotifier.setPassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.password,
                  prefixIcon: const UnconstrainedBox(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    child: HugeIcon(icon: AppIcons.locked),
                  ),
                ),
              ),
              AppSpacer.verticalSM,
              TextField(
                onChanged: formNotifier.setConfirmPassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.confirmPassword,
                  prefixIcon: const UnconstrainedBox(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    child: HugeIcon(icon: AppIcons.locked),
                  ),
                ),
              ),
              if (formState.error != null) ...[
                AppSpacer.verticalSM,
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    formState.error!,
                    style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                ),
              ],
              AppSpacer.verticalMD,
              ElevatedButton(
                onPressed: formState.isLoading
                    ? null
                    : () async {
                        if (!formNotifier.validateRegister()) return;
                        if (!context.mounted) return;

                        formNotifier.setLoading(true);

                        // Capture notifiers before async operations to avoid ref disposal issues
                        final authNotifier = ref.read(authNotifierProvider.notifier);
                        final subscriptionNotifier = ref.read(subscriptionNotifierProvider.notifier);

                        try {
                          debugPrint('[RegisterScreen] Starting registration...');
                          // Register returns the new user's ID
                          final userId = await authNotifier.register(
                            email: formState.email,
                            password: formState.password,
                            name: formState.name,
                          );
                          debugPrint('[RegisterScreen] Registration successful, userId: $userId');

                          // Create trial subscription even if context is not mounted
                          // (we captured the notifier before async operations, so it's safe to use)
                          debugPrint('[RegisterScreen] Creating trial subscription for userId: $userId');
                          try {
                            await subscriptionNotifier.createTrialSubscription(userId);
                            debugPrint('[RegisterScreen] Trial subscription created successfully');
                          } catch (e) {
                            debugPrint('[RegisterScreen] Error creating subscription: $e');
                            // Re-throw so it's caught by outer catch block
                            rethrow;
                          }

                          // Give Firestore a moment to sync and the stream to update
                          // The router will handle checking subscription status and redirecting
                          await Future.delayed(const Duration(milliseconds: 500));

                          // Only navigate if context is still mounted
                          // Otherwise, let the router handle the redirect
                          if (context.mounted) {
                            // Navigate to home - router will verify subscription is active
                            context.go(AppRoutes.home);
                          }
                        } catch (e, stackTrace) {
                          debugPrint('Registration error: $e');
                          debugPrint('Stack trace: $stackTrace');
                          if (context.mounted) {
                            formNotifier.setError(e.toString());
                          }
                        } finally {
                          if (context.mounted) {
                            formNotifier.setLoading(false);
                          }
                        }
                      },
                child: formState.isLoading
                    ? CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Theme.of(context).colorScheme.onPrimary,
                        strokeCap: StrokeCap.round,
                        constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      )
                    : Text(l10n.signUp),
              ),
              AppSpacer.verticalMD,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.alreadyHaveAccount),
                  TextButton(onPressed: () => context.go(AppRoutes.login), child: Text(l10n.signIn)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
