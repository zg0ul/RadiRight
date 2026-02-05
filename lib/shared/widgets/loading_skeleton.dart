import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_constants.dart';

/// A shimmer loading skeleton widget
class LoadingSkeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;

  const LoadingSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.margin,
  });

  /// Creates a circular skeleton (for avatars)
  factory LoadingSkeleton.circular({
    Key? key,
    required double size,
    EdgeInsetsGeometry? margin,
  }) {
    return LoadingSkeleton(
      key: key,
      width: size,
      height: size,
      borderRadius: size / 2,
      margin: margin,
    );
  }

  /// Creates a text-line skeleton
  factory LoadingSkeleton.text({
    Key? key,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
  }) {
    return LoadingSkeleton(
      key: key,
      width: width,
      height: height ?? 16,
      borderRadius: 4,
      margin: margin,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final baseColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.grey.shade300;

    final highlightColor = isDark
        ? Colors.white.withValues(alpha: 0.2)
        : Colors.grey.shade100;

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppConstants.radiusSM,
        ),
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          duration: const Duration(milliseconds: 1500),
          color: highlightColor,
        );
  }
}

/// A card skeleton for loading states
class CardSkeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const CardSkeleton({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: width,
      height: height ?? 120.h,
      margin: margin ?? EdgeInsets.only(bottom: AppConstants.spacingMD),
      padding: padding ?? EdgeInsets.all(AppConstants.spacingMD),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              LoadingSkeleton.circular(size: 48.w),
              SizedBox(width: AppConstants.spacingMD),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoadingSkeleton.text(width: 150.w),
                    SizedBox(height: AppConstants.spacingSM),
                    LoadingSkeleton.text(width: 100.w),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.spacingMD),
          LoadingSkeleton.text(width: double.infinity),
          SizedBox(height: AppConstants.spacingSM),
          LoadingSkeleton.text(width: 200.w),
        ],
      ),
    );
  }
}

/// List skeleton for loading states
class ListSkeleton extends StatelessWidget {
  final int itemCount;
  final double? itemHeight;
  final EdgeInsetsGeometry? padding;

  const ListSkeleton({
    super.key,
    this.itemCount = 5,
    this.itemHeight,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(AppConstants.spacingMD),
      child: Column(
        children: List.generate(
          itemCount,
          (index) => CardSkeleton(
            height: itemHeight,
          ),
        ),
      ),
    );
  }
}
