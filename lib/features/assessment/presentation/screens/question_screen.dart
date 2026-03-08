import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/features/assessment/presentation/widgets/exit_dialog.dart';
import 'package:radi_right/l10n/app_localizations.dart';

import '../../../../app/routing/routes.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/constants/app_icons.dart';
import '../../domain/models/decision_node.dart';
import '../../domain/services/decision_engine.dart';
import '../providers/assessment_provider.dart';
import '../widgets/question_analyzing_state.dart';
import '../widgets/question_card.dart';
import '../widgets/question_error_state.dart';
import '../widgets/question_footer.dart';
import '../widgets/question_loading_state.dart';
import '../widgets/question_progress_section.dart';

class QuestionScreen extends HookConsumerWidget {
  final String topicId;

  const QuestionScreen({super.key, required this.topicId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final engineState = ref.watch(decisionEngineProvider);
    final assessmentState = ref.watch(currentAssessmentProvider);

    // Track if analyzing overlay has been shown
    final analyzingShown = useState(false);

    // Initialize assessment when screen loads
    useEffect(() {
      Future.microtask(() {
        if (!assessmentState.isActive && !assessmentState.isLoading) {
          ref.read(currentAssessmentProvider.notifier).startAssessment(topicId);
        }
      });
      return null;
    }, [topicId]);

    // Loading state while starting assessment
    if (assessmentState.isLoading) {
      return const QuestionLoadingState();
    }

    // Error state
    if (assessmentState.error != null) {
      return QuestionErrorState(l10n: l10n, error: assessmentState.error!);
    }

    // Assessment not active
    if (engineState == null || !assessmentState.isActive) {
      return const QuestionLoadingState();
    }

    // Assessment complete - show analyzing then navigate
    if (engineState.isComplete) {
      if (!analyzingShown.value) {
        analyzingShown.value = true;
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (context.mounted) {
            context.go(AppRoutes.result);
          }
        });
      }
      return QuestionAnalyzingState(l10n: l10n);
    }

    final currentNode = engineState.currentNode;
    if (currentNode is! QuestionNode) {
      return const QuestionLoadingState();
    }

    final currentQuestionKey = currentNode.id;

    final theme = Theme.of(context);

    return AppScaffold(
      showBackButton: false,
      leading: IconButton(
        icon: HugeIcon(icon: AppIcons.close, size: AppConstants.iconMD, color: theme.colorScheme.onSurface),
        onPressed: () => showExitDialog(context, ref, l10n),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Step indicator
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD),
              child: Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 1.0, // Step 4 of 4
                      backgroundColor: theme.colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                    ),
                  ),
                  AppSpacer.horizontalSM,
                  Text(
                    l10n.stepOf(4, 4),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            AppSpacer.verticalMD,
            QuestionProgressSection(engineState: engineState, l10n: l10n),
            AppSpacer.verticalLG,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: AppConstants.spacingLG),
                  child: QuestionCard(
                    key: ValueKey(currentQuestionKey),
                    node: currentNode,
                    locale: locale,
                    ref: ref,
                    l10n: l10n,
                  ),
                ),
              ),
            ),

            QuestionFooter(engineState: engineState, ref: ref, l10n: l10n),
          ],
        ),
      ),
    );
  }
}
