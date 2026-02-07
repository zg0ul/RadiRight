import 'package:flutter/material.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/utils/animation_extensions.dart';

/// Answer option button with proper text wrapping and tap feedback
class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final int animationIndex;

  const AnswerButton({super.key, required this.text, required this.onTap, this.animationIndex = 0});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        splashColor: theme.colorScheme.primary.withValues(alpha: 0.2),
        highlightColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        splashFactory: NoSplash.splashFactory,
        child: Ink(
          width: double.infinity,
          // height: AppConstants.buttonHeightLG,
          padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD, vertical: AppConstants.spacingXS),
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.outline, width: 1.5),
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            color: theme.colorScheme.surfaceContainerLow,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingSM, vertical: AppConstants.spacingSM),
              child: Text(
                text,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: null,
              ),
            ),
          ),
        ),
      ),
    ).fadeSlideIn(index: animationIndex, duration: const Duration(milliseconds: 350));
  }
}
