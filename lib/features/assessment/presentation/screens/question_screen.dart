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
import '../../../../shared/widgets/glassmorphism_card.dart';
import '../../domain/models/decision_node.dart';
import '../../domain/services/decision_engine.dart';
import '../providers/assessment_provider.dart';

class QuestionScreen extends HookConsumerWidget {
  final String topicId;

  const QuestionScreen({super.key, required this.topicId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeNotifierProvider).languageCode;
    final engineState = ref.watch(decisionEngineProvider);
    final assessmentState = ref.watch(currentAssessmentProvider);

    // Track if analyzing overlay has been shown
    final analyzingShown = useState(false);

    // Track the current question key for animations
    final previousQuestionKey = useState<String?>(null);

    // Initialize assessment when screen loads
    useEffect(() {
      Future.microtask(() {
        if (!assessmentState.isActive && !assessmentState.isLoading) {
          ref.read(currentAssessmentProvider.notifier).startAssessment(topicId);
        }
      });
      return null;
    }, [topicId]);

    // Loading state while starting assessment
    if (assessmentState.isLoading) {
      return _buildLoadingState(context, l10n);
    }

    // Error state
    if (assessmentState.error != null) {
      return _buildErrorState(context, l10n, assessmentState.error!);
    }

    // Assessment not active
    if (engineState == null || !assessmentState.isActive) {
      return _buildInitializingState(context, l10n);
    }

    // Assessment complete - show analyzing then navigate
    if (engineState.isComplete) {
      if (!analyzingShown.value) {
        analyzingShown.value = true;
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (context.mounted) {
            context.go(AppRoutes.result);
          }
        });
      }
      return _buildAnalyzingState(context, l10n);
    }

    final currentNode = engineState.currentNode;
    if (currentNode is! QuestionNode) {
      return _buildLoadingState(context, l10n);
    }

    // Track question change for animation
    final currentQuestionKey = currentNode.id;
    final isNewQuestion = previousQuestionKey.value != currentQuestionKey;
    if (isNewQuestion) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        previousQuestionKey.value = currentQuestionKey;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, assessmentState.topicName ?? l10n.question, ref, l10n),
            _AnimatedProgressSection(
              engineState: engineState,
              l10n: l10n,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppConstants.spacingMD),
                child: _AnimatedQuestionCard(
                  key: ValueKey(currentQuestionKey),
                  node: currentNode,
                  locale: locale,
                  ref: ref,
                  l10n: l10n,
                ),
              ),
            ),
            _buildFooter(context, engineState, ref, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    String title,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingMD,
        vertical: AppConstants.spacingSM,
      ),
      child: Row(
        children: [
          IconButton(
            icon: HugeIcon(
              icon: AppIcons.close,
              size: AppConstants.iconMD,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () => _showExitDialog(context, ref, l10n),
          ),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 48.w), // Balance the close button
        ],
      ),
    );
  }

  Widget _buildFooter(
    BuildContext context,
    DecisionEngineState engineState,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (engineState.canGoBack)
            OutlinedButton.icon(
              onPressed: () => ref.read(decisionEngineProvider.notifier).goBack(),
              icon: HugeIcon(
                icon: AppIcons.back,
                size: AppConstants.iconSM,
                color: theme.colorScheme.primary,
              ),
              label: Text(l10n.back),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(120.w, AppConstants.buttonHeightMD),
              ),
            )
          else
            SizedBox(width: 120.w),
          OutlinedButton.icon(
            onPressed: () {
              ref.read(currentAssessmentProvider.notifier).reset();
              context.go(AppRoutes.home);
            },
            icon: HugeIcon(
              icon: AppIcons.home,
              size: AppConstants.iconSM,
              color: theme.colorScheme.primary,
            ),
            label: Text(l10n.home),
            style: OutlinedButton.styleFrom(
              minimumSize: Size(120.w, AppConstants.buttonHeightMD),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            AppSpacer.verticalMD,
            Text(
              l10n.preparingAssessment,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitializingState(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            AppSpacer.verticalMD,
            Text(
              l10n.preparingAssessment,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, AppLocalizations l10n, String error) {
    final theme = Theme.of(context);
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
        title: Text(l10n.question),
      ),
      body: Center(
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
                l10n.somethingWentWrong,
                style: theme.textTheme.titleMedium,
              ),
              AppSpacer.verticalSM,
              Text(
                error,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacer.verticalLG,
              ElevatedButton.icon(
                onPressed: () => context.go(AppRoutes.home),
                icon: HugeIcon(
                  icon: AppIcons.home,
                  size: AppConstants.iconSM,
                  color: theme.colorScheme.onPrimary,
                ),
                label: Text(l10n.home),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnalyzingState(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: GlassmorphismCard(
          padding: EdgeInsets.all(AppConstants.spacingXL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.primary,
                    ),
                  );
                },
              ),
              AppSpacer.verticalLG,
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: Text(
                        l10n.analyzingResponses,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              AppSpacer.verticalSM,
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: Text(
                        l10n.analyzingResponsesSubtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.cancel),
        content: const Text('Are you sure you want to exit? Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.no),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              ref.read(currentAssessmentProvider.notifier).reset();
              context.go(AppRoutes.home);
            },
            child: Text(l10n.yes),
          ),
        ],
      ),
    );
  }
}

