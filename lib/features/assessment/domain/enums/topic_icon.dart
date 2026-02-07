import 'package:radi_right/core/constants/app_icons.dart';

/// Topic icon types that can be used in decision tree JSON files.
/// This enum maps icon names from JSON to actual AppIcons.
enum TopicIcon {
  // MSK - General
  bone,
  joint,
  xray,

  // MSK - Specific body parts
  hand,
  wrist,
  foot,
  ankle,
  shoulder,
  elbow,
  hip,
  knee,
  spine,

  // Chest
  lungs,
  chest,

  // Neuro
  brain,
  head,

  // Cardiac
  heart,

  // Abdominal
  kidneys,
  liver,
  stomach,
  abdomen,

  // Pediatric
  baby,

  // General/Default
  medical;

  /// Converts a string iconName to TopicIcon enum.
  /// Returns null if the string doesn't match any known icon.
  static TopicIcon? fromString(String? iconName) {
    if (iconName == null) return null;
    return TopicIcon.values.firstWhere(
      (icon) => icon.name.toLowerCase() == iconName.toLowerCase(),
      orElse: () => throw ArgumentError('Unknown icon name: $iconName'),
    );
  }

  /// Safely converts a string iconName to TopicIcon enum.
  /// Returns null if the string doesn't match any known icon.
  static TopicIcon? tryFromString(String? iconName) {
    if (iconName == null) return null;
    try {
      return fromString(iconName);
    } catch (_) {
      return null;
    }
  }

  /// Gets the AppIcons icon data for this topic icon.
  List<List<dynamic>> get icon {
    switch (this) {
      // MSK - General
      case TopicIcon.bone:
        return AppIcons.bone;
      case TopicIcon.joint:
        return AppIcons.joint;
      case TopicIcon.xray:
        return AppIcons.xray;

      // MSK - Specific body parts
      case TopicIcon.hand:
      case TopicIcon.wrist:
        return AppIcons.hand;
      case TopicIcon.foot:
      case TopicIcon.ankle:
        return AppIcons.foot;
      case TopicIcon.shoulder:
      case TopicIcon.elbow:
        return AppIcons.bone;
      case TopicIcon.hip:
      case TopicIcon.knee:
        return AppIcons.joint;
      case TopicIcon.spine:
        return AppIcons.spine;

      // Chest
      case TopicIcon.lungs:
      case TopicIcon.chest:
        return AppIcons.lungs;

      // Neuro
      case TopicIcon.brain:
      case TopicIcon.head:
        return AppIcons.brain;

      // Cardiac
      case TopicIcon.heart:
        return AppIcons.heart;

      // Abdominal
      case TopicIcon.kidneys:
      case TopicIcon.abdomen:
        return AppIcons.kidneys;
      case TopicIcon.liver:
        return AppIcons.liver;
      case TopicIcon.stomach:
        return AppIcons.stomach;

      // Pediatric
      case TopicIcon.baby:
        return AppIcons.baby;

      // Default
      case TopicIcon.medical:
        return AppIcons.medical;
    }
  }
}
