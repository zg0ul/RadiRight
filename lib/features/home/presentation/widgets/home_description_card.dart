import 'package:flutter/material.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/features/home/presentation/widgets/home_constants.dart';

class HomeDescriptionCard extends StatelessWidget {
  const HomeDescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

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
      child: Text(
        l10n.homeDescriptionCard(HomeConstants.guidelinesCount),
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
          height: 1.6,
        ),
      ),
    );
  }
}
