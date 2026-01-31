import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/routing/routes.dart';
import '../../../../core/providers/locale_provider.dart';
import '../providers/assessment_provider.dart';

class PanelSelectionScreen extends ConsumerWidget {
  const PanelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final panelsAsync = ref.watch(panelsProvider);
    final locale = ref.watch(localeNotifierProvider).languageCode;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.selectPanel)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Text(
              l10n.selectPanelSubtitle,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ),
          Expanded(
            child: panelsAsync.when(
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
                    ElevatedButton(onPressed: () => ref.invalidate(panelsProvider), child: Text(l10n.retry)),
                  ],
                ),
              ),
              data: (panels) {
                if (panels.isEmpty) {
                  return Center(child: Text(l10n.noRecommendations));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: panels.length,
                  itemBuilder: (context, index) {
                    final panel = panels[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          child: Icon(
                            Icons.medical_services_outlined,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ),
                        title: Text(
                          panel.getLocalizedName(locale),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: panel.getLocalizedDescription(locale) != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  panel.getLocalizedDescription(locale)!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            : null,
                        trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.primary),
                        onTap: () => context.push(AppRoutes.topicSelectionPath(panel.id)),
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
