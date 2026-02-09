import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/app/theme/app_theme_extension.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/l10n/app_localizations.dart';

/// Collapsing success header for the result screen.
/// Returns a [SliverAppBar] that collapses from a full header
/// (icon + title + subtitle) into a compact bar (just the title).
class ResultSuccessHeader extends StatelessWidget {
  const ResultSuccessHeader({super.key, required this.appTheme});

  final AppThemeExtension appTheme;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240.h,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      flexibleSpace: _SliverHeaderContent(appTheme: appTheme),
    );
  }
}

class _SliverHeaderContent extends StatelessWidget {
  const _SliverHeaderContent({required this.appTheme});

  final AppThemeExtension appTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final topPadding = MediaQuery.of(context).padding.top;

    return LayoutBuilder(
      builder: (context, constraints) {
        final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();

        final double expandRatio;
        if (settings != null) {
          final deltaExtent = settings.maxExtent - settings.minExtent;
          expandRatio = deltaExtent > 0
              ? ((settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0)
              : 1.0;
        } else {
          expandRatio = 1.0;
        }

        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: appTheme.successGradient,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppConstants.radiusXL * expandRatio),
              bottomRight: Radius.circular(AppConstants.radiusXL * expandRatio),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon circle — fades + shrinks on collapse
                Opacity(
                  opacity: expandRatio,
                  child: Align(
                    heightFactor: expandRatio,
                    child: Container(
                      width: AppConstants.iconXXL * 1.25,
                      height: AppConstants.iconXXL * 1.25,
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
                      child: Center(
                        child: HugeIcon(icon: AppIcons.checkCircle, size: AppConstants.iconXL, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // Gap — shrinks on collapse
                SizedBox(height: AppConstants.spacingMD * expandRatio),

                // Title — always visible, font size interpolates
                Text(
                  l10n.recommendationFound,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: (16 + 6 * expandRatio).sp,
                  ),
                ),

                // Gap — shrinks on collapse
                SizedBox(height: AppConstants.spacingXS * expandRatio),

                // Subtitle — fades + shrinks on collapse
                Opacity(
                  opacity: expandRatio,
                  child: Align(
                    heightFactor: expandRatio,
                    child: Text(
                      l10n.resultBasedOnAcr,
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.9)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
