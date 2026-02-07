import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/animation_extensions.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/models/decision_node.dart';
import 'package:radi_right/features/assessment/domain/services/decision_engine.dart';
import 'package:radi_right/features/assessment/presentation/widgets/answer_button.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Animated question card with question text, hint, and answer options
class QuestionCard extends StatelessWidget {
  final QuestionNode node;
  final String locale;
  final WidgetRef ref;
  final AppLocalizations l10n;

  const QuestionCard({super.key, required this.node, required this.locale, required this.ref, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppConstants.radiusLG),
        border: Border.all(color: theme.colorScheme.outlineVariant, width: 1.5),
        boxShadow: [
          BoxShadow(color: theme.colorScheme.shadow.withValues(alpha: 0.25), blurRadius: 20, offset: Offset(0, 0)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HugeIcon(icon: AppIcons.question, size: AppConstants.iconXL, color: theme.colorScheme.primary),
            AppSpacer.verticalMD,
            Text(
              node.getLocalizedQuestionText(locale),
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, height: 1.4),
              textAlign: TextAlign.center,
            ),
            if (node.getLocalizedHint(locale) != null) ...[
              AppSpacer.verticalMD,
              Container(
                padding: EdgeInsets.all(AppConstants.spacingMD),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(AppConstants.radiusMD),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HugeIcon(icon: AppIcons.info, size: AppConstants.iconSM, color: theme.colorScheme.primary),
                    AppSpacer.horizontalSM,
                    Expanded(
                      child: Text(
                        node.getLocalizedHint(locale)!,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            AppSpacer.verticalLG,
            ...node.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              return Padding(
                padding: EdgeInsets.only(bottom: AppConstants.spacingSM),
                child: AnswerButton(
                  text: option.getLocalizedText(locale),
                  onTap: () => ref.read(decisionEngineProvider.notifier).selectAnswer(option, locale),
                  animationIndex: index,
                ),
              );
            }),
          ],
        ),
      ),
    ).scaleIn(duration: const Duration(milliseconds: 400), begin: 0.95);
  }
}
