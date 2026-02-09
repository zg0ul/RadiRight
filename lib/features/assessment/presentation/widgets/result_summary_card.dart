import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_section_container.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class ResultSummaryCard extends StatelessWidget {
  const ResultSummaryCard({super.key, required this.l10n, required this.summary});

  final AppLocalizations l10n;
  final String summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ResultSectionContainer(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        initiallyExpanded: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMD)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMD)),
        title: Row(
          children: [
            HugeIcon(icon: AppIcons.info, size: AppConstants.iconMD, color: theme.colorScheme.primary),
            AppSpacer.horizontalSM,
            Expanded(
              child: Text(
                l10n.whyThisRecommendation,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(AppConstants.spacingMD, 0, AppConstants.spacingMD, AppConstants.spacingMD),
            child: Text(
              summary,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
