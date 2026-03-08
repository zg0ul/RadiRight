import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/features/assessment/domain/enums/modality_match_result.dart';
import 'package:radi_right/l10n/app_localizations.dart';

/// Collapsing header for the result screen that changes color based on
/// the modality match result (indicated, may be appropriate, not indicated).
class ResultMatchHeader extends StatelessWidget {
  const ResultMatchHeader({
    super.key,
    required this.matchResult,
  });

  final ModalityMatchResult matchResult;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240.h,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      flexibleSpace: _SliverHeaderContent(matchResult: matchResult),
    );
  }
}

class _SliverHeaderContent extends StatelessWidget {
  const _SliverHeaderContent({required this.matchResult});

  final ModalityMatchResult matchResult;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final topPadding = MediaQuery.of(context).padding.top;

    return LayoutBuilder(
      builder: (context, constraints) {
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();

        final double expandRatio;
        if (settings != null) {
          final deltaExtent = settings.maxExtent - settings.minExtent;
          expandRatio = deltaExtent > 0
              ? ((settings.currentExtent - settings.minExtent) / deltaExtent)
                  .clamp(0.0, 1.0)
              : 1.0;
        } else {
          expandRatio = 1.0;
        }

        // Get the appropriate gradient and icon based on match result
        final gradientColors = matchResult.gradientColors;
        final icon = _getIcon();
        final title = _getTitle(l10n);
        final subtitle = _getSubtitle(l10n);

        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
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
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: HugeIcon(
                          icon: icon,
                          size: AppConstants.iconXL,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                // Gap — shrinks on collapse
                SizedBox(height: AppConstants.spacingMD * expandRatio),

                // Title row with optional emoji
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (matchResult == ModalityMatchResult.notIndicated)
                      const Text('❌ ', style: TextStyle(fontSize: 20)),
                    if (matchResult == ModalityMatchResult.indicated)
                      const Text('✓ ', style: TextStyle(fontSize: 20)),
                    Flexible(
                      child: Text(
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: (16 + 6 * expandRatio).sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),

                // Gap — shrinks on collapse
                SizedBox(height: AppConstants.spacingXS * expandRatio),

                // Subtitle — fades + shrinks on collapse
                Opacity(
                  opacity: expandRatio,
                  child: Align(
                    heightFactor: expandRatio,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.spacingMD,
                      ),
                      child: Text(
                        subtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                        textAlign: TextAlign.center,
                      ),
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

  List<List<dynamic>> _getIcon() {
    return switch (matchResult) {
      ModalityMatchResult.indicated => AppIcons.checkCircle,
      ModalityMatchResult.mayBeAppropriate => AppIcons.info,
      ModalityMatchResult.notIndicated => AppIcons.close,
      ModalityMatchResult.noGuidelines => AppIcons.recommendation,
    };
  }

  String _getTitle(AppLocalizations l10n) {
    return switch (matchResult) {
      ModalityMatchResult.indicated => l10n.trueImagingIndicated,
      ModalityMatchResult.mayBeAppropriate => l10n.mayBeAppropriateTitle,
      ModalityMatchResult.notIndicated => l10n.falseImagingNotIndicated,
      ModalityMatchResult.noGuidelines => l10n.noCurrentGuidelines,
    };
  }

  String _getSubtitle(AppLocalizations l10n) {
    return switch (matchResult) {
      ModalityMatchResult.indicated => l10n.yourChoiceIsIndicated,
      ModalityMatchResult.mayBeAppropriate => l10n.yourChoiceMayBeAppropriate,
      ModalityMatchResult.notIndicated => l10n.yourChoiceNotIndicated,
      ModalityMatchResult.noGuidelines => l10n.scenarioNotCoveredByGuidelines,
    };
  }
}
