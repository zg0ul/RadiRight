import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

enum RadiationLevel {
  none,
  low,
  medium,
  high;

  String get displayName => switch (this) {
        RadiationLevel.none => 'None',
        RadiationLevel.low => 'Low',
        RadiationLevel.medium => 'Medium',
        RadiationLevel.high => 'High',
      };

  String get arabicDisplayName => switch (this) {
        RadiationLevel.none => 'لا يوجد',
        RadiationLevel.low => 'منخفض',
        RadiationLevel.medium => 'متوسط',
        RadiationLevel.high => 'عالي',
      };

  String get symbol => switch (this) {
        RadiationLevel.none => '○',
        RadiationLevel.low => '☢',
        RadiationLevel.medium => '☢☢',
        RadiationLevel.high => '☢☢☢',
      };

  Color get color => switch (this) {
        RadiationLevel.none => AppColors.radiationNone,
        RadiationLevel.low => AppColors.radiationLow,
        RadiationLevel.medium => AppColors.radiationMedium,
        RadiationLevel.high => AppColors.radiationHigh,
      };

  static RadiationLevel fromString(String value) {
    return RadiationLevel.values.firstWhere(
      (level) =>
          level.name.toLowerCase() == value.toLowerCase() ||
          level.displayName.toLowerCase() == value.toLowerCase(),
      orElse: () => RadiationLevel.none,
    );
  }
}
