import 'package:flutter/material.dart';

/// Medical app color palette with healthcare teal and proper surface container hierarchy
/// Following Material 3 design guidelines with WCAG contrast compliance
class AppColorPalette {
  AppColorPalette._();

  // ============================================
  // PRIMARY COLORS - Healthcare Teal
  // ============================================
  static const Color primaryLight = Color(0xFF006A6A);
  static const Color primaryDark = Color(0xFF4DD9D9);

  static const Color primaryContainerLight = Color(0xFF6FF7F7);
  static const Color primaryContainerDark = Color(0xFF004F4F);

  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color onPrimaryDark = Color(0xFF001A1A);

  static const Color onPrimaryContainerLight = Color(0xFF002020);
  static const Color onPrimaryContainerDark = Color(0xFF6FF7F7);

  // ============================================
  // SECONDARY COLORS - Complementary teal
  // ============================================
  static const Color secondaryLight = Color(0xFF4A6363);
  static const Color secondaryDark = Color(0xFFB1CCCC);

  static const Color secondaryContainerLight = Color(0xFFCCE8E8);
  static const Color secondaryContainerDark = Color(0xFF324B4B);

  static const Color onSecondaryLight = Color(0xFFFFFFFF);
  static const Color onSecondaryDark = Color(0xFF1C3535);

  static const Color onSecondaryContainerLight = Color(0xFF051F1F);
  static const Color onSecondaryContainerDark = Color(0xFFCCE8E8);

  // ============================================
  // TERTIARY COLORS
  // ============================================
  static const Color tertiaryLight = Color(0xFF4B607C);
  static const Color tertiaryDark = Color(0xFFB3C8E8);

  static const Color tertiaryContainerLight = Color(0xFFD3E4FF);
  static const Color tertiaryContainerDark = Color(0xFF334863);

  // ============================================
  // SURFACE & BACKGROUND - Light Mode
  // Using neutral grays for cleaner appearance
  // ============================================
  static const Color surfaceLight = Color(0xFFF8F9FA);
  static const Color surfaceContainerLowestLight = Color(0xFFFFFFFF);
  static const Color surfaceContainerLowLight = Color(0xFFF3F4F6);
  static const Color surfaceContainerLight = Color(0xFFFFFFFF);
  static const Color surfaceContainerHighLight = Color(0xFFD1D5DB);
  static const Color surfaceContainerHighestLight = Color(0xFF9CA3AF);

  static const Color onSurfaceLight = Color(0xFF111827);
  static const Color onSurfaceVariantLight = Color(0xFF4B5563);

  // ============================================
  // SURFACE & BACKGROUND - Dark Mode
  // ============================================
  static const Color surfaceDark = Color(0xFF0E1515);
  static const Color surfaceContainerLowestDark = Color(0xFF091212);
  static const Color surfaceContainerLowDark = Color(0xFF171D1D);
  static const Color surfaceContainerDark = Color(0xFF1B2121);
  static const Color surfaceContainerHighDark = Color(0xFF252B2B);
  static const Color surfaceContainerHighestDark = Color(0xFF303636);

  static const Color onSurfaceDark = Color(0xFFDEE3E3);
  static const Color onSurfaceVariantDark = Color(0xFFBEC9C8);

  // ============================================
  // OUTLINE COLORS
  // ============================================
  static const Color outlineLight = Color(0xFF6B7280);
  static const Color outlineDark = Color(0xFF899392);

  static const Color outlineVariantLight = Color(0xFFD1D5DB);
  static const Color outlineVariantDark = Color(0xFF3F4949);

  // ============================================
  // ERROR COLORS
  // ============================================
  static const Color errorLight = Color(0xFFBA1A1A);
  static const Color errorDark = Color(0xFFFFB4AB);

  static const Color errorContainerLight = Color(0xFFFFDAD6);
  static const Color errorContainerDark = Color(0xFF93000A);

  static const Color onErrorLight = Color(0xFFFFFFFF);
  static const Color onErrorDark = Color(0xFF690005);

  static const Color onErrorContainerLight = Color(0xFF410002);
  static const Color onErrorContainerDark = Color(0xFFFFDAD6);

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
  // SEMANTIC COLORS
  // ============================================
  static const Color successLight = Color(0xFF16A34A);
  static const Color successDark = Color(0xFF4ADE80);

  static const Color warningLight = Color(0xFFF59E0B);
  static const Color warningDark = Color(0xFFFBBF24);

  static const Color infoLight = Color(0xFF0EA5E9);
  static const Color infoDark = Color(0xFF38BDF8);

  // ============================================
  // DIVIDER COLORS
  // ============================================
  static const Color dividerLight = Color(0xFFE5E7EB);
  static const Color dividerDark = Color(0xFF3F4949);

  // ============================================
  // CARD COLORS
  // ============================================
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1B2121);

  // ============================================
  // SHADOW COLORS
  // ============================================
  static const Color shadowLight = Color(0xFF000000);
  static const Color shadowDark = Color(0xFF000000);

  // ============================================
  // GRADIENT DEFINITIONS
  // ============================================
  static const List<Color> primaryGradientLight = [
    Color(0xFF006A6A),
    Color(0xFF008A8A),
  ];

  static const List<Color> primaryGradientDark = [
    Color(0xFF004F4F),
    Color(0xFF006A6A),
  ];

  static const List<Color> successGradient = [
    Color(0xFF16A34A),
    Color(0xFF22C55E),
  ];

  static const List<Color> backgroundGradientLight = [
    Color(0xFFF3F4F6),
    Color(0xFFF8F9FA),
    Color(0xFFFFFFFF),
  ];

  static const List<Color> backgroundGradientDark = [
    Color(0xFF0E1515),
    Color(0xFF171D1D),
    Color(0xFF1B2121),
  ];

  // ============================================
  // GLASSMORPHISM COLORS
  // ============================================
  static Color glassBackgroundLight = Colors.white.withValues(alpha: 0.7);
  static Color glassBackgroundDark = Colors.white.withValues(alpha: 0.1);
  static Color glassBorderLight = Colors.white.withValues(alpha: 0.8);
  static Color glassBorderDark = Colors.white.withValues(alpha: 0.2);
}
