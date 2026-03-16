import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/models/imaging_recommendation.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_section_container.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class HistoryRecommendationsCard extends StatelessWidget {
  const HistoryRecommendationsCard({
    super.key,
    required this.l10n,
    required this.locale,
    required this.recommendations,
  });

  final AppLocalizations l10n;
  final String locale;
  final List<ImagingRecommendation> recommendations;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Separate primary and alternative recommendations
    final primaryRecs = recommendations.where((r) => r.priority == 1).toList();
    final alternativeRecs = recommendations.where((r) => r.priority > 1).toList();

    return ResultSectionContainer(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(AppConstants.spacingSM),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                  ),
                  child: HugeIcon(
                    icon: AppIcons.recommendation,
                    size: AppConstants.iconSM,
                    color: theme.colorScheme.primary,
                  ),
                ),
                AppSpacer.horizontalSM,
                Text(
                  l10n.recommendedImagingStudy,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            AppSpacer.verticalMD,
            if (recommendations.isEmpty)
              _buildEmptyState(context, theme)
            else ...[
              // Primary recommendations
              ...primaryRecs.map((rec) => _buildRecommendationItem(context, theme, rec)),

              // Alternative recommendations section
              if (alternativeRecs.isNotEmpty) ...[
                AppSpacer.verticalMD,
                Text(
                  l10n.alternativeImagingOptions,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                AppSpacer.verticalSM,
                ...alternativeRecs.map((rec) => _buildRecommendationItem(context, theme, rec)),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppConstants.radiusSM),
      ),
      child: Row(
        children: [
          HugeIcon(icon: AppIcons.info, size: AppConstants.iconSM, color: theme.colorScheme.onSurfaceVariant),
          AppSpacer.horizontalSM,
          Text(
            l10n.noRecommendations,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(BuildContext context, ThemeData theme, ImagingRecommendation rec) {
    final isPrimary = rec.priority == 1;
    final comments = rec.getLocalizedComments(locale);

    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.spacingSM),
      padding: EdgeInsets.all(AppConstants.spacingSM),
      decoration: BoxDecoration(
        color: isPrimary
            ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
            : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppConstants.radiusSM),
        border: isPrimary ? Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3), width: 1.5) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rec.getLocalizedProcedure(locale),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isPrimary ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                      ),
                    ),
                    AppSpacer.verticalXS,
                    Row(
                      children: [
                        HugeIcon(
                          icon: AppIcons.xray,
                          size: AppConstants.iconXS,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        AppSpacer.horizontalXS,
                        Text(
                          rec.getLocalizedModality(locale),
                          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingSM, vertical: AppConstants.spacingXS),
                decoration: BoxDecoration(
                  color: isPrimary
                      ? theme.colorScheme.primary.withValues(alpha: 0.15)
                      : theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                ),
                child: Text(
                  isPrimary
                      ? locale == 'ar'
                            ? 'الخيار الأول'
                            : '1st choice'
                      : locale == 'ar'
                      ? 'الخيار الثاني'
                      : '2nd choice',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isPrimary ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (comments != null && comments.isNotEmpty) ...[
            AppSpacer.verticalSM,
            Container(
              padding: EdgeInsets.all(AppConstants.spacingSM),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(AppConstants.radiusXS),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HugeIcon(icon: AppIcons.info, size: AppConstants.iconXS, color: theme.colorScheme.onSurfaceVariant),
                  AppSpacer.horizontalXS,
                  Expanded(
                    child: Text(
                      comments,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
