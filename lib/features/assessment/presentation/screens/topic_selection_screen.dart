import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/l10n/app_localizations.dart';

import '../../../../app/routing/routes.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/utils/app_spacer.dart';
import '../../../../shared/widgets/app_search_bar.dart';
import '../../../../shared/widgets/loading_skeleton.dart';
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

    // Track which items have been animated to prevent replay
    final animatedItems = useState<Set<int>>({});

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(
            icon: AppIcons.back,
            size: AppConstants.iconMD,
            color: theme.colorScheme.onSurface,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.selectTopic),
      ),
      body: Column(
        children: [
          AppSearchBar(
            controller: searchController,
            hintText: l10n.searchTopics,
            onChanged: (value) => searchQuery.value = value,
            onClear: () => searchQuery.value = '',
            showClearButton: searchQuery.value.isNotEmpty,
          ),
          Expanded(
            child: topicsAsync.when(
              loading: () => const ListSkeleton(itemCount: 6),
              error: (error, stack) => _buildErrorState(context, ref, error, l10n),
              data: (topics) {
                final filteredTopics = topics.where((topic) {
                  if (searchQuery.value.isEmpty) return true;
                  final query = searchQuery.value.toLowerCase();
                  return topic.name.toLowerCase().contains(query) ||
                      topic.nameAr.contains(query);
                }).toList();

                if (filteredTopics.isEmpty) {
                  return _buildEmptyState(context, l10n);
                }

                return _buildTopicList(context, filteredTopics, locale, animatedItems);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicList(
    BuildContext context,
    List<Topic> topics,
    String locale,
    ValueNotifier<Set<int>> animatedItems,
  ) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingMD,
        vertical: AppConstants.spacingSM,
      ),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        final topic = topics[index];
        final shouldAnimate = !animatedItems.value.contains(index);

        // Mark as animated after first build
        if (shouldAnimate) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            animatedItems.value = {...animatedItems.value, index};
          });
        }

        return _TopicCard(
          topic: topic,
          locale: locale,
          index: index,
          shouldAnimate: shouldAnimate,
        );
      },
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    WidgetRef ref,
    Object error,
    AppLocalizations l10n,
  ) {
    final theme = Theme.of(context);
    return Center(
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
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: theme.colorScheme.error),
            ),
            AppSpacer.verticalMD,
            ElevatedButton.icon(
              onPressed: () => ref.invalidate(topicsProvider(panelId)),
              icon: HugeIcon(
                icon: AppIcons.refresh,
                size: AppConstants.iconSM,
                color: theme.colorScheme.onPrimary,
              ),
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
          HugeIcon(
            icon: AppIcons.search,
            size: AppConstants.iconXXL,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          AppSpacer.verticalMD,
          Text(
            l10n.noRecommendations,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopicCard extends StatefulWidget {
  final Topic topic;
  final String locale;
  final int index;
  final bool shouldAnimate;

  const _TopicCard({
    required this.topic,
    required this.locale,
    required this.index,
    required this.shouldAnimate,
  });

  @override
  State<_TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<_TopicCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Topic icons based on common MSK topics
  static const Map<String, List<List<dynamic>>> topicIcons = {
    'elbow': AppIcons.bone,
    'hand': AppIcons.bone,
    'wrist': AppIcons.bone,
    'shoulder': AppIcons.bone,
    'knee': AppIcons.bone,
    'hip': AppIcons.bone,
    'ankle': AppIcons.bone,
    'spine': AppIcons.bone,
    'foot': AppIcons.bone,
  };

  List<List<dynamic>> _getTopicIcon() {
    final topicLower = widget.topic.id.toLowerCase();
    for (final entry in topicIcons.entries) {
      if (topicLower.contains(entry.key)) {
        return entry.value;
      }
    }
    return AppIcons.xray; // default for medical topics
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (widget.shouldAnimate) {
      // Stagger the animation based on index
      Future.delayed(Duration(milliseconds: widget.index * 50), () {
        if (mounted) {
          _controller.forward();
        }
      });
    } else {
      // Skip animation, show immediately
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = _getTopicIcon();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Card(
          margin: EdgeInsets.only(bottom: AppConstants.spacingSM),
          child: InkWell(
            onTap: () => context.push(AppRoutes.questionPath(widget.topic.id)),
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            child: Padding(
              padding: EdgeInsets.all(AppConstants.spacingMD),
              child: Row(
                children: [
                  Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(AppConstants.radiusMD),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: icon,
                        size: 28.sp,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  AppSpacer.horizontalMD,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.topic.getLocalizedName(widget.locale),
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (widget.topic.getLocalizedDescription(widget.locale) != null) ...[
                          AppSpacer.verticalXS,
                          Text(
                            widget.topic.getLocalizedDescription(widget.locale)!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  AppSpacer.horizontalSM,
                  HugeIcon(
                    icon: AppIcons.chevronRight,
                    size: AppConstants.iconMD,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
