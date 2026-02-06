import 'package:radi_right/core/constants/app_icons.dart';

/// Panel icon types that can be used in decision tree JSON files.
enum PanelIcon {
  skeleton,
  bone,
  lungs,
  brain,
  kidneys,
  heart,
  baby;

  /// Converts a string iconName to PanelIcon enum.
  /// Returns null if the string doesn't match any known icon.
  static PanelIcon? fromString(String? iconName) {
    if (iconName == null) return null;
    return PanelIcon.values.firstWhere(
      (icon) => icon.name.toLowerCase() == iconName.toLowerCase(),
      orElse: () => throw ArgumentError('Unknown icon name: $iconName'),
    );
  }

  /// Safely converts a string iconName to PanelIcon enum.
  /// Returns null if the string doesn't match any known icon.
  static PanelIcon? tryFromString(String? iconName) {
    if (iconName == null) return null;
    try {
      return fromString(iconName);
    } catch (_) {
      return null;
    }
  }

  /// Gets the AppIcons icon data for this panel icon.
  List<List<dynamic>> get icon {
    switch (this) {
      case PanelIcon.skeleton:
      case PanelIcon.bone:
        return AppIcons.bone;
      case PanelIcon.lungs:
        return AppIcons.lungs;
      case PanelIcon.brain:
        return AppIcons.brain;
      case PanelIcon.kidneys:
        return AppIcons.kidneys;
      case PanelIcon.heart:
        return AppIcons.heart;
      case PanelIcon.baby:
        return AppIcons.baby;
    }
  }
}
