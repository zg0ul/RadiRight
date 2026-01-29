import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/routing/routes.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../domain/services/decision_engine.dart';
import '../providers/assessment_provider.dart';
import '../widgets/appropriateness_indicator.dart';
import '../widgets/radiation_indicator.dart';

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
              ElevatedButton(
                onPressed: () => context.go(AppRoutes.home),
                child: Text(l10n.home),
              ),
            ],
          ),
        ),
      );
    }

    final recommendations = engineState.recommendations;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.assessmentResults),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            ref.read(currentAssessmentProvider.notifier).reset();
            context.go(AppRoutes.home);
          },
        ),
      ),
      body: Column(
        children: [
          // Topic header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  assessmentState.topicName ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.imagingRecommendations,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withValues(alpha: 0.8),
                      ),
                ),
              ],
            ),
          ),
          // Recommendations list
          Expanded(
            child: recommendations.isEmpty
                ? Center(child: Text(l10n.noRecommendations))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: recommendations.length,
                    itemBuilder: (context, index) {
                      final rec = recommendations[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Modality and appropriateness
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      rec.getLocalizedModality(locale),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  AppropriatenessIndicator(
                                    level: rec.appropriateness,
                                    locale: locale,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Procedure
                              Text(
                                rec.getLocalizedProcedure(locale),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 12),
                              // Radiation level
                              Row(
                                children: [
                                  Text(
                                    '${l10n.radiation}: ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  RadiationIndicator(
                                    level: rec.radiation,
                                    locale: locale,
                                  ),
                                ],
                              ),
                              // Comments
                              if (rec.getLocalizedComments(locale) != null) ...[
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceContainerHighest,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        size: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          rec.getLocalizedComments(locale)!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Action buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
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
            ),
          ),
        ],
      ),
    );
  }
}
