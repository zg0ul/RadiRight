import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import 'package:radi_right/shared/widgets/app_logo.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/features/auth/presentation/providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              AppSpacer.verticalXL,
              Text(l10n.login, style: Theme.of(context).textTheme.headlineSmall),
              AppSpacer.verticalMD,
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
              // AppSpacer.verticalSM,
              // Align(
              //   alignment: AlignmentDirectional.centerEnd,
              //   child: TextButton(
              //     onPressed: () {
              //       // TODO: Implement forgot password
              //     },
              //     child: Text(l10n.forgotPassword),
              //   ),
              // ),
              if (formState.error != null) ...[
                AppSpacer.verticalMD,
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
                        if (!formNotifier.validateLogin()) return;
                        formNotifier.setLoading(true);
                        try {
                          await ref
                              .read(authNotifierProvider.notifier)
                              .signIn(email: formState.email, password: formState.password);
                          if (context.mounted) {
                            context.go(AppRoutes.home);
                          }
                        } catch (e) {
                          formNotifier.setError(e.toString());
                        } finally {
                          formNotifier.setLoading(false);
                        }
                      },
                child: formState.isLoading
                    ? CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Theme.of(context).colorScheme.onPrimary,
                        strokeCap: StrokeCap.round,
                        constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      )
                    : Text(l10n.signIn),
              ),
              AppSpacer.verticalMD,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.dontHaveAccount),
                  TextButton(onPressed: () => context.go(AppRoutes.register), child: Text(l10n.signUp)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
