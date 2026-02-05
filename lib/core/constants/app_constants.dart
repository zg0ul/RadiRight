import 'package:flutter_screenutil/flutter_screenutil.dart';

/// App-wide constants following 8dp grid system
class AppConstants {
  AppConstants._();

  // Design System Base
  static const double designWidth = 430;
  static const double designHeight = 932;

  // Spacing (8dp grid)
  static double get spacingXS => 4.w;
  static double get spacingSM => 8.w;
  static double get spacingMD => 16.w;
  static double get spacingLG => 24.w;
  static double get spacingXL => 32.w;
  static double get spacingXXL => 48.w;

  // Border Radius
  static double get radiusXS => 4.r;
  static double get radiusSM => 8.r;
  static double get radiusMD => 12.r;
  static double get radiusLG => 16.r;
  static double get radiusXL => 24.r;
  static double get radiusFull => 999.r;

  // Icon Sizes
  static double get iconXS => 16.w;
  static double get iconSM => 20.w;
  static double get iconMD => 24.w;
  static double get iconLG => 32.w;
  static double get iconXL => 48.w;
  static double get iconXXL => 64.w;

  // Button Heights
  static double get buttonHeightSM => 40.h;
  static double get buttonHeightMD => 48.h;
  static double get buttonHeightLG => 56.h;

  // Card Elevation
  static const double elevationNone = 0;
  static const double elevationSM = 2;
  static const double elevationMD = 4;
  static const double elevationLG = 8;

  // Touch Targets (minimum 48x48 for accessibility)
  static double get minTouchTarget => 48.w;

  // Content Max Width (for tablets)
  static double get maxContentWidth => 600.w;

  // Glassmorphism
  static const double glassBlur = 10.0;
  static const double glassOpacity = 0.1;
  static const double glassBorderOpacity = 0.2;
}
