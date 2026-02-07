import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/features/assessment/domain/services/decision_engine.dart';
import 'package:radi_right/l10n/app_localizations.dart';

/// Progress section showing question number and progress bar
class QuestionProgressSection extends StatelessWidget {
  final DecisionEngineState engineState;
  final AppLocalizations l10n;

  const QuestionProgressSection({super.key, required this.engineState, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final questionNumber = engineState.questionNumber;
    const estimatedTotal = 10;
    final progress = (questionNumber / estimatedTotal).clamp(0.0, 0.95);
    final percentage = (progress * 100).toInt();

    return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${l10n.question} $questionNumber',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$percentage%',
                  style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
            SizedBox(height: AppConstants.spacingSM),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.radiusFull),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8.h,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
              ),
            ),
            SizedBox(height: AppConstants.spacingMD),
          ],
        )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 300))
        .slideY(begin: -0.05, end: 0, curve: Curves.easeOutCubic);
  }
}
