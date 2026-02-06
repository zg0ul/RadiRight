import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/features/assessment/domain/enums/radiation_level.dart';
import 'package:radi_right/l10n/app_localizations.dart';

import '../../../../app/routing/routes.dart';
import '../../../../app/theme/app_theme_extension.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/utils/app_spacer.dart';
import '../../domain/models/assessment_result.dart';
import '../../domain/models/decision_node.dart';
import '../../domain/models/imaging_recommendation.dart';
import '../../domain/services/decision_engine.dart';
import '../providers/assessment_provider.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final appTheme = context.appTheme;
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final engineState = ref.watch(decisionEngineProvider);

    if (engineState == null || !engineState.isComplete) {
      return _buildErrorState(context, l10n, ref);
    }

    final recommendations = engineState.recommendations;
    final resultNode = engineState.currentNode is ResultNode ? engineState.currentNode as ResultNode : null;
    final summary = resultNode != null ? (locale == 'ar' ? resultNode.summaryAr : resultNode.summary) : null;

    final primary = _primaryRecommendation(recommendations);
    final alternatives = recommendations.where((r) => r != primary).toList();
    final scenarioText = _buildClinicalScenario(engineState.answerHistory);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _AnimatedSuccessHeader(appTheme: appTheme),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(AppConstants.spacingMD),
                      child: Column(
                        children: [
                          if (scenarioText != null && scenarioText.isNotEmpty)
                            _AnimatedCard(
                              index: 0,
                              child: _ClinicalScenarioCard(l10n: l10n, scenarioText: scenarioText),
                            ),
                          AppSpacer.verticalMD,
                          if (primary != null)
                            _AnimatedCard(
                              index: 1,
                              child: _RecommendationCard(
                                l10n: l10n,
                                locale: locale,
                                recommendation: primary,
                                appTheme: appTheme,
                              ),
                            ),
                          if (summary != null && summary.isNotEmpty) ...[
                            AppSpacer.verticalMD,
                            _AnimatedCard(
                              index: 2,
                              child: _SummaryCard(l10n: l10n, summary: summary),
                            ),
                          ],
                          if (alternatives.isNotEmpty) ...[
                            AppSpacer.verticalMD,
                            _AnimatedCard(
                              index: 3,
                              child: _AlternativesCard(
                                l10n: l10n,
                                locale: locale,
                                alternatives: alternatives,
                                appTheme: appTheme,
                              ),
                            ),
                          ],
                          AppSpacer.verticalMD,
                          _AnimatedCard(index: 4, child: _DisclaimerCard(l10n: l10n)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildActionButtons(context, l10n, ref),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, AppLocalizations l10n, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.2))),
      ),
      child: SizedBox(
        width: double.infinity,
        height: AppConstants.buttonHeightLG,
        child: ElevatedButton(
          onPressed: () {
            ref.read(currentAssessmentProvider.notifier).reset();
            context.go(AppRoutes.home);
          },
          child: Text(l10n.startAssessment),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, AppLocalizations l10n, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(icon: AppIcons.close, size: AppConstants.iconMD, color: theme.colorScheme.onSurface),
          onPressed: () {
            ref.read(currentAssessmentProvider.notifier).reset();
            context.go(AppRoutes.home);
          },
        ),
        title: Text(l10n.results),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.spacingLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(icon: AppIcons.error, size: AppConstants.iconXXL, color: theme.colorScheme.error),
              AppSpacer.verticalMD,
              Text(l10n.somethingWentWrong, style: theme.textTheme.titleMedium),
              AppSpacer.verticalLG,
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(currentAssessmentProvider.notifier).reset();
                  context.go(AppRoutes.home);
                },
                icon: HugeIcon(icon: AppIcons.home, size: AppConstants.iconSM, color: theme.colorScheme.onPrimary),
                label: Text(l10n.home),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ImagingRecommendation? _primaryRecommendation(List<ImagingRecommendation> recommendations) {
    if (recommendations.isEmpty) return null;
    final usuallyAppropriate = recommendations.where((r) => r.appropriateness.name == 'usuallyAppropriate').toList();
    if (usuallyAppropriate.isNotEmpty) {
      final byScore = usuallyAppropriate..sort((a, b) => (b.score ?? 0).compareTo(a.score ?? 0));
      return byScore.first;
    }
    final byScore = List<ImagingRecommendation>.from(recommendations)
      ..sort((a, b) => (b.score ?? 0).compareTo(a.score ?? 0));
    return byScore.first;
  }

  String? _buildClinicalScenario(List<AnswerRecord> answerHistory) {
    if (answerHistory.isEmpty) return null;
    final parts = answerHistory.map((a) => '${a.questionText}: ${a.selectedOptionText}').toList();
    return parts.join('\n');
  }
}

/// Animated success header with scale animation
class _AnimatedSuccessHeader extends StatefulWidget {
  final AppThemeExtension appTheme;

  const _AnimatedSuccessHeader({required this.appTheme});

  @override
  State<_AnimatedSuccessHeader> createState() => _AnimatedSuccessHeaderState();
}

