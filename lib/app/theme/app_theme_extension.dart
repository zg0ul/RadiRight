import 'package:flutter/material.dart';
import 'app_color_palette.dart';

/// Custom theme extension for app-specific colors
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color usuallyAppropriate;
  final Color usuallyAppropriateBackground;
  final Color mayBeAppropriate;
  final Color mayBeAppropriateBackground;
  final Color usuallyNotAppropriate;
  final Color usuallyNotAppropriateBackground;

  final Color radiationNone;
  final Color radiationLow;
  final Color radiationMedium;
  final Color radiationHigh;
  final Color radiationVeryHigh;

  final List<Color> primaryGradient;
  final List<Color> successGradient;
  final List<Color> backgroundGradient;

  final Color glassBackground;
  final Color glassBorder;

  const AppThemeExtension({
    required this.usuallyAppropriate,
    required this.usuallyAppropriateBackground,
    required this.mayBeAppropriate,
    required this.mayBeAppropriateBackground,
    required this.usuallyNotAppropriate,
    required this.usuallyNotAppropriateBackground,
    required this.radiationNone,
    required this.radiationLow,
    required this.radiationMedium,
    required this.radiationHigh,
    required this.radiationVeryHigh,
    required this.primaryGradient,
    required this.successGradient,
    required this.backgroundGradient,
    required this.glassBackground,
    required this.glassBorder,
  });

  static const light = AppThemeExtension(
    usuallyAppropriate: AppColorPalette.usuallyAppropriate,
    usuallyAppropriateBackground: AppColorPalette.usuallyAppropriateLight,
    mayBeAppropriate: AppColorPalette.mayBeAppropriate,
    mayBeAppropriateBackground: AppColorPalette.mayBeAppropriateLight,
    usuallyNotAppropriate: AppColorPalette.usuallyNotAppropriate,
    usuallyNotAppropriateBackground: AppColorPalette.usuallyNotAppropriateLight,
    radiationNone: AppColorPalette.radiationNone,
    radiationLow: AppColorPalette.radiationLow,
    radiationMedium: AppColorPalette.radiationMedium,
    radiationHigh: AppColorPalette.radiationHigh,
    radiationVeryHigh: AppColorPalette.radiationVeryHigh,
    primaryGradient: AppColorPalette.primaryGradientLight,
    successGradient: AppColorPalette.successGradient,
    backgroundGradient: AppColorPalette.backgroundGradientLight,
    glassBackground: Color(0xB3FFFFFF), // white with 0.7 alpha
    glassBorder: Color(0xCCFFFFFF), // white with 0.8 alpha
  );

  static const dark = AppThemeExtension(
    usuallyAppropriate: AppColorPalette.usuallyAppropriate,
    usuallyAppropriateBackground: AppColorPalette.usuallyAppropriateDark,
    mayBeAppropriate: AppColorPalette.mayBeAppropriate,
    mayBeAppropriateBackground: AppColorPalette.mayBeAppropriateDark,
    usuallyNotAppropriate: AppColorPalette.usuallyNotAppropriate,
    usuallyNotAppropriateBackground: AppColorPalette.usuallyNotAppropriateDark,
    radiationNone: AppColorPalette.radiationNone,
    radiationLow: AppColorPalette.radiationLow,
    radiationMedium: AppColorPalette.radiationMedium,
    radiationHigh: AppColorPalette.radiationHigh,
    radiationVeryHigh: AppColorPalette.radiationVeryHigh,
    primaryGradient: AppColorPalette.primaryGradientDark,
    successGradient: AppColorPalette.successGradient,
    backgroundGradient: AppColorPalette.backgroundGradientDark,
    glassBackground: Color(0x1AFFFFFF), // white with 0.1 alpha
    glassBorder: Color(0x33FFFFFF), // white with 0.2 alpha
  );

  @override
  AppThemeExtension copyWith({
    Color? usuallyAppropriate,
    Color? usuallyAppropriateBackground,
    Color? mayBeAppropriate,
    Color? mayBeAppropriateBackground,
    Color? usuallyNotAppropriate,
    Color? usuallyNotAppropriateBackground,
    Color? radiationNone,
    Color? radiationLow,
    Color? radiationMedium,
    Color? radiationHigh,
    Color? radiationVeryHigh,
    List<Color>? primaryGradient,
    List<Color>? successGradient,
    List<Color>? backgroundGradient,
    Color? glassBackground,
    Color? glassBorder,
  }) {
    return AppThemeExtension(
      usuallyAppropriate: usuallyAppropriate ?? this.usuallyAppropriate,
      usuallyAppropriateBackground:
          usuallyAppropriateBackground ?? this.usuallyAppropriateBackground,
      mayBeAppropriate: mayBeAppropriate ?? this.mayBeAppropriate,
      mayBeAppropriateBackground:
          mayBeAppropriateBackground ?? this.mayBeAppropriateBackground,
      usuallyNotAppropriate:
          usuallyNotAppropriate ?? this.usuallyNotAppropriate,
      usuallyNotAppropriateBackground:
          usuallyNotAppropriateBackground ?? this.usuallyNotAppropriateBackground,
      radiationNone: radiationNone ?? this.radiationNone,
      radiationLow: radiationLow ?? this.radiationLow,
      radiationMedium: radiationMedium ?? this.radiationMedium,
      radiationHigh: radiationHigh ?? this.radiationHigh,
      radiationVeryHigh: radiationVeryHigh ?? this.radiationVeryHigh,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      successGradient: successGradient ?? this.successGradient,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      glassBackground: glassBackground ?? this.glassBackground,
      glassBorder: glassBorder ?? this.glassBorder,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      usuallyAppropriate:
          Color.lerp(usuallyAppropriate, other.usuallyAppropriate, t)!,
      usuallyAppropriateBackground: Color.lerp(
          usuallyAppropriateBackground, other.usuallyAppropriateBackground, t)!,
      mayBeAppropriate:
          Color.lerp(mayBeAppropriate, other.mayBeAppropriate, t)!,
      mayBeAppropriateBackground: Color.lerp(
          mayBeAppropriateBackground, other.mayBeAppropriateBackground, t)!,
      usuallyNotAppropriate:
          Color.lerp(usuallyNotAppropriate, other.usuallyNotAppropriate, t)!,
      usuallyNotAppropriateBackground: Color.lerp(usuallyNotAppropriateBackground,
          other.usuallyNotAppropriateBackground, t)!,
      radiationNone: Color.lerp(radiationNone, other.radiationNone, t)!,
      radiationLow: Color.lerp(radiationLow, other.radiationLow, t)!,
      radiationMedium: Color.lerp(radiationMedium, other.radiationMedium, t)!,
      radiationHigh: Color.lerp(radiationHigh, other.radiationHigh, t)!,
      radiationVeryHigh:
          Color.lerp(radiationVeryHigh, other.radiationVeryHigh, t)!,
      primaryGradient: _lerpGradient(primaryGradient, other.primaryGradient, t),
      successGradient: _lerpGradient(successGradient, other.successGradient, t),
      backgroundGradient:
          _lerpGradient(backgroundGradient, other.backgroundGradient, t),
      glassBackground: Color.lerp(glassBackground, other.glassBackground, t)!,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t)!,
    );
  }

  static List<Color> _lerpGradient(
      List<Color> a, List<Color> b, double t) {
    final length = a.length < b.length ? a.length : b.length;
    return List.generate(length, (i) => Color.lerp(a[i], b[i], t)!);
  }
}

/// Extension to easily access AppThemeExtension from BuildContext
extension AppThemeExtensionContext on BuildContext {
  AppThemeExtension get appTheme =>
      Theme.of(this).extension<AppThemeExtension>() ?? AppThemeExtension.light;
}
