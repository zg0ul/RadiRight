import 'package:flutter/material.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/enums/imaging_modality.dart';
import 'package:radi_right/features/assessment/domain/enums/modality_match_result.dart';
import 'package:radi_right/l10n/app_localizations.dart';

/// Card widget that displays the doctor's initial imaging selection
/// with a color-coded badge indicating whether it was appropriate.
class ResultYourSelectionCard extends StatelessWidget {
  const ResultYourSelectionCard({
    super.key,
    required this.selectedModality,
    required this.matchResult,
    required this.locale,
  });

  final ImagingModality selectedModality;
  final ModalityMatchResult matchResult;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final modalityName = selectedModality.getLocalizedName(locale);
    final isPositive = matchResult.isPositive;
    final borderColor = matchResult.color;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        border: Border.all(
          color: borderColor.withValues(alpha: 0.5),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.yourSelection,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          AppSpacer.verticalXS,
          Row(
            children: [
              // Modality icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: borderColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                ),
                child: Center(
                  child: Text(
                    selectedModality.icon,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              AppSpacer.horizontalMD,
              // Modality name
              Expanded(
                child: Text(
                  modalityName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Indication badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.spacingSM,
                  vertical: AppConstants.spacingXS,
                ),
                decoration: BoxDecoration(
                  color: borderColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                  border: Border.all(
                    color: borderColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isPositive ? Icons.check_circle : Icons.cancel,
                      size: 16,
                      color: borderColor,
                    ),
                    AppSpacer.horizontalXS,
                    Text(
                      isPositive ? l10n.indicated : l10n.notIndicated,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: borderColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
