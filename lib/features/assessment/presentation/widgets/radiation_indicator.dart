import 'package:flutter/material.dart';
import '../../domain/enums/radiation_level.dart';

class RadiationIndicator extends StatelessWidget {
  final RadiationLevel level;
  final String locale;
  final bool showLabel;

  const RadiationIndicator({
    super.key,
    required this.level,
    required this.locale,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Radiation symbols
        Text(
          level.symbol,
          style: TextStyle(
            color: level.color,
            fontSize: 12,
          ),
        ),
        if (showLabel) ...[
          const SizedBox(width: 4),
          Text(
            locale == 'ar' ? level.arabicDisplayName : level.displayName,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: level.color,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ],
    );
  }
}
