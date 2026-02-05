import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/animation_constants.dart';

/// Animation extension methods for consistent motion design
extension AnimateWidgetExtensions on Widget {
  /// Fade and slide in from bottom (default) or top
  Widget fadeSlideIn({
    int index = 0,
    bool fromBottom = true,
    Duration? duration,
    Duration? delay,
    Curve? curve,
  }) {
    final staggerDelay = AnimationConstants.staggerDelayNormal * index;
    return animate(
      delay: delay ?? staggerDelay,
    )
        .fadeIn(
          duration: duration ?? AnimationConstants.durationNormal,
          curve: curve ?? AnimationConstants.curveDefault,
        )
        .slideY(
          begin: fromBottom ? 0.1 : -0.1,
          end: 0,
          duration: duration ?? AnimationConstants.durationNormal,
          curve: curve ?? AnimationConstants.curveDefault,
        );
  }

  /// Slide in horizontally (left to right by default)
  Widget slideInHorizontal({
    int index = 0,
    bool fromLeft = true,
    Duration? duration,
    Duration? delay,
    Curve? curve,
  }) {
    final staggerDelay = AnimationConstants.staggerDelayNormal * index;
    return animate(
      delay: delay ?? staggerDelay,
    )
        .fadeIn(
          duration: duration ?? AnimationConstants.durationNormal,
          curve: curve ?? AnimationConstants.curveDefault,
        )
        .slideX(
          begin: fromLeft ? -0.1 : 0.1,
          end: 0,
          duration: duration ?? AnimationConstants.durationNormal,
          curve: curve ?? AnimationConstants.curveDefault,
        );
  }

  /// Scale in animation (great for icons and cards)
  Widget scaleIn({
    int index = 0,
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double begin = 0.8,
  }) {
    final staggerDelay = AnimationConstants.staggerDelayNormal * index;
    return animate(
      delay: delay ?? staggerDelay,
    )
        .fadeIn(
          duration: duration ?? AnimationConstants.durationNormal,
          curve: curve ?? AnimationConstants.curveDefault,
        )
        .scale(
          begin: Offset(begin, begin),
          end: const Offset(1, 1),
          duration: duration ?? AnimationConstants.durationNormal,
          curve: curve ?? AnimationConstants.curveDefault,
        );
  }

  /// Subtle pulse animation (for call-to-action elements)
  Widget pulseOnIdle({
    Duration? duration,
    double scale = 1.03,
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    ).scale(
      begin: const Offset(1, 1),
      end: Offset(scale, scale),
      duration: duration ?? const Duration(milliseconds: 1500),
      curve: Curves.easeInOut,
    );
  }

  /// Shimmer effect for loading states
  Widget shimmer({
    Duration? duration,
    Color? color,
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(),
    ).shimmer(
      duration: duration ?? const Duration(milliseconds: 1500),
      color: color ?? Colors.white.withValues(alpha: 0.3),
    );
  }

  /// Bounce in animation
  Widget bounceIn({
    int index = 0,
    Duration? duration,
    Duration? delay,
  }) {
    final staggerDelay = AnimationConstants.staggerDelayNormal * index;
    return animate(
      delay: delay ?? staggerDelay,
    )
        .fadeIn(
          duration: duration ?? AnimationConstants.durationNormal,
        )
        .scale(
          begin: const Offset(0.5, 0.5),
          end: const Offset(1, 1),
          duration: duration ?? AnimationConstants.durationNormal,
          curve: AnimationConstants.curveElastic,
        );
  }

  /// Flip animation for cards
  Widget flipIn({
    int index = 0,
    Duration? duration,
    Duration? delay,
    bool horizontal = true,
  }) {
    final staggerDelay = AnimationConstants.staggerDelayNormal * index;
    return animate(
      delay: delay ?? staggerDelay,
    )
        .fadeIn(
          duration: duration ?? AnimationConstants.durationNormal,
        )
        .rotate(
          begin: horizontal ? 0.1 : 0,
          end: 0,
          duration: duration ?? AnimationConstants.durationNormal,
          curve: AnimationConstants.curveDefault,
        );
  }
}

/// List animation helper
extension AnimateListExtensions on List<Widget> {
  /// Apply staggered fadeSlideIn animation to all items
  List<Widget> animateStaggered({
    bool fromBottom = true,
    Duration? duration,
    Duration? baseDelay,
  }) {
    return asMap().entries.map((entry) {
      return entry.value.fadeSlideIn(
        index: entry.key,
        fromBottom: fromBottom,
        duration: duration,
        delay: baseDelay,
      );
    }).toList();
  }

  /// Apply staggered horizontal slide animation to all items
  List<Widget> animateHorizontalStaggered({
    bool fromLeft = true,
    Duration? duration,
    Duration? baseDelay,
  }) {
    return asMap().entries.map((entry) {
      return entry.value.slideInHorizontal(
        index: entry.key,
        fromLeft: fromLeft,
        duration: duration,
        delay: baseDelay,
      );
    }).toList();
  }
}
