import 'package:flutter/material.dart';
import 'package:radi_right/app/theme/app_theme_extension.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/models/imaging_recommendation.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_section_container.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class ResultAlternativesCard extends StatelessWidget {
  const ResultAlternativesCard({
    super.key,
    required this.l10n,
    required this.locale,
    required this.alternatives,
    required this.appTheme,
  });

  final AppLocalizations l10n;
  final String locale;
  final List<ImagingRecommendation> alternatives;
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
              l10n.alternativeImagingOptions,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            AppSpacer.verticalMD,
            ...alternatives.map((rec) {
              return Padding(
                padding: EdgeInsets.only(bottom: AppConstants.spacingSM),
                child: Container(
                  padding: EdgeInsets.all(AppConstants.spacingSM),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rec.getLocalizedProcedure(locale),
                              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            AppSpacer.verticalXS,
                            Text(
                              rec.getLocalizedModality(locale),
                              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.spacingSM,
                          vertical: AppConstants.spacingXS,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                        ),
                        child: Text(
                          rec.priority == 2 ? '2nd choice' : '1st choice',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
