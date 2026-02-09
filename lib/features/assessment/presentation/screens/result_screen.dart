import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/l10n/app_localizations.dart';

import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/app/theme/app_theme_extension.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/providers/locale_provider.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/models/assessment_result.dart';
import 'package:radi_right/features/assessment/domain/models/decision_node.dart';
import 'package:radi_right/features/assessment/domain/models/imaging_recommendation.dart';
import 'package:radi_right/features/assessment/domain/services/decision_engine.dart';
import 'package:radi_right/features/assessment/presentation/providers/assessment_provider.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_alternatives_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_animated_section.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_clinical_scenario_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_disclaimer_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_recommendation_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_success_header.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_summary_card.dart';

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

    final recommendations = engineState.recommendations;
    final resultNode = engineState.currentNode is ResultNode ? engineState.currentNode as ResultNode : null;
    final summary = resultNode != null ? (locale == 'ar' ? resultNode.summaryAr : resultNode.summary) : null;

    final primary = _primaryRecommendation(recommendations);
    final alternatives = recommendations.where((r) => r != primary).toList();
    final scenarioText = _buildClinicalScenario(engineState.answerHistory);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                ResultSuccessHeader(appTheme: appTheme),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(AppConstants.spacingMD),
                    child: Column(
                      children: [
                        if (scenarioText != null && scenarioText.isNotEmpty)
                          ResultAnimatedSection(
                            index: 0,
                            child: ResultClinicalScenarioCard(l10n: l10n, scenarioText: scenarioText),
                          ),
                        AppSpacer.verticalMD,
                        if (primary != null)
                          ResultAnimatedSection(
                            index: 1,
                            child: ResultRecommendationCard(
                              l10n: l10n,
                              locale: locale,
                              recommendation: primary,
                              appTheme: appTheme,
                            ),
                          ),
                        if (summary != null && summary.isNotEmpty) ...[
                          AppSpacer.verticalMD,
                          ResultAnimatedSection(
                            index: 2,
                            child: ResultSummaryCard(l10n: l10n, summary: summary),
                          ),
                        ],
                        if (alternatives.isNotEmpty) ...[
                          AppSpacer.verticalMD,
                          ResultAnimatedSection(
                            index: 3,
                            child: ResultAlternativesCard(
                              l10n: l10n,
                              locale: locale,
                              alternatives: alternatives,
                              appTheme: appTheme,
                            ),
                          ),
                        ],
                        AppSpacer.verticalMD,
                        ResultAnimatedSection(index: 4, child: ResultDisclaimerCard(l10n: l10n)),
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

  Widget _buildActionButtons(BuildContext context, AppLocalizations l10n, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.2))),
      ),
      child: SizedBox(
        width: double.infinity,
        height: AppConstants.buttonHeightLG,
        child: ElevatedButton(
          onPressed: () {
            ref.read(currentAssessmentProvider.notifier).reset();
            context.go(AppRoutes.home);
          },
          child: Text(l10n.startAssessment),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, AppLocalizations l10n, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(icon: AppIcons.close, size: AppConstants.iconMD, color: theme.colorScheme.onSurface),
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
              HugeIcon(icon: AppIcons.error, size: AppConstants.iconXXL, color: theme.colorScheme.error),
              AppSpacer.verticalMD,
              Text(l10n.somethingWentWrong, style: theme.textTheme.titleMedium),
              AppSpacer.verticalLG,
              ElevatedButton.icon(
                onPressed: () {
                  context.go(AppRoutes.home);
                  ref.read(currentAssessmentProvider.notifier).reset();
                },
                icon: HugeIcon(icon: AppIcons.home, size: AppConstants.iconSM, color: theme.colorScheme.onPrimary),
                label: Text(l10n.home),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ImagingRecommendation? _primaryRecommendation(List<ImagingRecommendation> recommendations) {
    if (recommendations.isEmpty) return null;
    final usuallyAppropriate = recommendations.where((r) => r.appropriateness.name == 'usuallyAppropriate').toList();
    if (usuallyAppropriate.isNotEmpty) {
      final byScore = usuallyAppropriate..sort((a, b) => (b.score ?? 0).compareTo(a.score ?? 0));
      return byScore.first;
    }
    final byScore = List<ImagingRecommendation>.from(recommendations)
      ..sort((a, b) => (b.score ?? 0).compareTo(a.score ?? 0));
    return byScore.first;
  }

  String? _buildClinicalScenario(List<AnswerRecord> answerHistory) {
    if (answerHistory.isEmpty) return null;
    final parts = answerHistory.map((a) => '${a.questionText}: ${a.selectedOptionText}').toList();
    return parts.join('\n');
  }
}
