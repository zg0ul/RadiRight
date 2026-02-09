import 'package:flutter/material.dart';
import 'package:radi_right/core/utils/animation_extensions.dart';

/// Wraps a result section with staggered fade + slide animation using flutter_animate.
class ResultAnimatedSection extends StatelessWidget {
  const ResultAnimatedSection({super.key, required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child.fadeSlideIn(index: index, fromBottom: true, duration: const Duration(milliseconds: 400));
  }
}
