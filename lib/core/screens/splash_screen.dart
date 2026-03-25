import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/features/auth/presentation/providers/auth_provider.dart';
import 'package:radi_right/features/subscription/presentation/providers/subscription_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final subscriptionState = ref.watch(subscriptionNotifierProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
              isDarkMode ? 'assets/logos/radi_right_dark.svg' : 'assets/logos/radi_right_light.svg',
              width: 200.w,
              height: 200.w,
              fit: BoxFit.contain,
            ),
            AppSpacer.verticalLG,
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