class _AnimatedSuccessHeaderState extends State<_AnimatedSuccessHeader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingLG, vertical: AppConstants.spacingXL),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.appTheme.successGradient,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppConstants.radiusXL),
              bottomRight: Radius.circular(AppConstants.radiusXL),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
                child: Center(
                  child: HugeIcon(icon: AppIcons.checkCircle, size: 48.w, color: Colors.white),
                ),
              ),
              AppSpacer.verticalMD,
              Text(
                'Recommendation Found',
                style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              AppSpacer.verticalXS,
              Text(
                'Based on ACR Appropriateness Criteria',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Wrapper for animated cards
class _AnimatedCard extends StatefulWidget {
  final int index;
  final Widget child;

  const _AnimatedCard({required this.index, required this.child});

  @override
  State<_AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<_AnimatedCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(Duration(milliseconds: 100 + (widget.index * 100)), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}

/// Clinical scenario card
class _ClinicalScenarioCard extends StatelessWidget {
  final AppLocalizations l10n;
  final String scenarioText;

  const _ClinicalScenarioCard({required this.l10n, required this.scenarioText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingSM, vertical: AppConstants.spacingXS),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                  ),
                  child: Text(
                    'ACR',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppSpacer.horizontalSM,
                Text(l10n.clinicalScenario, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            AppSpacer.verticalMD,
            Text(
              scenarioText,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

/// Main recommendation card
class _RecommendationCard extends StatelessWidget {
  final AppLocalizations l10n;
  final String locale;
  final ImagingRecommendation recommendation;
  final AppThemeExtension appTheme;

  const _RecommendationCard({
    required this.l10n,
    required this.locale,
    required this.recommendation,
    required this.appTheme,
  });

  Color _getAppropriatenessColor(String appropriateness) {
    switch (appropriateness) {
      case 'usuallyAppropriate':
        return appTheme.usuallyAppropriate;
      case 'mayBeAppropriate':
        return appTheme.mayBeAppropriate;
      case 'usuallyNotAppropriate':
        return appTheme.usuallyNotAppropriate;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appropriatenessColor = _getAppropriatenessColor(recommendation.appropriateness.name);
    final appropriatenessText = locale == 'ar'
        ? recommendation.appropriateness.arabicDisplayName
        : recommendation.appropriateness.displayName;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.recommendedImagingStudy,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            AppSpacer.verticalMD,
            Text(
              recommendation.getLocalizedProcedure(locale),
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacer.verticalMD,
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD, vertical: AppConstants.spacingSM),
                    decoration: BoxDecoration(
                      color: appropriatenessColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                      border: Border.all(color: appropriatenessColor.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HugeIcon(
                          icon: recommendation.appropriateness.name == 'usuallyAppropriate'
                              ? AppIcons.checkCircle
                              : recommendation.appropriateness.name == 'mayBeAppropriate'
                              ? AppIcons.info
                              : AppIcons.warning,
                          size: AppConstants.iconSM,
                          color: appropriatenessColor,
                        ),
                        AppSpacer.horizontalSM,
                        Flexible(
                          child: Text(
                            appropriatenessText,
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: appropriatenessColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (recommendation.score != null) ...[
                  AppSpacer.horizontalMD,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD, vertical: AppConstants.spacingSM),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                    ),
                    child: Text(
                      '${recommendation.score}/9',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: appropriatenessColor,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            if (recommendation.radiation != RadiationLevel.none) ...[
              AppSpacer.verticalMD,
              Row(
                children: [
                  HugeIcon(
                    icon: AppIcons.radiation,
                    size: AppConstants.iconSM,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  AppSpacer.horizontalSM,
                  Text(
                    'Radiation: ${recommendation.radiation.displayName}',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Expandable summary card
class _SummaryCard extends StatelessWidget {
  final AppLocalizations l10n;
  final String summary;

  const _SummaryCard({required this.l10n, required this.summary});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ExpansionTile(
        initiallyExpanded: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMD)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMD)),
        title: Row(
          children: [
            HugeIcon(icon: AppIcons.info, size: AppConstants.iconMD, color: theme.colorScheme.primary),
            AppSpacer.horizontalSM,
            Expanded(
              child: Text(
                'Why this recommendation?',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(AppConstants.spacingMD, 0, AppConstants.spacingMD, AppConstants.spacingMD),
            child: Text(
              summary,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

/// Alternative imaging options card
class _AlternativesCard extends StatelessWidget {
  final AppLocalizations l10n;
  final String locale;
  final List<ImagingRecommendation> alternatives;
  final AppThemeExtension appTheme;

  const _AlternativesCard({
    required this.l10n,
    required this.locale,
    required this.alternatives,
    required this.appTheme,
  });

  Color _getAppropriatenessColor(String appropriateness) {
    switch (appropriateness) {
      case 'usuallyAppropriate':
        return appTheme.usuallyAppropriate;
      case 'mayBeAppropriate':
        return appTheme.mayBeAppropriate;
      case 'usuallyNotAppropriate':
        return appTheme.usuallyNotAppropriate;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.alternativeImagingOptions,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            AppSpacer.verticalMD,
            ...alternatives.map((rec) {
              final color = _getAppropriatenessColor(rec.appropriateness.name);
              return Padding(
                padding: EdgeInsets.only(bottom: AppConstants.spacingSM),
                child: Container(
                  padding: EdgeInsets.all(AppConstants.spacingSM),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rec.getLocalizedProcedure(locale),
                              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            AppSpacer.verticalXS,
                            Text(
                              rec.getLocalizedModality(locale),
                              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                      if (rec.score != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.spacingSM,
                            vertical: AppConstants.spacingXS,
                          ),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(AppConstants.radiusSM),
                          ),
                          child: Text(
                            '${rec.score}/9',
                            style: theme.textTheme.labelLarge?.copyWith(color: color, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

/// Clinical judgment disclaimer card
class _DisclaimerCard extends StatelessWidget {
  final AppLocalizations l10n;

  const _DisclaimerCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.spacingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HugeIcon(icon: AppIcons.warning, size: AppConstants.iconSM, color: theme.colorScheme.onSurfaceVariant),
                AppSpacer.horizontalSM,
                Text(l10n.clinicalJudgment, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            AppSpacer.verticalSM,
            Text(
              l10n.clinicalJudgmentDisclaimer,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
