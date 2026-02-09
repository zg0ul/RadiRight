import 'package:flutter/material.dart';
import 'package:radi_right/core/constants/app_constants.dart';

/// Shared surface container with outline and drop shadow for result screen sections.
/// Matches the style used in question_card and topic_card.
class ResultSectionContainer extends StatelessWidget {
  const ResultSectionContainer({super.key, required this.child, this.clipBehavior = Clip.none});

  final Widget child;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppConstants.radiusLG),
        border: Border.all(color: theme.colorScheme.outlineVariant, width: 1.5),
        boxShadow: [
          BoxShadow(color: theme.colorScheme.shadow.withValues(alpha: 0.25), blurRadius: 20, offset: Offset.zero),
        ],
      ),
      clipBehavior: clipBehavior,
      child: child,
    );
  }
}
