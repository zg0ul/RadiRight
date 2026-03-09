import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/utils/app_spacer.dart';

class HomeFeatureCards extends StatelessWidget {
  const HomeFeatureCards({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        _FeatureCard(
          icon: HugeIcons.strokeRoundedBook02,
          iconColor: const Color(0xFF2E7D32),
          iconBgColor: const Color(0xFFE8F5E9),
          title: l10n.homeEvidenceBasedRecommendations,
          description: l10n.homeEvidenceBasedRecommendationsDesc,
        ),
        AppSpacer.verticalMD,
        _FeatureCard(
          icon: HugeIcons.strokeRoundedAiBrain01,
          iconColor: const Color(0xFF1565C0),
          iconBgColor: const Color(0xFFE3F2FD),
          title: l10n.homeAiClinicalReasoning,
          description: l10n.homeAiClinicalReasoningDesc,
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final List<List<dynamic>> icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.spacingLG),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppConstants.radiusLG),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: isDark
                      ? iconColor.withValues(alpha: 0.2)
                      : iconBgColor,
                  borderRadius: BorderRadius.circular(AppConstants.radiusMD),
                ),
                child: Center(
                  child: HugeIcon(
                    icon: icon,
                    size: AppConstants.iconMD,
                    color: iconColor,
                  ),
                ),
              ),
              AppSpacer.horizontalMD,
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          AppSpacer.verticalMD,
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
