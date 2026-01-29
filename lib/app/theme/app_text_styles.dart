import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  // Base font family
  static const String fontFamily = 'Roboto';
  static const String fontFamilyArabic = 'Cairo';

  // Headline styles
  static TextStyle headlineLarge({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle headlineMedium({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle headlineSmall({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
        fontFamily: fontFamily,
      );

  // Title styles
  static TextStyle titleLarge({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle titleMedium({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle titleSmall({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
        letterSpacing: 0.1,
      );

  // Body styles
  static TextStyle bodyLarge({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle bodyMedium({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle bodySmall({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color,
        fontFamily: fontFamily,
      );

  // Label styles
  static TextStyle labelLarge({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
        letterSpacing: 0.1,
      );

  static TextStyle labelMedium({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
        letterSpacing: 0.5,
      );

  static TextStyle labelSmall({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
        letterSpacing: 0.5,
      );

  // Button text style
  static TextStyle button({
    required Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color,
        fontFamily: fontFamily,
        letterSpacing: 1.25,
      );
}
