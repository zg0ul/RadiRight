import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/l10n/app_localizations.dart';

/// Card widget that displays AI explanation placeholder for future integration.
/// This will eventually show AI-generated explanations for why certain
/// imaging modalities are recommended for specific clinical scenarios.
class ResultAiExplanationCard extends StatelessWidget {
  const ResultAiExplanationCard({
    super.key,
    this.explanation,
  });

  /// AI-generated explanation text. If null, shows placeholder.
  final String? explanation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                ),
                child: Center(
                  child: HugeIcon(
                    icon: AppIcons.recommendation,
                    size: AppConstants.iconSM,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              AppSpacer.horizontalSM,
              Text(
                l10n.aiExplanation,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AppSpacer.verticalMD,
          // Explanation content or placeholder
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppConstants.spacingMD),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppConstants.radiusSM),
            ),
            child: Text(
              explanation ?? l10n.aiExplanationPlaceholder,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: explanation != null
                    ? theme.colorScheme.onSurface
                    : theme.colorScheme.onSurfaceVariant,
                fontStyle:
                    explanation == null ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
