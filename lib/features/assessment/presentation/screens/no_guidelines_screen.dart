import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/providers/locale_provider.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/services/decision_engine.dart';
import 'package:radi_right/features/assessment/presentation/providers/assessment_provider.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class NoGuidelinesScreen extends ConsumerWidget {
  const NoGuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final engineState = ref.watch(decisionEngineProvider);

    final selectedModality = engineState?.selectedModality;
    final modalityName = selectedModality?.getLocalizedName(locale) ?? '';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withValues(alpha: 0.8),
            ],
            stops: const [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header section with icon
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius:
                              BorderRadius.circular(AppConstants.radiusMD),
                        ),
                        child: Center(
                          child: HugeIcon(
                            icon: AppIcons.recommendation,
                            size: 48,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      AppSpacer.verticalMD,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('🤖 ', style: TextStyle(fontSize: 24)),
                          Text(
                            l10n.noCurrentGuidelines,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Content section
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppConstants.radiusXL),
                      topRight: Radius.circular(AppConstants.radiusXL),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(AppConstants.spacingLG),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Your Selection card
                        _buildSelectionCard(context, theme, l10n, modalityName),
                        AppSpacer.verticalLG,
                        // AI Clinical Assessment card
                        _buildAiAssessmentCard(context, theme, l10n),
                        AppSpacer.verticalLG,
                        // Disclaimer
                        _buildDisclaimerCard(context, theme, l10n),
                        AppSpacer.verticalXL,
                        // Start New Assessment button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              ref
                                  .read(currentAssessmentProvider.notifier)
                                  .reset();
                              context.go(AppRoutes.modalitySelection);
                            },
                            icon: const Icon(Icons.refresh),
                            label: Text(l10n.startNewAssessment),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: theme.colorScheme.onPrimary,
                              padding: EdgeInsets.symmetric(
                                vertical: AppConstants.spacingMD,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppConstants.radiusMD,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionCard(
    BuildContext context,
    ThemeData theme,
    AppLocalizations l10n,
    String modalityName,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.yourSelection,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          AppSpacer.verticalXS,
          Text(
            modalityName,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiAssessmentCard(
    BuildContext context,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HugeIcon(
                icon: AppIcons.recommendation,
                size: AppConstants.iconMD,
                color: theme.colorScheme.primary,
              ),
              AppSpacer.horizontalSM,
              Text(
                l10n.aiClinicalAssessment,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AppSpacer.verticalSM,
          Text(
            l10n.scenarioNotCoveredByGuidelines,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          AppSpacer.verticalMD,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppConstants.spacingMD),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppConstants.radiusSM),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.aiWouldAssess,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpacer.verticalSM,
                _buildBulletPoint(theme, l10n.aiAssessItem1),
                _buildBulletPoint(theme, l10n.aiAssessItem2),
                _buildBulletPoint(theme, l10n.aiAssessItem3),
                _buildBulletPoint(theme, l10n.aiAssessItem4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(ThemeData theme, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.spacingXS),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimerCard(
    BuildContext context,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        border: Border.all(
          color: theme.colorScheme.tertiary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HugeIcon(
            icon: AppIcons.warning,
            size: AppConstants.iconSM,
            color: theme.colorScheme.tertiary,
          ),
          AppSpacer.horizontalSM,
          Expanded(
            child: Text(
              l10n.finalDecisionDisclaimer,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
