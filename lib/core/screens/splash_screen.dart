import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/l10n/app_localizations.dart';
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

    return AppScaffold(
      showBackButton: false,
      showContentPadding: false,
      showAppBar: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/radi_right_logo.svg',
              width: 200.w,
              height: 200.w,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            ),
            AppSpacer.verticalSM,
            Text(
              AppLocalizations.of(context)!.acrAppropriatenessCriteria,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7)),
            ),
            AppSpacer.verticalLG,
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
