import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/services/haptic_service.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/features/assessment/domain/models/topic.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class TopicCard extends HookConsumerWidget {
  const TopicCard({
    super.key,
    required this.topic,
    required this.locale,
    required this.index,
    required this.shouldAnimate,
  });

  final Topic topic;
  final String locale;
  final int index;
  final bool shouldAnimate;

  void _onTap(BuildContext context, WidgetRef ref) {
    ref.read(hapticServiceProvider).light();
    context.push(AppRoutes.questionPath(topic.id));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final icon = topic.getIcon();
    final questionCount = topic.questionCount;

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 400),
      initialValue: shouldAnimate ? 0.0 : 1.0,
    );

    final slideAnimation = useMemoized(
      () => Tween<Offset>(
        begin: const Offset(-0.1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOutCubic)),
      [animationController],
    );

    final fadeAnimation = useMemoized(
      () => Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut)),
      [animationController],
    );

    useEffect(() {
      if (shouldAnimate) {
        // Stagger animation based on index
        Future.delayed(Duration(milliseconds: 50 * index), () {
          if (animationController.isAnimating == false) {
            animationController.forward();
          }
        });
      }
      return null;
    }, [shouldAnimate]);

    final card = InkWell(
      onTap: () => _onTap(context, ref),
      borderRadius: BorderRadius.circular(AppConstants.radiusLG),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          border: Border.all(color: theme.colorScheme.outlineVariant, width: 1),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(AppConstants.radiusLG),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.spacingMD),
          child: Row(
            children: [
              Container(
                width: AppConstants.iconXL,
                height: AppConstants.iconXL,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppConstants.radiusMD),
                ),
                child: Center(
                  child: HugeIcon(icon: icon, size: AppConstants.iconLG, color: theme.colorScheme.primary),
                ),
              ),
              AppSpacer.horizontalMD,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.getLocalizedName(locale),
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    if (questionCount != null && questionCount > 0) ...[
                      AppSpacer.verticalXS,
                      Text(
                        l10n.questionsCount(questionCount),
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ],
                ),
              ),
              AppSpacer.horizontalSM,
              HugeIcon(icon: AppIcons.chevronRight, size: AppConstants.iconMD, color: theme.colorScheme.primary),
            ],
          ),
        ),
      ),
    );

    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(position: slideAnimation, child: card),
    );
  }
}
