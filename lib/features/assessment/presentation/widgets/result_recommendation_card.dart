import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/app/theme/app_theme_extension.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/models/imaging_recommendation.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_section_container.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class ResultRecommendationCard extends StatelessWidget {
  const ResultRecommendationCard({
    super.key,
    required this.l10n,
    required this.locale,
    required this.recommendation,
    required this.appTheme,
  });

  final AppLocalizations l10n;
  final String locale;
  final ImagingRecommendation recommendation;
  final AppThemeExtension appTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ResultSectionContainer(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.recommendedImagingStudy,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            AppSpacer.verticalMD,
            Text(
              recommendation.getLocalizedProcedure(locale),
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacer.verticalMD,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.spacingMD,
                    vertical: AppConstants.spacingSM,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HugeIcon(
                        icon: AppIcons.checkCircle,
                        size: AppConstants.iconSM,
                        color: theme.colorScheme.primary,
                      ),
                      AppSpacer.horizontalSM,
                      Text(
                        recommendation.priority == 2
                            ? '2nd choice'
                            : '1st choice',
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
