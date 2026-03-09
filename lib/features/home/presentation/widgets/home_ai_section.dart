import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';

class HomeAiSection extends StatelessWidget {
  const HomeAiSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.spacingLG),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedAiInnovation01,
                size: AppConstants.iconMD,
                color: theme.colorScheme.primary,
              ),
              AppSpacer.horizontalSM,
              Expanded(
                child: Text(
                  l10n.homeHowAiEnhances,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          AppSpacer.verticalXL,
          _AiFeatureItem(
            title: l10n.homeAiClinicalExplanations,
            description: l10n.homeAiClinicalExplanationsDesc,
            accentColor: theme.colorScheme.primary,
          ),
          AppSpacer.verticalMD,
          _AiFeatureItem(
            title: l10n.homeAiGapCoverage,
            description: l10n.homeAiGapCoverageDesc,
            accentColor: const Color(0xFFFF9800),
          ),
          AppSpacer.verticalMD,
          _AiFeatureItem(
            title: l10n.homeAiEducationalFeedback,
            description: l10n.homeAiEducationalFeedbackDesc,
            accentColor: const Color(0xFF4CAF50),
          ),
        ],
      ),
    );
  }
}

class _AiFeatureItem extends StatelessWidget {
  final String title;
  final String description;
  final Color accentColor;

  const _AiFeatureItem({
    required this.title,
    required this.description,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        border: Border(
          left: BorderSide(color: accentColor, width: 3.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          AppSpacer.verticalSM,
          Text(
            description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeAiDisclaimer extends StatelessWidget {
  const HomeAiDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HugeIcon(
          icon: AppIcons.info,
          size: AppConstants.iconSM,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        AppSpacer.horizontalSM,
        Expanded(
          child: Text(
            l10n.homeAiDisclaimer,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
