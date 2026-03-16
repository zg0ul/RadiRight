import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/providers/locale_provider.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_summary_card.dart';
import 'package:radi_right/features/assessment/presentation/widgets/result_your_selection_card.dart';
import 'package:radi_right/features/history/presentation/providers/history_provider.dart';
import 'package:radi_right/features/history/presentation/widgets/history_answers_card.dart';
import 'package:radi_right/features/history/presentation/widgets/history_detail_header.dart';
import 'package:radi_right/features/history/presentation/widgets/history_recommendations_card.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class HistoryDetailScreen extends ConsumerWidget {
  const HistoryDetailScreen({super.key, required this.historyId});

  final String historyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final historyAsync = ref.watch(historyNotifierProvider);

    return historyAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: Text(l10n.historyDetailTitle)),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        appBar: AppBar(title: Text(l10n.historyDetailTitle)),
        body: Center(child: Text(error.toString())),
      ),
      data: (history) {
        final item = history.where((e) => e.id == historyId).firstOrNull;
        if (item == null) {
          return _buildNotFoundState(context, l10n);
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              // Header with topic name and date
              HistoryDetailHeader(item: item),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.spacingMD),
                  child: Column(
                    children: [
                      // Your Selection (modality and match result)
                      if (item.selectedModality != null &&
                          item.matchResult != null)
                        ResultYourSelectionCard(
                          selectedModality: item.selectedModality!,
                          matchResult: item.matchResult!,
                          locale: locale,
                        ),

                      if (item.selectedModality != null &&
                          item.matchResult != null)
                        AppSpacer.verticalMD,

                      // Recommendations
                      HistoryRecommendationsCard(
                        l10n: l10n,
                        locale: locale,
                        recommendations: item.result?.recommendations ?? [],
                      ),

                      AppSpacer.verticalMD,

                      // Your Answers
                      HistoryAnswersCard(
                        l10n: l10n,
                        answers: item.answers,
                      ),

                      // Summary (if available)
                      if (item.result?.summary != null &&
                          item.result!.summary!.isNotEmpty) ...[
                        AppSpacer.verticalMD,
                        ResultSummaryCard(
                          l10n: l10n,
                          summary: item.result!.summary!,
                        ),
                      ],

                      // Bottom padding for safe area
                      SizedBox(height: AppConstants.spacingXL),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotFoundState(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.historyDetailTitle),
        leading: IconButton(
          icon: HugeIcon(
            icon: AppIcons.back,
            size: AppConstants.iconMD,
            color: theme.colorScheme.onSurface,
          ),
          onPressed: () => context.go(AppRoutes.history),
        ),
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
                color: theme.colorScheme.error,
              ),
              AppSpacer.verticalMD,
              Text(
                l10n.somethingWentWrong,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              AppSpacer.verticalLG,
              ElevatedButton.icon(
                onPressed: () => context.go(AppRoutes.history),
                icon: HugeIcon(
                  icon: AppIcons.back,
                  size: AppConstants.iconSM,
                  color: theme.colorScheme.onPrimary,
                ),
                label: Text(l10n.back),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
