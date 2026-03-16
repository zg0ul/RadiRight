import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/models/assessment_result.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_section_container.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class HistoryAnswersCard extends StatelessWidget {
  const HistoryAnswersCard({
    super.key,
    required this.l10n,
    required this.answers,
  });

  final AppLocalizations l10n;
  final List<AnswerRecord> answers;

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
                  padding: EdgeInsets.all(AppConstants.spacingSM),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                  ),
                  child: HugeIcon(
                    icon: AppIcons.question,
                    size: AppConstants.iconSM,
                    color: theme.colorScheme.primary,
                  ),
                ),
                AppSpacer.horizontalSM,
                Text(
                  l10n.yourAnswers,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            AppSpacer.verticalMD,
            if (answers.isEmpty)
              _buildEmptyState(context, theme)
            else
              ...answers.asMap().entries.map((entry) {
                final index = entry.key;
                final answer = entry.value;
                return _buildAnswerItem(context, theme, answer, index);
              }),
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
          HugeIcon(
            icon: AppIcons.info,
            size: AppConstants.iconSM,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          AppSpacer.horizontalSM,
          Text(
            l10n.noHistory,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerItem(
    BuildContext context,
    ThemeData theme,
    AnswerRecord answer,
    int index,
  ) {
    return Container(
      margin: EdgeInsets.only(
        bottom: index < answers.length - 1 ? AppConstants.spacingSM : 0,
      ),
      padding: EdgeInsets.all(AppConstants.spacingSM),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppConstants.radiusSM),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              AppSpacer.horizontalSM,
              Expanded(
                child: Text(
                  answer.questionText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          AppSpacer.verticalSM,
          Container(
            margin: const EdgeInsets.only(left: 32),
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.spacingSM,
              vertical: AppConstants.spacingXS,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(AppConstants.radiusSM),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                HugeIcon(
                  icon: AppIcons.checkCircle,
                  size: AppConstants.iconXS,
                  color: theme.colorScheme.primary,
                ),
                AppSpacer.horizontalXS,
                Flexible(
                  child: Text(
                    answer.selectedOptionText,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
