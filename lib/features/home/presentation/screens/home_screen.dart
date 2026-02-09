import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import 'package:radi_right/shared/widgets/app_logo.dart';

import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/animation_extensions.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/shared/widgets/glassmorphism_card.dart';
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
          icon: HugeIcon(icon: AppIcons.history, size: AppConstants.iconMD, color: theme.colorScheme.onSurface),
          onPressed: () => context.push(AppRoutes.history),
          tooltip: l10n.history,
        ),
        IconButton(
          icon: HugeIcon(icon: AppIcons.settings, size: AppConstants.iconMD, color: theme.colorScheme.onSurface),
          onPressed: () => context.push(AppRoutes.settings),
          tooltip: l10n.settings,
        ),
      ],
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AppLogo().fadeSlideIn(index: 0),
                    AppSpacer.verticalMD,
                    _buildTitle(context, l10n).fadeSlideIn(index: 1),
                    AppSpacer.verticalSM,
                    _buildTagline(context, l10n).fadeSlideIn(index: 2),
                    AppSpacer.verticalXL,
                    _buildDescriptionCard(context, l10n).fadeSlideIn(index: 3),
                    AppSpacer.verticalXL,
                    _buildStartButton(context, l10n).fadeSlideIn(index: 4),
                    AppSpacer.verticalXL,
                    _buildFeatureIcons(context, l10n).fadeSlideIn(index: 5),
                    AppSpacer.verticalXL,
                    _buildFooter(context, l10n).fadeSlideIn(index: 6),
                    AppSpacer.verticalLG,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Text(
      l10n.appName,
      style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
    );
  }

  Widget _buildTagline(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Text(
      l10n.homeTagline,
      style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescriptionCard(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return GlassmorphismCard(
      padding: EdgeInsets.all(AppConstants.spacingLG),
      child: Column(
        children: [
          HugeIcon(icon: AppIcons.info, size: AppConstants.iconLG, color: theme.colorScheme.primary),
          AppSpacer.verticalMD,
          Text(
            l10n.homeDescriptionCard,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.push(AppRoutes.panelSelection),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: AppConstants.spacingMD),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMD)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(icon: AppIcons.medical, size: AppConstants.iconMD, color: theme.colorScheme.onPrimary),
            AppSpacer.horizontalSM,
            Text(
              l10n.startAssessment,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ).pulseOnIdle(),
    );
  }

  Widget _buildFeatureIcons(BuildContext context, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFeatureItem(context, icon: AppIcons.evidenceBased, label: l10n.homeFeatureEvidenceBased),
        _buildFeatureItem(context, icon: AppIcons.criteria, label: l10n.homeFeatureAcrCriteria),
        _buildFeatureItem(context, icon: AppIcons.quickResults, label: l10n.homeFeatureQuickResults),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, {required List<List<dynamic>> icon, required String label}) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, shape: BoxShape.circle),
          child: Center(
            child: HugeIcon(icon: icon, size: AppConstants.iconMD, color: theme.colorScheme.primary),
          ),
        ),
        AppSpacer.verticalSM,
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD, vertical: AppConstants.spacingSM),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppConstants.radiusSM),
      ),
      child: Text(
        l10n.homeFooterAcrBased,
        style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        textAlign: TextAlign.center,
      ),
    );
  }
}
