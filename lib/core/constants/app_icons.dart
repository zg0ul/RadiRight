import 'package:hugeicons/hugeicons.dart';

typedef IconType = List<List<dynamic>>;

/// App icon data using HugeIcons library
/// All icons use the strokeRounded style for consistency
/// Use these with HugeIcon widget: HugeIcon(icon: AppIcons.home, size: 24)
class AppIcons {
  AppIcons._();

  // Type alias for icon data

  // Navigation
  static const IconType back = HugeIcons.strokeRoundedArrowLeft01;
  static const IconType forward = HugeIcons.strokeRoundedArrowRight01;
  static const IconType close = HugeIcons.strokeRoundedCancel01;
  static const IconType menu = HugeIcons.strokeRoundedMenu01;
  static const IconType home = HugeIcons.strokeRoundedHome01;
  static const IconType chevronRight = HugeIcons.strokeRoundedArrowRight01;
  static const IconType chevronDown = HugeIcons.strokeRoundedArrowDown01;
  static const IconType chevronUp = HugeIcons.strokeRoundedArrowUp01;

  // Actions
  static const IconType search = HugeIcons.strokeRoundedSearch01;
  static const IconType settings = HugeIcons.strokeRoundedSettings01;
  static const IconType history = HugeIcons.strokeRoundedClock01;
  static const IconType share = HugeIcons.strokeRoundedShare01;
  static const IconType refresh = HugeIcons.strokeRoundedRefresh;
  static const IconType add = HugeIcons.strokeRoundedAdd01;
  static const IconType edit = HugeIcons.strokeRoundedEdit02;
  static const IconType delete = HugeIcons.strokeRoundedDelete02;

  // Status
  static const IconType check = HugeIcons.strokeRoundedTick01;
  static const IconType checkCircle = HugeIcons.strokeRoundedCheckmarkCircle02;
  static const IconType error = HugeIcons.strokeRoundedAlertCircle;
  static const IconType warning = HugeIcons.strokeRoundedAlert02;
  static const IconType info = HugeIcons.strokeRoundedInformationCircle;

  // Medical/App specific
  static const IconType medical = HugeIcons.strokeRoundedStethoscope;
  static const IconType clipboard = HugeIcons.strokeRoundedClipboard;
  static const IconType document = HugeIcons.strokeRoundedFile02;
  static const IconType user = HugeIcons.strokeRoundedUser;
  static const IconType atom = HugeIcons.strokeRoundedAtom01;
  static const IconType radiation = HugeIcons.strokeRoundedRadioactiveAlert;

  // Body parts for panels
  static const IconType bone = HugeIcons.strokeRoundedBone01;
  static const IconType lungs = HugeIcons.strokeRoundedLungs;
  static const IconType brain = HugeIcons.strokeRoundedBrain;
  static const IconType heart = HugeIcons.strokeRoundedHeartCheck;
  static const IconType kidneys = HugeIcons.strokeRoundedKidneys;
  static const IconType liver = HugeIcons.strokeRoundedLiver;
  static const IconType xray = HugeIcons.strokeRoundedXRay;

  // Assessment
  static const IconType question = HugeIcons.strokeRoundedHelpCircle;
  static const IconType result = HugeIcons.strokeRoundedCheckList;
  static const IconType recommendation = HugeIcons.strokeRoundedBulb;
  static const IconType appropriate = HugeIcons.strokeRoundedThumbsUp;
  static const IconType notAppropriate = HugeIcons.strokeRoundedThumbsDown;

  // Features
  static const IconType evidenceBased = HugeIcons.strokeRoundedBook02;
  static const IconType criteria = HugeIcons.strokeRoundedFilterHorizontal;
  static const IconType quickResults = HugeIcons.strokeRoundedFlash;

  // Theme
  static const IconType lightMode = HugeIcons.strokeRoundedSun03;
  static const IconType darkMode = HugeIcons.strokeRoundedMoon02;
  static const IconType systemMode = HugeIcons.strokeRoundedSmartPhone01;

  // Language
  static const IconType language = HugeIcons.strokeRoundedGlobe02;

  // Misc
  static const IconType lock = HugeIcons.strokeRoundedLock;
  static const IconType locked = HugeIcons.strokeRoundedSquareLock02;
  static const IconType baby = HugeIcons.strokeRoundedBaby01;
  static const IconType stomach = HugeIcons.strokeRoundedKidneys; // Using kidneys as placeholder for abdominal
}
