import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/services/cache_service.dart';
import '../../core/constants/app_constants.dart';
import 'app_color_palette.dart';
import 'app_theme_extension.dart';
import 'app_typography.dart';

part 'theme_provider.g.dart';

const String _themeModeKey = 'theme_mode';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    _loadSavedTheme();
    return ThemeMode.system;
  }

  Future<void> _loadSavedTheme() async {
    final cacheService = ref.read(cacheServiceProvider);
    final savedTheme = await cacheService.getString(_themeModeKey);
    if (savedTheme != null) {
      state = ThemeMode.values.firstWhere(
        (mode) => mode.name == savedTheme,
        orElse: () => ThemeMode.system,
      );
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final cacheService = ref.read(cacheServiceProvider);
    await cacheService.setString(_themeModeKey, mode.name);
    state = mode;
  }

  void toggleTheme() {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setThemeMode(newMode);
  }
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColorPalette.primaryLight,
          onPrimary: AppColorPalette.onPrimaryLight,
          primaryContainer: AppColorPalette.primaryContainerLight,
          onPrimaryContainer: AppColorPalette.onPrimaryContainerLight,
          secondary: AppColorPalette.secondaryLight,
          secondaryContainer: AppColorPalette.secondaryContainerLight,
          surface: AppColorPalette.surfaceLight,
          onSurface: AppColorPalette.onSurfaceLight,
          onSurfaceVariant: AppColorPalette.onSurfaceVariantLight,
          error: AppColorPalette.errorLight,
          errorContainer: AppColorPalette.errorContainerLight,
          outline: AppColorPalette.outlineLight,
          surfaceContainerHighest: AppColorPalette.surfaceContainerLight,
        ),
        scaffoldBackgroundColor: AppColorPalette.backgroundLight,
        cardColor: AppColorPalette.cardLight,
        dividerColor: AppColorPalette.dividerLight,
        textTheme: AppTypography.textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColorPalette.onSurfaceLight,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: AppTypography.titleLarge.copyWith(
            color: AppColorPalette.onSurfaceLight,
          ),
        ),
        cardTheme: CardThemeData(
          color: AppColorPalette.cardLight,
          elevation: AppConstants.elevationSM,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          ),
          margin: EdgeInsets.zero,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorPalette.primaryLight,
            foregroundColor: AppColorPalette.onPrimaryLight,
            elevation: AppConstants.elevationNone,
            minimumSize: Size(double.infinity, AppConstants.buttonHeightLG),
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.spacingLG,
              vertical: AppConstants.spacingMD,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            ),
            textStyle: AppTypography.titleMedium,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColorPalette.primaryLight,
            minimumSize: Size(double.infinity, AppConstants.buttonHeightLG),
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.spacingLG,
              vertical: AppConstants.spacingMD,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            ),
            side: const BorderSide(color: AppColorPalette.primaryLight, width: 1.5),
            textStyle: AppTypography.titleMedium,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColorPalette.primaryLight,
            textStyle: AppTypography.labelLarge,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColorPalette.surfaceContainerLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            borderSide: const BorderSide(color: AppColorPalette.primaryLight, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            borderSide: const BorderSide(color: AppColorPalette.errorLight),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppConstants.spacingMD,
            vertical: AppConstants.spacingMD,
          ),
          hintStyle: AppTypography.bodyMedium.copyWith(
            color: AppColorPalette.onSurfaceVariantLight,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColorPalette.primaryLight,
          foregroundColor: AppColorPalette.onPrimaryLight,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColorPalette.surfaceLight,
          selectedItemColor: AppColorPalette.primaryLight,
          unselectedItemColor: AppColorPalette.onSurfaceVariantLight,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColorPalette.onSurfaceLight,
          contentTextStyle: AppTypography.bodyMedium.copyWith(
            color: AppColorPalette.surfaceLight,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusSM),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColorPalette.surfaceContainerLight,
          selectedColor: AppColorPalette.primaryContainerLight,
          labelStyle: AppTypography.labelMedium,
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.spacingSM,
            vertical: AppConstants.spacingXS,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusFull),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColorPalette.primaryLight,
          linearTrackColor: AppColorPalette.surfaceContainerLight,
        ),
        extensions: const [AppThemeExtension.light],
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColorPalette.primaryDark,
          onPrimary: AppColorPalette.onPrimaryDark,
          primaryContainer: AppColorPalette.primaryContainerDark,
          onPrimaryContainer: AppColorPalette.onPrimaryContainerDark,
          secondary: AppColorPalette.secondaryDark,
          secondaryContainer: AppColorPalette.secondaryContainerDark,
          surface: AppColorPalette.surfaceDark,
          onSurface: AppColorPalette.onSurfaceDark,
          onSurfaceVariant: AppColorPalette.onSurfaceVariantDark,
          error: AppColorPalette.errorDark,
          errorContainer: AppColorPalette.errorContainerDark,
          outline: AppColorPalette.outlineDark,
          surfaceContainerHighest: AppColorPalette.surfaceContainerDark,
        ),
        scaffoldBackgroundColor: AppColorPalette.backgroundDark,
        cardColor: AppColorPalette.cardDark,
        dividerColor: AppColorPalette.dividerDark,
        textTheme: AppTypography.textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColorPalette.onSurfaceDark,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: AppTypography.titleLarge.copyWith(
            color: AppColorPalette.onSurfaceDark,
          ),
        ),
        cardTheme: CardThemeData(
          color: AppColorPalette.cardDark,
          elevation: AppConstants.elevationSM,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          ),
          margin: EdgeInsets.zero,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorPalette.primaryDark,
            foregroundColor: AppColorPalette.onPrimaryDark,
            elevation: AppConstants.elevationNone,
            minimumSize: Size(double.infinity, AppConstants.buttonHeightLG),
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.spacingLG,
              vertical: AppConstants.spacingMD,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            ),
            textStyle: AppTypography.titleMedium,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColorPalette.primaryDark,
            minimumSize: Size(double.infinity, AppConstants.buttonHeightLG),
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.spacingLG,
              vertical: AppConstants.spacingMD,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            ),
            side: const BorderSide(color: AppColorPalette.primaryDark, width: 1.5),
            textStyle: AppTypography.titleMedium,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColorPalette.primaryDark,
            textStyle: AppTypography.labelLarge,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColorPalette.surfaceContainerDark,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            borderSide: const BorderSide(color: AppColorPalette.primaryDark, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMD),
            borderSide: const BorderSide(color: AppColorPalette.errorDark),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppConstants.spacingMD,
            vertical: AppConstants.spacingMD,
          ),
          hintStyle: AppTypography.bodyMedium.copyWith(
            color: AppColorPalette.onSurfaceVariantDark,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColorPalette.primaryDark,
          foregroundColor: AppColorPalette.onPrimaryDark,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColorPalette.surfaceDark,
          selectedItemColor: AppColorPalette.primaryDark,
          unselectedItemColor: AppColorPalette.onSurfaceVariantDark,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColorPalette.onSurfaceDark,
          contentTextStyle: AppTypography.bodyMedium.copyWith(
            color: AppColorPalette.surfaceDark,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusSM),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColorPalette.surfaceContainerDark,
          selectedColor: AppColorPalette.primaryContainerDark,
          labelStyle: AppTypography.labelMedium,
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.spacingSM,
            vertical: AppConstants.spacingXS,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusFull),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColorPalette.primaryDark,
          linearTrackColor: AppColorPalette.surfaceContainerDark,
        ),
        extensions: const [AppThemeExtension.dark],
      );
}
