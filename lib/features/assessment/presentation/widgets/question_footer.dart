import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/features/assessment/domain/services/decision_engine.dart';
import 'package:radi_right/features/assessment/presentation/providers/assessment_provider.dart';
import 'package:radi_right/l10n/app_localizations.dart';

/// Footer with Back and Home buttons for the question screen
class QuestionFooter extends StatelessWidget {
  final DecisionEngineState engineState;
  final WidgetRef ref;
  final AppLocalizations l10n;

  const QuestionFooter({super.key, required this.engineState, required this.ref, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.2))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (engineState.canGoBack)
            OutlinedButton.icon(
              onPressed: () => ref.read(decisionEngineProvider.notifier).goBack(),
              icon: HugeIcon(icon: AppIcons.back, size: AppConstants.iconSM, color: theme.colorScheme.primary),
              label: Text(l10n.back),
              style: OutlinedButton.styleFrom(minimumSize: Size(120.w, AppConstants.buttonHeightMD)),
            )
          else
            SizedBox(width: 120.w),
          OutlinedButton.icon(
            onPressed: () {
              ref.read(currentAssessmentProvider.notifier).reset();
              context.go(AppRoutes.home);
            },
            icon: HugeIcon(icon: AppIcons.home, size: AppConstants.iconSM, color: theme.colorScheme.primary),
            label: Text(l10n.home),
            style: OutlinedButton.styleFrom(minimumSize: Size(120.w, AppConstants.buttonHeightMD)),
          ),
        ],
      ),
    );
  }
}
