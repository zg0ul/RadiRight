import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/providers/locale_provider.dart';
import 'package:radi_right/core/utils/animation_extensions.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/features/assessment/domain/enums/imaging_modality.dart';
import 'package:radi_right/features/assessment/presentation/providers/assessment_provider.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class ModalitySelectionScreen extends ConsumerWidget {
  const ModalitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final locale = ref.watch(localeNotifierProvider).languageCode;

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
                      value: 0.25, // Step 1 of 4
                      backgroundColor: theme.colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                    ),
                  ),
                  AppSpacer.horizontalSM,
                  Text(
                    l10n.stepOf(1, 4),
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
                    l10n.selectImagingModality,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacer.verticalXS,
                  Text(
                    l10n.chooseImagingType,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            AppSpacer.verticalLG,
            // Modality list
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.spacingMD,
                  vertical: AppConstants.spacingSM,
                ),
                itemCount: ImagingModality.values.length,
                separatorBuilder: (context, index) => AppSpacer.verticalSM,
                itemBuilder: (context, index) {
                  final modality = ImagingModality.values[index];
                  return _ModalityCard(
                    modality: modality,
                    locale: locale,
                    index: index,
                    onTap: () {
                      ref
                          .read(currentAssessmentProvider.notifier)
                          .selectModality(modality);
                      context.push(AppRoutes.panelSelection);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModalityCard extends StatelessWidget {
  final ImagingModality modality;
  final String locale;
  final int index;
  final VoidCallback onTap;

  const _ModalityCard({
    required this.modality,
    required this.locale,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = modality.getLocalizedName(locale);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.outlineVariant, width: 1),
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        splashColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        highlightColor: theme.colorScheme.primary.withValues(alpha: 0.05),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.spacingMD,
            vertical: AppConstants.spacingMD,
          ),
          child: Row(
            children: [
              // Icon container
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                ),
                child: Center(
                  child: Text(
                    modality.icon,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              AppSpacer.horizontalMD,
              // Modality name
              Expanded(
                child: Text(
                  name,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // Arrow icon
              Icon(
                Icons.chevron_right,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    ).fadeSlideIn(index: index);
  }
}
