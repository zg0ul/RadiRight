import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

enum AppropriatenessLevel {
  usuallyAppropriate,
  mayBeAppropriate,
  usuallyNotAppropriate,
  noImagingIndicated;

  String get displayName => switch (this) {
        AppropriatenessLevel.usuallyAppropriate => 'Usually Appropriate',
        AppropriatenessLevel.mayBeAppropriate => 'May Be Appropriate',
        AppropriatenessLevel.usuallyNotAppropriate => 'Usually Not Appropriate',
        AppropriatenessLevel.noImagingIndicated => 'No Imaging Indicated',
      };

  String get arabicDisplayName => switch (this) {
        AppropriatenessLevel.usuallyAppropriate => 'مناسب عادة',
        AppropriatenessLevel.mayBeAppropriate => 'قد يكون مناسباً',
        AppropriatenessLevel.usuallyNotAppropriate => 'غير مناسب عادة',
        AppropriatenessLevel.noImagingIndicated => 'لا يوجد مؤشر للتصوير',
      };

  Color get color => switch (this) {
        AppropriatenessLevel.usuallyAppropriate => AppColors.usuallyAppropriate,
        AppropriatenessLevel.mayBeAppropriate => AppColors.mayBeAppropriate,
        AppropriatenessLevel.usuallyNotAppropriate =>
          AppColors.usuallyNotAppropriate,
        AppropriatenessLevel.noImagingIndicated => AppColors.noImagingIndicated,
      };

  int get minScore => switch (this) {
        AppropriatenessLevel.usuallyAppropriate => 7,
        AppropriatenessLevel.mayBeAppropriate => 4,
        AppropriatenessLevel.usuallyNotAppropriate => 1,
        AppropriatenessLevel.noImagingIndicated => 0,
      };

  int get maxScore => switch (this) {
        AppropriatenessLevel.usuallyAppropriate => 9,
        AppropriatenessLevel.mayBeAppropriate => 6,
        AppropriatenessLevel.usuallyNotAppropriate => 3,
        AppropriatenessLevel.noImagingIndicated => 0,
      };

  static AppropriatenessLevel fromScore(int score) {
    if (score >= 7) return AppropriatenessLevel.usuallyAppropriate;
    if (score >= 4) return AppropriatenessLevel.mayBeAppropriate;
    if (score >= 1) return AppropriatenessLevel.usuallyNotAppropriate;
    return AppropriatenessLevel.noImagingIndicated;
  }

  static AppropriatenessLevel fromString(String value) {
    return AppropriatenessLevel.values.firstWhere(
      (level) =>
          level.name.toLowerCase() == value.toLowerCase() ||
          level.displayName.toLowerCase() == value.toLowerCase(),
      orElse: () => AppropriatenessLevel.noImagingIndicated,
    );
  }
}
