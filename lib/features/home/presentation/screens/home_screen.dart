import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/l10n/app_localizations.dart';

import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/animation_extensions.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/home/presentation/widgets/home_hero_section.dart';
import 'package:radi_right/features/home/presentation/widgets/home_description_card.dart';
import 'package:radi_right/features/home/presentation/widgets/home_start_button.dart';
import 'package:radi_right/features/home/presentation/widgets/home_guidelines_section.dart';
import 'package:radi_right/features/home/presentation/widgets/home_feature_cards.dart';
import 'package:radi_right/features/home/presentation/widgets/home_ai_section.dart';
import 'package:radi_right/features/subscription/presentation/widgets/trial_countdown_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return AppScaffold(
      showBackButton: false,
      actions: [
        const TrialCountdownWidget(),
        AppSpacer.horizontalSM,
        IconButton(
          icon: HugeIcon(
            icon: AppIcons.history,
            size: AppConstants.iconMD,
            color: theme.colorScheme.onSurface,
          ),
          onPressed: () => context.push(AppRoutes.history),
          tooltip: l10n.history,
        ),
        IconButton(
          icon: HugeIcon(
            icon: AppIcons.settings,
            size: AppConstants.iconMD,
            color: theme.colorScheme.onSurface,
          ),
          onPressed: () => context.push(AppRoutes.settings),
          tooltip: l10n.settings,
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppSpacer.verticalMD,
            const HomeHeroSection().fadeSlideIn(index: 0),
            AppSpacer.verticalXL,
            const HomeDescriptionCard().fadeSlideIn(index: 1),
            AppSpacer.verticalXL,
            const HomeStartButton().fadeSlideIn(index: 2),
            AppSpacer.verticalXXL,
            const HomeGuidelinesSection().fadeSlideIn(index: 3),
            AppSpacer.verticalXXL,
            const HomeFeatureCards().fadeSlideIn(index: 4),
            AppSpacer.verticalXXL,
            const HomeAiSection().fadeSlideIn(index: 5),
            AppSpacer.verticalXL,
            const HomeAiDisclaimer().fadeSlideIn(index: 6),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
