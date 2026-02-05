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
import '../../../../core/utils/animation_extensions.dart';
import '../../../../core/utils/app_spacer.dart';
import '../../../../shared/widgets/app_search_bar.dart';
import '../../../../shared/widgets/loading_skeleton.dart';
import '../../domain/models/panel.dart';
import '../providers/assessment_provider.dart';

/// Clinical panel data for display
class ClinicalPanelData {
  final String id;
  final String name;
  final String nameAr;
  final String description;
  final String descriptionAr;
  final List<List<dynamic>> icon;
  final bool isAvailable;
  final int? topicCount;

  const ClinicalPanelData({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.description,
    required this.descriptionAr,
    required this.icon,
    this.isAvailable = false,
    this.topicCount,
  });
}

/// All clinical panels including coming soon ones
final List<ClinicalPanelData> allClinicalPanels = [
  ClinicalPanelData(
    id: 'msk',
    name: 'Musculoskeletal',
    nameAr: 'العضلات والعظام',
    description: 'Bones, Joints & Soft Tissue',
    descriptionAr: 'العظام والمفاصل والأنسجة الرخوة',
    icon: AppIcons.bone,
    isAvailable: true,
    topicCount: 28,
  ),
  ClinicalPanelData(
    id: 'chest',
    name: 'Chest',
    nameAr: 'الصدر',
    description: 'Thoracic & Pulmonary',
    descriptionAr: 'الصدر والرئة',
    icon: AppIcons.lungs,
    isAvailable: false,
  ),
  ClinicalPanelData(
    id: 'neuro',
    name: 'Neurological',
    nameAr: 'الأعصاب',
    description: 'Brain, Spine & Nerves',
    descriptionAr: 'الدماغ والعمود الفقري والأعصاب',
    icon: AppIcons.brain,
    isAvailable: false,
  ),
  ClinicalPanelData(
    id: 'abdominal',
    name: 'Abdominal',
    nameAr: 'البطن',
    description: 'GI, GU & Pelvic',
    descriptionAr: 'الجهاز الهضمي والبولي والحوض',
    icon: AppIcons.kidneys,
    isAvailable: false,
  ),
  ClinicalPanelData(
    id: 'cardiac',
    name: 'Cardiac',
    nameAr: 'القلب',
    description: 'Heart & Vascular',
    descriptionAr: 'القلب والأوعية الدموية',
    icon: AppIcons.heart,
    isAvailable: false,
  ),
  ClinicalPanelData(
    id: 'pediatric',
    name: 'Pediatric',
    nameAr: 'الأطفال',
    description: 'Children & Infants',
    descriptionAr: 'الأطفال والرضع',
    icon: AppIcons.baby,
    isAvailable: false,
  ),
];

class PanelSelectionScreen extends HookConsumerWidget {
  const PanelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final panelsAsync = ref.watch(panelsProvider);
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final searchController = useTextEditingController();
    final searchQuery = useState('');

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
        title: Text(l10n.selectPanel),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD),
            child: Text(
              l10n.selectPanelSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          AppSpacer.verticalMD,
          Expanded(
            child: panelsAsync.when(
              loading: () => const ListSkeleton(itemCount: 4),
              error: (error, stack) => _buildErrorState(context, ref, error, l10n),
              data: (panels) {
                // Merge loaded panels with static panel data
                final mergedPanels = _mergePanelData(panels, locale);

                final filteredPanels = mergedPanels.where((panel) {
                  if (searchQuery.value.isEmpty) return true;
                  final query = searchQuery.value.toLowerCase();
                  return panel.name.toLowerCase().contains(query) ||
                      panel.nameAr.toLowerCase().contains(query);
                }).toList();

                if (filteredPanels.isEmpty) {
                  return _buildEmptyState(context, l10n);
                }

                return _buildPanelGrid(context, filteredPanels, locale, l10n);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<ClinicalPanelData> _mergePanelData(List<Panel> loadedPanels, String locale) {
    // Create a map of loaded panels by ID for quick lookup
    final loadedPanelMap = {for (var p in loadedPanels) p.id.toLowerCase(): p};

    // Update the static panels with loaded data where available
    return allClinicalPanels.map((staticPanel) {
      final loadedPanel = loadedPanelMap[staticPanel.id.toLowerCase()];
      if (loadedPanel != null) {
        return ClinicalPanelData(
          id: staticPanel.id,
          name: staticPanel.name,
          nameAr: staticPanel.nameAr,
          description: staticPanel.description,
          descriptionAr: staticPanel.descriptionAr,
          icon: staticPanel.icon,
          isAvailable: true,
          topicCount: loadedPanel.topicCount,
        );
      }
      return staticPanel;
    }).toList();
  }

  Widget _buildPanelGrid(
    BuildContext context,
    List<ClinicalPanelData> panels,
    String locale,
    AppLocalizations l10n,
  ) {
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
        return _PanelCard(
          panel: panel,
          locale: locale,
          index: index,
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
              onPressed: () => ref.invalidate(panelsProvider),
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

class _PanelCard extends StatelessWidget {
  final ClinicalPanelData panel;
  final String locale;
  final int index;

  const _PanelCard({
    required this.panel,
    required this.locale,
    required this.index,
  });

  String _getLocalizedName() {
    return locale == 'ar' ? panel.nameAr : panel.name;
  }

  String _getLocalizedDescription() {
    return locale == 'ar' ? panel.descriptionAr : panel.description;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = !panel.isAvailable;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: isDisabled ? null : () => context.push(AppRoutes.topicSelectionPath(panel.id)),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(AppConstants.spacingMD),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      color: isDisabled
                          ? theme.colorScheme.surfaceContainerHighest
                          : theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(AppConstants.radiusMD),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: panel.icon,
                        size: 32.w,
                        color: isDisabled
                            ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                            : theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  AppSpacer.verticalMD,
                  Text(
                    _getLocalizedName(),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDisabled
                          ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                          : theme.colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSpacer.verticalXS,
                  Text(
                    _getLocalizedDescription(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDisabled
                          ? theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4)
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSpacer.verticalSM,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.spacingSM,
                      vertical: AppConstants.spacingXS,
                    ),
                    decoration: BoxDecoration(
                      color: isDisabled
                          ? theme.colorScheme.surfaceContainerHighest
                          : theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                    ),
                    child: Text(
                      isDisabled ? 'Soon' : '${panel.topicCount ?? 0} Topics',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isDisabled
                            ? theme.colorScheme.onSurfaceVariant
                            : theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Soon badge for disabled panels
            if (isDisabled)
              Positioned(
                top: 8,
                right: 8,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HugeIcon(
                      icon: AppIcons.lock,
                      size: 14.w,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Soon',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    ).fadeSlideIn(index: index);
  }
}
