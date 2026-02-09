import 'package:flutter/material.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_section_container.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class ResultClinicalScenarioCard extends StatelessWidget {
  const ResultClinicalScenarioCard({super.key, required this.l10n, required this.scenarioText});

  final AppLocalizations l10n;
  final String scenarioText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ResultSectionContainer(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingSM, vertical: AppConstants.spacingXS),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                  ),
                  child: Text(
                    l10n.acr,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppSpacer.horizontalSM,
                Text(l10n.clinicalScenario, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            AppSpacer.verticalMD,
            Text(
              scenarioText,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
