import 'package:flutter/material.dart';
import '../../domain/enums/appropriateness_level.dart';

class AppropriatenessIndicator extends StatelessWidget {
  final AppropriatenessLevel level;
  final String locale;
  final bool showLabel;

  const AppropriatenessIndicator({
    super.key,
    required this.level,
    required this.locale,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: level.color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: level.color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: level.color,
              shape: BoxShape.circle,
            ),
          ),
          if (showLabel) ...[
            const SizedBox(width: 6),
            Text(
              locale == 'ar' ? level.arabicDisplayName : level.displayName,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: level.color,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
