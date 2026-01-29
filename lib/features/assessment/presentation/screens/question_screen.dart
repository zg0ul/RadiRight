import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/routing/routes.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../domain/models/decision_node.dart';
import '../../domain/services/decision_engine.dart';
import '../providers/assessment_provider.dart';
import '../widgets/answer_option_tile.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final engineState = ref.watch(decisionEngineProvider);
    final assessmentState = ref.watch(currentAssessmentProvider);

    if (engineState == null || !assessmentState.isActive) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.question)),
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

    // Check if assessment is complete
    if (engineState.isComplete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(AppRoutes.result);
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentNode = engineState.currentNode;
    if (currentNode is! QuestionNode) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(assessmentState.topicName ?? l10n.question),
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () => _showExitDialog(context, ref, l10n)),
      ),
      body: Column(
        children: [
          // Progress indicator
          LinearProgressIndicator(
            value: engineState.questionNumber / 10, // Approximate
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Question number
                  Text(
                    '${l10n.question} ${engineState.questionNumber}',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 12),
                  // Question text
                  Text(
                    currentNode.getLocalizedQuestionText(locale),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  // Hint if available
                  if (currentNode.getLocalizedHint(locale) != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.info_outline, size: 20, color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              currentNode.getLocalizedHint(locale)!,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  // Answer options
                  ...currentNode.options.map((option) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AnswerOptionTile(
                        option: option,
                        locale: locale,
                        onTap: () {
                          ref.read(decisionEngineProvider.notifier).selectAnswer(option, locale);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          // Back button
          if (engineState.canGoBack)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: OutlinedButton.icon(
                  onPressed: () {
                    ref.read(decisionEngineProvider.notifier).goBack();
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: Text(l10n.back),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showExitDialog(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.cancel),
        content: Text('Are you sure you want to exit? Your progress will be lost.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.no)),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(currentAssessmentProvider.notifier).reset();
              context.go(AppRoutes.home);
            },
            child: Text(l10n.yes),
          ),
        ],
      ),
    );
  }
}
