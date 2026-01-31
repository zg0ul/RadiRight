import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/routing/routes.dart';
import '../../../../core/providers/locale_provider.dart';
import '../providers/assessment_provider.dart';

class TopicSelectionScreen extends HookConsumerWidget {
  final String panelId;

  const TopicSelectionScreen({super.key, required this.panelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final topicsAsync = ref.watch(topicsProvider(panelId));
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final searchController = useTextEditingController();
    final searchQuery = useState('');

    return Scaffold(
      appBar: AppBar(title: Text(l10n.selectTopic)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: (value) => searchQuery.value = value,
              decoration: InputDecoration(
                hintText: l10n.searchTopics,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.value.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          searchQuery.value = '';
                        },
                      )
                    : null,
              ),
            ),
          ),
          Expanded(
            child: topicsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
                    const SizedBox(height: 16),
                    Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(onPressed: () => ref.invalidate(topicsProvider(panelId)), child: Text(l10n.retry)),
                  ],
                ),
              ),
              data: (topics) {
                final filteredTopics = topics.where((topic) {
                  if (searchQuery.value.isEmpty) return true;
                  final query = searchQuery.value.toLowerCase();
                  return topic.name.toLowerCase().contains(query) || topic.nameAr.contains(query);
                }).toList();

                if (filteredTopics.isEmpty) {
                  return Center(child: Text(l10n.noRecommendations));
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredTopics.length,
                  itemBuilder: (context, index) {
                    final topic = filteredTopics[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        title: Text(
                          topic.getLocalizedName(locale),
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        subtitle: topic.getLocalizedDescription(locale) != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  topic.getLocalizedDescription(locale)!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              )
                            : null,
                        trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.primary),
                        onTap: () {
                          context.push(AppRoutes.demographicsPath(topic.id));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
