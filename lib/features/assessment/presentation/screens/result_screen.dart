import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/l10n/app_localizations.dart';

import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/providers/locale_provider.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/enums/modality_match_result.dart';
import 'package:radi_right/features/assessment/domain/models/assessment_result.dart';
import 'package:radi_right/features/assessment/domain/models/decision_node.dart';
import 'package:radi_right/features/assessment/domain/services/decision_engine.dart';
import 'package:radi_right/features/assessment/presentation/providers/assessment_provider.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_ai_explanation_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_alternatives_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_animated_section.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_clinical_scenario_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_disclaimer_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_match_header.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_recommendation_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_summary_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_your_selection_card.dart';
import 'package:radi_right/app/theme/app_theme_extension.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final appTheme = context.appTheme;
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final engineState = ref.watch(decisionEngineProvider);

    if (engineState == null || !engineState.isComplete) {
      return _buildErrorState(context, l10n, ref);
    }

    // Get the comparison result
    final comparisonResult = engineState.comparisonResult;

    // Handle no guidelines case - redirect to dedicated screen
    if (comparisonResult != null &&
        comparisonResult.matchResult == ModalityMatchResult.noGuidelines) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.go(AppRoutes.noGuidelines);
        }
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final resultNode = engineState.currentNode is ResultNode
        ? engineState.currentNode as ResultNode
        : null;
    final summary = resultNode != null
        ? (locale == 'ar' ? resultNode.summaryAr : resultNode.summary)
        : null;

    final scenarioText = _buildClinicalScenario(engineState.answerHistory);

    // Determine match result for header color
    final matchResult =
        comparisonResult?.matchResult ?? ModalityMatchResult.indicated;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                // Color-coded header based on match result
                ResultMatchHeader(matchResult: matchResult),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(AppConstants.spacingMD),
                    child: Column(
                      children: [
                        // Show doctor's selection card if we have a comparison
                        if (comparisonResult != null)
                          ResultAnimatedSection(
                            index: 0,
                            child: ResultYourSelectionCard(
                              selectedModality: comparisonResult.selectedModality,
                              matchResult: comparisonResult.matchResult,
                              locale: locale,
                            ),
                          ),
                        AppSpacer.verticalMD,

                        // Clinical scenario
                        if (scenarioText != null && scenarioText.isNotEmpty)
                          ResultAnimatedSection(
                            index: 1,
                            child: ResultClinicalScenarioCard(
                                l10n: l10n, scenarioText: scenarioText),
                          ),
                        AppSpacer.verticalMD,

                        // Primary recommendation (Option 1)
                        if (comparisonResult != null &&
                            comparisonResult.primaryRecommendations.isNotEmpty)
                          ResultAnimatedSection(
                            index: 2,
                            child: ResultRecommendationCard(
                              l10n: l10n,
                              locale: locale,
                              recommendation:
                                  comparisonResult.primaryRecommendations.first,
                              appTheme: appTheme,
                            ),
                          ),

                        // Summary
                        if (summary != null && summary.isNotEmpty) ...[
                          AppSpacer.verticalMD,
                          ResultAnimatedSection(
                            index: 3,
                            child: ResultSummaryCard(l10n: l10n, summary: summary),
                          ),
                        ],

                        // Alternative recommendations (Option 2)
                        if (comparisonResult != null &&
                            comparisonResult.alternativeRecommendations.isNotEmpty) ...[
                          AppSpacer.verticalMD,
                          ResultAnimatedSection(
                            index: 4,
                            child: ResultAlternativesCard(
                              l10n: l10n,
                              locale: locale,
                              alternatives:
                                  comparisonResult.alternativeRecommendations,
                              appTheme: appTheme,
                            ),
                          ),
                        ],

                        // AI Explanation placeholder
                        AppSpacer.verticalMD,
                        ResultAnimatedSection(
                          index: 5,
                          child: ResultAiExplanationCard(
                            explanation: comparisonResult
                                ?.getLocalizedAiExplanation(locale),
                          ),
                        ),

                        // Disclaimer
                        AppSpacer.verticalMD,
                        ResultAnimatedSection(
                            index: 6, child: ResultDisclaimerCard(l10n: l10n)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(top: false, child: _buildActionButtons(context, l10n, ref)),
        ],
      ),
    );
  }

  Widget _buildActionButtons(
      BuildContext context, AppLocalizations l10n, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
            top: BorderSide(
                color: theme.colorScheme.outline.withValues(alpha: 0.2))),
      ),
      child: SizedBox(
        width: double.infinity,
        height: AppConstants.buttonHeightLG,
        child: ElevatedButton(
          onPressed: () {
            ref.read(currentAssessmentProvider.notifier).reset();
            context.go(AppRoutes.home);
          },
          child: Text(l10n.startNewAssessment),
        ),
      ),
    );
  }

  Widget _buildErrorState(
      BuildContext context, AppLocalizations l10n, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(
              icon: AppIcons.close,
              size: AppConstants.iconMD,
              color: theme.colorScheme.onSurface),
          onPressed: () {
            ref.read(currentAssessmentProvider.notifier).reset();
            context.go(AppRoutes.home);
          },
        ),
        title: Text(l10n.results),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.spacingLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(
                  icon: AppIcons.error,
                  size: AppConstants.iconXXL,
                  color: theme.colorScheme.error),
              AppSpacer.verticalMD,
              Text(l10n.somethingWentWrong, style: theme.textTheme.titleMedium),
              AppSpacer.verticalLG,
              ElevatedButton.icon(
                onPressed: () {
                  context.go(AppRoutes.home);
                  ref.read(currentAssessmentProvider.notifier).reset();
                },
                icon: HugeIcon(
                    icon: AppIcons.home,
                    size: AppConstants.iconSM,
                    color: theme.colorScheme.onPrimary),
                label: Text(l10n.home),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _buildClinicalScenario(List<AnswerRecord> answerHistory) {
    if (answerHistory.isEmpty) return null;
    final parts = answerHistory
        .map((a) => '${a.questionText}: ${a.selectedOptionText}')
        .toList();
    return parts.join('\n');
  }
}
