import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/app/theme/app_theme_extension.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/enums/radiation_level.dart';
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

  Color _getAppropriatenessColor(String appropriateness) {
    switch (appropriateness) {
      case 'usuallyAppropriate':
        return appTheme.usuallyAppropriate;
      case 'mayBeAppropriate':
        return appTheme.mayBeAppropriate;
      case 'usuallyNotAppropriate':
        return appTheme.usuallyNotAppropriate;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appropriatenessColor = _getAppropriatenessColor(recommendation.appropriateness.name);
    final appropriatenessText = locale == 'ar'
        ? recommendation.appropriateness.arabicDisplayName
        : recommendation.appropriateness.displayName;

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
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD, vertical: AppConstants.spacingSM),
                    decoration: BoxDecoration(
                      color: appropriatenessColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                      border: Border.all(color: appropriatenessColor.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HugeIcon(
                          icon: recommendation.appropriateness.name == 'usuallyAppropriate'
                              ? AppIcons.checkCircle
                              : recommendation.appropriateness.name == 'mayBeAppropriate'
                              ? AppIcons.info
                              : AppIcons.warning,
                          size: AppConstants.iconSM,
                          color: appropriatenessColor,
                        ),
                        AppSpacer.horizontalSM,
                        Flexible(
                          child: Text(
                            appropriatenessText,
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: appropriatenessColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (recommendation.score != null) ...[
                  AppSpacer.horizontalMD,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD, vertical: AppConstants.spacingSM),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                    ),
                    child: Text(
                      '${recommendation.score}/9',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: appropriatenessColor,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            if (recommendation.radiation != RadiationLevel.none) ...[
              AppSpacer.verticalMD,
              Row(
                children: [
                  HugeIcon(
                    icon: AppIcons.radiation,
                    size: AppConstants.iconSM,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  AppSpacer.horizontalSM,
                  Text(
                    l10n.radiationLevel(
                      locale == 'ar'
                          ? recommendation.radiation.arabicDisplayName
                          : recommendation.radiation.displayName,
                    ),
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
