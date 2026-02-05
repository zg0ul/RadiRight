import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/l10n/app_localizations.dart';

import '../../../../app/routing/routes.dart';
import '../../../../app/theme/app_theme_extension.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/utils/animation_extensions.dart';
import '../../../../core/utils/app_spacer.dart';
import '../../../../shared/widgets/glassmorphism_card.dart';
import '../../../subscription/presentation/widgets/trial_countdown_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final appTheme = context.appTheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: appTheme.backgroundGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context, l10n),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingLG),
                  child: Column(
                    children: [
                      AppSpacer.verticalXL,
                      _buildLogo(context).fadeSlideIn(index: 0),
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
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingMD,
        vertical: AppConstants.spacingSM,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 100.w,
      height: 100.w,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: HugeIcon(
          icon: AppIcons.medical,
          size: 50.w,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Text(
      l10n.appName,
      style: theme.textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildTagline(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Text(
      'Evidence-Based Imaging Guidance',
      style: theme.textTheme.bodyLarge?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescriptionCard(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return GlassmorphismCard(
      padding: EdgeInsets.all(AppConstants.spacingLG),
      child: Column(
        children: [
          HugeIcon(
            icon: AppIcons.info,
            size: AppConstants.iconLG,
            color: theme.colorScheme.primary,
          ),
          AppSpacer.verticalMD,
          Text(
            'Navigate clinical imaging decisions with confidence using ACR Appropriateness Criteria guidelines.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              height: 1.5,
            ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(
              icon: AppIcons.medical,
              size: AppConstants.iconMD,
              color: theme.colorScheme.onPrimary,
            ),
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
        _buildFeatureItem(
          context,
          icon: AppIcons.evidenceBased,
          label: 'Evidence\nBased',
        ),
        _buildFeatureItem(
          context,
          icon: AppIcons.criteria,
          label: 'ACR\nCriteria',
        ),
        _buildFeatureItem(
          context,
          icon: AppIcons.quickResults,
          label: 'Quick\nResults',
        ),
      ],
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required List<List<dynamic>> icon,
    required String label,
  }) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: HugeIcon(
              icon: icon,
              size: AppConstants.iconMD,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        AppSpacer.verticalSM,
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingMD,
        vertical: AppConstants.spacingSM,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppConstants.radiusSM),
      ),
      child: Text(
        'Based on ACR Appropriateness Criteria\u00ae',
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
