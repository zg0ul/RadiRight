import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_icons.dart';
import '../../app/theme/app_color_palette.dart';

/// A consistent search bar widget used across the app
class AppSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final bool autofocus;
  final bool showClearButton;

  const AppSearchBar({
    super.key,
    this.controller,
    required this.hintText,
    this.onChanged,
    this.onClear,
    this.autofocus = false,
    this.showClearButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return TextField(
      controller: controller,
      autofocus: autofocus,
      onChanged: onChanged,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        prefixIcon: Padding(
          padding: EdgeInsets.all(AppConstants.spacingMD),
          child: HugeIcon(icon: AppIcons.search, size: AppConstants.iconMD, color: theme.colorScheme.onSurfaceVariant),
        ),
        suffixIcon: showClearButton && (controller?.text.isNotEmpty ?? false)
            ? IconButton(
                icon: HugeIcon(
                  icon: AppIcons.close,
                  size: AppConstants.iconSM,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                onPressed: () {
                  controller?.clear();
                  onClear?.call();
                },
              )
            : null,
        filled: true,
        fillColor: isDark ? AppColorPalette.surfaceContainerDark : AppColorPalette.surfaceContainerLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          borderSide: BorderSide(color: theme.colorScheme.outlineVariant, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          borderSide: BorderSide(color: theme.colorScheme.outlineVariant, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: AppConstants.spacingMD, vertical: AppConstants.spacingXS),
      ),
    );
  }
}
