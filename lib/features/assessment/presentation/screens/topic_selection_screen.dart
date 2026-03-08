import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/features/assessment/presentation/widgets/topic_card.dart';
import 'package:radi_right/l10n/app_localizations.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/utils/app_spacer.dart';
import '../../../../shared/widgets/app_search_bar.dart';
import '../../domain/models/topic.dart';
import '../providers/assessment_provider.dart';

class TopicSelectionScreen extends HookConsumerWidget {
  final String panelId;

  const TopicSelectionScreen({super.key, required this.panelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final topicsAsync = ref.watch(topicsProvider(panelId));
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final scrollController = useScrollController();

    // Track which topic ids have been animated to prevent replay on filter changes
    final animatedTopicIds = useState<Set<String>>({});

    return AppScaffold(
      title: 'RadiRight',
      scrollController: scrollController,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step indicator
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD),
              child: Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.75, // Step 3 of 4
                      backgroundColor: theme.colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                    ),
                  ),
                  AppSpacer.horizontalSM,
                  Text(
                    l10n.stepOf(3, 4),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            AppSpacer.verticalLG,
            // Title and subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.selectClinicalScenario,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacer.verticalXS,
                  Text(
                    l10n.chooseRelevantPresentation,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            AppSpacer.verticalMD,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD),
              child: AppSearchBar(
                controller: searchController,
                hintText: l10n.searchTopics,
                onChanged: (value) => searchQuery.value = value,
                onClear: () => searchQuery.value = '',
                showClearButton: searchQuery.value.isNotEmpty,
              ),
            ),
            AppSpacer.verticalMD,
            Expanded(
              child: topicsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => _buildErrorState(context, ref, error, l10n),
                data: (topics) {
                  final filteredTopics = topics.where((topic) {
                    if (searchQuery.value.isEmpty) return true;
                    final query = searchQuery.value.toLowerCase();
                    return topic.name.toLowerCase().contains(query) || topic.nameAr.contains(query);
                  }).toList();

                  if (filteredTopics.isEmpty) {
                    return _buildEmptyState(context, l10n);
                  }

                  return _buildTopicList(context, filteredTopics, locale, animatedTopicIds, scrollController);
                },
              ),
            ),
            // Back button
            Padding(
              padding: EdgeInsets.all(AppConstants.spacingMD),
              child: TextButton(
                onPressed: () {
                  ref.read(currentAssessmentProvider.notifier).clearPanel();
                  context.pop();
                },
                child: Text(
                  l10n.back,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicList(
    BuildContext context,
    List<Topic> topics,
    String locale,
    ValueNotifier<Set<String>> animatedTopicIds,
    ScrollController scrollController,
  ) {
    return ListView.builder(
      controller: scrollController,
      itemCount: topics.length,
      itemBuilder: (context, index) {
        final topic = topics[index];
        final shouldAnimate = !animatedTopicIds.value.contains(topic.id);

        // Mark as animated after being built once to prevent re-animation on filter changes
        if (shouldAnimate) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            animatedTopicIds.value = {...animatedTopicIds.value, topic.id};
          });
        }

        return Container(
          key: ValueKey(topic.id),
          margin: EdgeInsets.only(
            bottom: AppConstants.spacingSM,
            right: AppConstants.spacingSM,
            left: AppConstants.spacingSM,
          ),
          child: TopicCard(topic: topic, locale: locale, index: index, shouldAnimate: shouldAnimate),
        );
      },
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingLG),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(icon: AppIcons.error, size: AppConstants.iconXXL, color: theme.colorScheme.error),
            AppSpacer.verticalMD,
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: theme.colorScheme.error),
            ),
            AppSpacer.verticalMD,
            ElevatedButton.icon(
              onPressed: () => ref.invalidate(topicsProvider(panelId)),
              icon: HugeIcon(icon: AppIcons.refresh, size: AppConstants.iconSM, color: theme.colorScheme.onPrimary),
              label: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(icon: AppIcons.search, size: AppConstants.iconXXL, color: theme.colorScheme.onSurfaceVariant),
          AppSpacer.verticalMD,
          Text(
            l10n.noRecommendations,
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
