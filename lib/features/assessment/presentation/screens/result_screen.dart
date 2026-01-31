import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/routing/routes.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../domain/models/assessment_result.dart';
import '../../domain/models/decision_node.dart';
import '../../domain/models/imaging_recommendation.dart';
import '../../domain/models/patient_profile.dart';
import '../../domain/services/decision_engine.dart';
import '../providers/assessment_provider.dart';
import '../widgets/appropriateness_indicator.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final engineState = ref.watch(decisionEngineProvider);
    final assessmentState = ref.watch(currentAssessmentProvider);

    if (engineState == null || !engineState.isComplete) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.results)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64),
              const SizedBox(height: 16),
              Text(l10n.somethingWentWrong),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () => context.go(AppRoutes.home), child: Text(l10n.home)),
            ],
          ),
        ),
      );
    }

    final recommendations = engineState.recommendations;
    final resultNode = engineState.currentNode is ResultNode ? engineState.currentNode as ResultNode : null;
    final summary = resultNode != null ? (locale == 'ar' ? resultNode.summaryAr : resultNode.summary) : null;

    // Primary: first usually-appropriate recommendation or highest score; rest are alternatives
    final primary = _primaryRecommendation(recommendations);
    final alternatives = recommendations.where((r) => r != primary).toList();

    // Build clinical scenario from demographics + answer history
    final scenarioText = _buildClinicalScenario(assessmentState.patientProfile, engineState.answerHistory);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.acrRecommendation),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            ref.read(currentAssessmentProvider.notifier).reset();
            context.go(AppRoutes.home);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.acrRecommendationSubtitle,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            // ACR Recommendation card (primary)
            _AcrRecommendationCard(recommendation: primary, guidelineCode: 'MSK 1', locale: locale, l10n: l10n),
            const SizedBox(height: 20),
            // Clinical Scenario
            if (scenarioText != null && scenarioText.isNotEmpty) ...[
              _SectionCard(title: l10n.clinicalScenario, child: Text(scenarioText)),
              const SizedBox(height: 16),
            ],
            // Recommended Imaging Study
            if (primary != null) ...[
              _SectionCard(
                title: l10n.recommendedImagingStudy,
                child: Text(
                  primary.getLocalizedProcedure(locale),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Evidence Summary
            if (summary != null && summary.isNotEmpty) ...[
              _SectionCard(title: l10n.evidenceSummary, child: Text(summary)),
              const SizedBox(height: 16),
            ],
            // Alternative Imaging Options
            if (alternatives.isNotEmpty) ...[
              _SectionCard(
                title: l10n.alternativeImagingOptions,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: alternatives.map((rec) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rec.getLocalizedModality(locale),
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 4),
                                Text(rec.getLocalizedProcedure(locale), style: Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (rec.score != null)
                            Text(
                              '${rec.score}/9',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: _scoreColor(context, rec.appropriateness.name),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          const SizedBox(width: 8),
                          AppropriatenessIndicator(level: rec.appropriateness, locale: locale),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Clinical Judgment disclaimer
            _SectionCard(
              title: l10n.clinicalJudgment,
              child: Text(l10n.clinicalJudgmentDisclaimer, style: Theme.of(context).textTheme.bodySmall),
            ),
            const SizedBox(height: 24),
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      ref.read(currentAssessmentProvider.notifier).reset();
                      context.go(AppRoutes.panelSelection);
                    },
                    child: Text(l10n.startAssessment),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(currentAssessmentProvider.notifier).reset();
                      context.go(AppRoutes.home);
                    },
                    child: Text(l10n.home),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
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

  String? _buildClinicalScenario(PatientProfile? patientProfile, List<AnswerRecord> answerHistory) {
    final parts = <String>[];
    if (patientProfile != null) {
      parts.add(patientProfile.ageGroup);
      parts.add(patientProfile.sex);
      parts.add(patientProfile.anatomicalLocation);
    }
    for (final a in answerHistory) {
      parts.add('${a.questionText}: ${a.selectedOptionText}');
    }
    if (parts.isEmpty) return null;
    return parts.join(', ');
  }

  Color _scoreColor(BuildContext context, String appropriateness) {
    final theme = Theme.of(context);
    switch (appropriateness) {
      case 'usuallyAppropriate':
        return theme.colorScheme.primary;
      case 'mayBeAppropriate':
        return theme.colorScheme.tertiary;
      case 'usuallyNotAppropriate':
        return theme.colorScheme.error;
      default:
        return theme.colorScheme.onSurface;
    }
  }
}

class _AcrRecommendationCard extends StatelessWidget {
  final ImagingRecommendation? recommendation;
  final String guidelineCode;
  final String locale;
  final AppLocalizations l10n;

  const _AcrRecommendationCard({
    required this.recommendation,
    required this.guidelineCode,
    required this.locale,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    if (recommendation == null) return const SizedBox.shrink();
    final rec = recommendation!;
    final theme = Theme.of(context);
    final statusText = locale == 'ar' ? rec.appropriateness.arabicDisplayName : rec.appropriateness.displayName;
    final scoreText = rec.score != null ? '${rec.score}/9' : null;
    final isUsuallyAppropriate = rec.appropriateness.name == 'usuallyAppropriate';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isUsuallyAppropriate ? Icons.check_circle : Icons.info_outline,
                color: theme.colorScheme.primary,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  statusText,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          if (isUsuallyAppropriate) ...[
            const SizedBox(height: 8),
            Text(
              l10n.usuallyAppropriateVerdictDesc,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ],
          if (scoreText != null) ...[
            const SizedBox(height: 12),
            Text(l10n.appropriatenessScore, style: theme.textTheme.labelMedium),
            Text(
              scoreText,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(l10n.guidelineCode, style: theme.textTheme.labelMedium),
          Text(guidelineCode, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
