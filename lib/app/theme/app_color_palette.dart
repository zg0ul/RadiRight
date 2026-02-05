import 'package:flutter/material.dart';

/// Medical app color palette with light and dark variants
class AppColorPalette {
  AppColorPalette._();

  // ============================================
  // PRIMARY COLORS - Medical Blue
  // ============================================
  static const Color primaryLight = Color(0xFF0066CC);
  static const Color primaryDark = Color(0xFF4DA6FF);

  static const Color primaryContainerLight = Color(0xFFD6E8FF);
  static const Color primaryContainerDark = Color(0xFF003366);

  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color onPrimaryDark = Color(0xFF001A33);

  static const Color onPrimaryContainerLight = Color(0xFF001A33);
  static const Color onPrimaryContainerDark = Color(0xFFD6E8FF);

  // ============================================
  // SECONDARY COLORS - Teal accent
  // ============================================
  static const Color secondaryLight = Color(0xFF00897B);
  static const Color secondaryDark = Color(0xFF4DB6AC);

  static const Color secondaryContainerLight = Color(0xFFB2DFDB);
  static const Color secondaryContainerDark = Color(0xFF00695C);

  // ============================================
  // SURFACE & BACKGROUND
  // ============================================
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF0F172A);

  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E293B);

  static const Color surfaceContainerLight = Color(0xFFF1F5F9);
  static const Color surfaceContainerDark = Color(0xFF334155);

  static const Color onSurfaceLight = Color(0xFF1E293B);
  static const Color onSurfaceDark = Color(0xFFF1F5F9);

  static const Color onSurfaceVariantLight = Color(0xFF64748B);
  static const Color onSurfaceVariantDark = Color(0xFF94A3B8);

  // ============================================
  // ERROR COLORS
  // ============================================
  static const Color errorLight = Color(0xFFDC2626);
  static const Color errorDark = Color(0xFFF87171);

  static const Color errorContainerLight = Color(0xFFFEE2E2);
  static const Color errorContainerDark = Color(0xFF7F1D1D);

  // ============================================
  // APPROPRIATENESS COLORS
  // ============================================
  static const Color usuallyAppropriate = Color(0xFF16A34A);
  static const Color usuallyAppropriateLight = Color(0xFFDCFCE7);
  static const Color usuallyAppropriateDark = Color(0xFF166534);

  static const Color mayBeAppropriate = Color(0xFFF59E0B);
  static const Color mayBeAppropriateLight = Color(0xFFFEF3C7);
  static const Color mayBeAppropriateDark = Color(0xFF92400E);

  static const Color usuallyNotAppropriate = Color(0xFFDC2626);
  static const Color usuallyNotAppropriateLight = Color(0xFFFEE2E2);
  static const Color usuallyNotAppropriateDark = Color(0xFF991B1B);

  // ============================================
  // RADIATION LEVEL COLORS
  // ============================================
  static const Color radiationNone = Color(0xFF22C55E);
  static const Color radiationLow = Color(0xFF84CC16);
  static const Color radiationMedium = Color(0xFFFACC15);
  static const Color radiationHigh = Color(0xFFF97316);
  static const Color radiationVeryHigh = Color(0xFFEF4444);

  // ============================================
  // DIVIDER & OUTLINE
  // ============================================
  static const Color dividerLight = Color(0xFFE2E8F0);
  static const Color dividerDark = Color(0xFF475569);

  static const Color outlineLight = Color(0xFFCBD5E1);
  static const Color outlineDark = Color(0xFF64748B);

  // ============================================
  // CARD COLORS
  // ============================================
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E293B);

  // ============================================
  // GRADIENT DEFINITIONS
  // ============================================
  static const List<Color> primaryGradientLight = [
    Color(0xFF0066CC),
    Color(0xFF0099FF),
  ];

  static const List<Color> primaryGradientDark = [
    Color(0xFF003366),
    Color(0xFF0066CC),
  ];

  static const List<Color> successGradient = [
    Color(0xFF16A34A),
    Color(0xFF22C55E),
  ];

  static const List<Color> backgroundGradientLight = [
    Color(0xFFE0F2FE),
    Color(0xFFF8FAFC),
    Color(0xFFFFFFFF),
  ];

  static const List<Color> backgroundGradientDark = [
    Color(0xFF0F172A),
    Color(0xFF1E293B),
    Color(0xFF334155),
  ];

  // ============================================
  // GLASSMORPHISM COLORS
  // ============================================
  static Color glassBackgroundLight = Colors.white.withValues(alpha: 0.7);
  static Color glassBackgroundDark = Colors.white.withValues(alpha: 0.1);
  static Color glassBorderLight = Colors.white.withValues(alpha: 0.8);
  static Color glassBorderDark = Colors.white.withValues(alpha: 0.2);
}
