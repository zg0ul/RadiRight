import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/routing/routes.dart';
import '../../../subscription/presentation/providers/subscription_provider.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final formState = ref.watch(authFormStateProvider);
    final formNotifier = ref.read(authFormStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.go(AppRoutes.login)),
        title: Text(l10n.register),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              TextField(
                onChanged: formNotifier.setName,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(labelText: l10n.name, prefixIcon: const Icon(Icons.person_outline)),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: formNotifier.setEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: l10n.email, prefixIcon: const Icon(Icons.email_outlined)),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: formNotifier.setPassword,
                obscureText: true,
                decoration: InputDecoration(labelText: l10n.password, prefixIcon: const Icon(Icons.lock_outline)),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: formNotifier.setConfirmPassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: l10n.confirmPassword,
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
              ),
              if (formState.error != null) ...[
                const SizedBox(height: 16),
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
              const SizedBox(height: 24),
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
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : Text(l10n.signUp),
              ),
              const SizedBox(height: 24),
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
