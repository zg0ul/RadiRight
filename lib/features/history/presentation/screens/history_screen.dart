import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/utils/app_logger.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import 'package:radi_right/features/history/presentation/providers/history_provider.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final historyAsync = ref.watch(historyNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.history),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'clear') {
                _showClearConfirmation(context, ref, l10n);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'clear',
                child: Row(
                  children: [const Icon(Icons.delete_outline), const SizedBox(width: 8), Text(l10n.clearHistory)],
                ),
              ),
            ],
          ),
        ],
      ),
      body: historyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          Logger.error(error.toString());
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
                const SizedBox(height: 16),
                Text(error.toString()),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () => ref.invalidate(historyNotifierProvider), child: Text(l10n.retry)),
              ],
            ),
          );
        },
        data: (history) {
          if (history.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 64, color: Theme.of(context).colorScheme.outline),
                  const SizedBox(height: 16),
                  Text(
                    l10n.noHistory,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.outline),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: history.length,
            itemBuilder: (context, index) {
              final item = history[index];
              return Dismissible(
                key: Key(item.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  color: Theme.of(context).colorScheme.error,
                  child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onError),
                ),
                confirmDismiss: (direction) async {
                  return await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete'),
                      content: const Text('Are you sure you want to delete this history item?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.cancel)),
                        TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.confirm)),
                      ],
                    ),
                  );
                },
                onDismissed: (direction) {
                  ref.read(historyNotifierProvider.notifier).deleteHistory(item.id);
                },
                child: Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(
                        Icons.medical_services_outlined,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    title: Text(
                      item.topicName,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '${item.formattedDate} ${item.formattedTime}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.primary),
                    onTap: () => context.push(AppRoutes.historyDetailPath(item.id)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showClearConfirmation(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.clearHistory),
        content: Text(l10n.clearHistoryConfirmation),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(historyNotifierProvider.notifier).clearAllHistory();
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}