/// Animated progress section with smooth transitions
class _AnimatedProgressSection extends StatelessWidget {
  final DecisionEngineState engineState;
  final AppLocalizations l10n;

  const _AnimatedProgressSection({
    required this.engineState,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final questionNumber = engineState.questionNumber;
    final estimatedTotal = 10;
    final progress = (questionNumber / estimatedTotal).clamp(0.0, 0.95);
    final percentage = (progress * 100).toInt();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${l10n.question} $questionNumber',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: percentage),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Text(
                    '$value%',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  );
                },
              ),
            ],
          ),
          AppSpacer.verticalSM,
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.radiusFull),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: progress),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 8.h,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
                );
              },
            ),
          ),
          AppSpacer.verticalMD,
        ],
      ),
    );
  }
}

/// Animated question card with smooth transitions
class _AnimatedQuestionCard extends StatefulWidget {
  final QuestionNode node;
  final String locale;
  final WidgetRef ref;
  final AppLocalizations l10n;

  const _AnimatedQuestionCard({
    super.key,
    required this.node,
    required this.locale,
    required this.ref,
    required this.l10n,
  });

  @override
  State<_AnimatedQuestionCard> createState() => _AnimatedQuestionCardState();
}

class _AnimatedQuestionCardState extends State<_AnimatedQuestionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

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
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Card(
            elevation: AppConstants.elevationMD,
            child: Padding(
              padding: EdgeInsets.all(AppConstants.spacingLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HugeIcon(
                    icon: AppIcons.question,
                    size: AppConstants.iconXL,
                    color: theme.colorScheme.primary,
                  ),
                  AppSpacer.verticalMD,
                  Text(
                    widget.node.getLocalizedQuestionText(widget.locale),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (widget.node.getLocalizedHint(widget.locale) != null) ...[
                    AppSpacer.verticalMD,
                    Container(
                      padding: EdgeInsets.all(AppConstants.spacingMD),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HugeIcon(
                            icon: AppIcons.info,
                            size: AppConstants.iconSM,
                            color: theme.colorScheme.primary,
                          ),
                          AppSpacer.horizontalSM,
                          Expanded(
                            child: Text(
                              widget.node.getLocalizedHint(widget.locale)!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  AppSpacer.verticalLG,
                  ...widget.node.options.asMap().entries.map((entry) {
                    final index = entry.key;
                    final option = entry.value;
                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 300 + (index * 80)),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 20 * (1 - value)),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: AppConstants.spacingSM),
                              child: _AnswerButton(
                                text: option.getLocalizedText(widget.locale),
                                onTap: () {
                                  widget.ref
                                      .read(decisionEngineProvider.notifier)
                                      .selectAnswer(option, widget.locale);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnswerButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _AnswerButton({
    required this.text,
    required this.onTap,
  });

  @override
  State<_AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<_AnswerButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        transform: Matrix4.diagonal3Values(_isPressed ? 0.98 : 1.0, _isPressed ? 0.98 : 1.0, 1.0),
        child: Container(
          width: double.infinity,
          height: AppConstants.buttonHeightLG,
          decoration: BoxDecoration(
            border: Border.all(
              color: _isPressed
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline,
              width: _isPressed ? 2.0 : 1.5,
            ),
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            color: _isPressed
                ? theme.colorScheme.primary.withValues(alpha: 0.1)
                : Colors.transparent,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.spacingMD,
                vertical: AppConstants.spacingSM,
              ),
              child: Text(
                widget.text,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: _isPressed
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
