import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/l10n/app_localizations.dart';

import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/providers/locale_provider.dart';
import 'package:radi_right/core/utils/animation_extensions.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/models/panel.dart';
import 'package:radi_right/features/assessment/presentation/providers/assessment_provider.dart';

class PanelSelectionScreen extends HookConsumerWidget {
  const PanelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final panelsAsync = ref.watch(panelsProvider);
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final searchQuery = useState('');

    return AppScaffold(
      title: 'RadiRight',
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
                      value: 0.5, // Step 2 of 4
                      backgroundColor: theme.colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                      borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                    ),
                  ),
                  AppSpacer.horizontalSM,
                  Text(
                    l10n.stepOf(2, 4),
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
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
                    l10n.selectClinicalArea,
                    style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  AppSpacer.verticalXS,
                  Text(
                    l10n.chooseBodySystem,
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            AppSpacer.verticalMD,
            Expanded(
              child: panelsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => _buildErrorState(context, ref, error, l10n),
                data: (panels) {
                  final filteredPanels = panels.where((panel) {
                    if (searchQuery.value.isEmpty) return true;
                    final query = searchQuery.value.toLowerCase();
                    return panel.name.toLowerCase().contains(query) || panel.nameAr.toLowerCase().contains(query);
                  }).toList();

                  if (filteredPanels.isEmpty) {
                    return _buildEmptyState(context, l10n);
                  }

                  return _buildPanelGrid(context, filteredPanels, locale, l10n);
                },
              ),
            ),
            // Back button
            Padding(
              padding: EdgeInsets.all(AppConstants.spacingMD),
              child: TextButton(
                onPressed: () {
                  ref.read(currentAssessmentProvider.notifier).clearModality();
                  context.pop();
                },
                child: Text(l10n.back, style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.primary)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanelGrid(BuildContext context, List<Panel> panels, String locale, AppLocalizations l10n) {
    return GridView.builder(
      padding: EdgeInsets.all(AppConstants.spacingMD),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppConstants.spacingMD,
        mainAxisSpacing: AppConstants.spacingMD,
        childAspectRatio: 0.85,
      ),
      itemCount: panels.length,
      itemBuilder: (context, index) {
        final panel = panels[index];
        return _PanelCard(panel: panel, locale: locale, index: index);
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
              onPressed: () => ref.invalidate(panelsProvider),
              icon: HugeIcon(icon: AppIcons.refresh, size: AppConstants.iconSM, color: theme.colorScheme.onPrimary),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD, vertical: AppConstants.spacingXS),
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

class _PanelCard extends ConsumerWidget {
  final Panel panel;
  final String locale;
  final int index;

  const _PanelCard({required this.panel, required this.locale, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isAvailable = panel.isEnabled && panel.topicCount > 0;
    final name = locale == 'ar' ? panel.nameAr : panel.name;
    final description = (locale == 'ar' ? panel.descriptionAr : panel.description) ?? '';
    final icon = panel.getIcon();

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        border: Border.all(color: theme.colorScheme.outlineVariant, width: 1),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
      ),
      child: InkWell(
        onTap: isAvailable
            ? () {
                // Store selected panel in provider
                ref.read(currentAssessmentProvider.notifier).selectPanel(panel.id, name);
                context.push(AppRoutes.topicSelectionPath(panel.id));
              }
            : null,
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        splashColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        highlightColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        splashFactory: NoSplash.splashFactory,
        child: Padding(
          padding: EdgeInsets.all(AppConstants.spacingMD),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: AppConstants.iconXXL,
                  height: AppConstants.iconXXL,
                  decoration: BoxDecoration(
                    color: isAvailable ? theme.colorScheme.primaryContainer : theme.colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(AppConstants.radiusMD),
                  ),
                  child: Center(
                    child: HugeIcon(
                      icon: icon,
                      size: AppConstants.iconLG,
                      color: isAvailable
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                ),
                AppSpacer.verticalMD,
                Text(
                  name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isAvailable
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                AppSpacer.verticalXS,
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isAvailable
                        ? theme.colorScheme.onSurfaceVariant
                        : theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                AppSpacer.verticalSM,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingSM, vertical: AppConstants.spacingXS),
                  decoration: BoxDecoration(
                    color: isAvailable ? theme.colorScheme.primaryContainer : theme.colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isAvailable)
                        Row(
                          children: [
                            HugeIcon(
                              icon: AppIcons.locked,
                              size: AppConstants.iconXS,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            AppSpacer.horizontalXS,
                          ],
                        )
                      else
                        const SizedBox.shrink(),
                      Text(
                        isAvailable ? '${panel.topicCount} Topics' : 'Soon',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: isAvailable ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).fadeSlideIn(index: index);
  }
}
