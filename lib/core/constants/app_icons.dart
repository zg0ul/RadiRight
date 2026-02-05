import 'package:hugeicons/hugeicons.dart';

/// App icon data using HugeIcons library
/// All icons use the strokeRounded style for consistency
/// Use these with HugeIcon widget: HugeIcon(icon: AppIcons.home, size: 24)
class AppIcons {
  AppIcons._();

  // Type alias for icon data
  static const iconType = List<List<dynamic>>;

  // Navigation
  static const List<List<dynamic>> back = HugeIcons.strokeRoundedArrowLeft01;
  static const List<List<dynamic>> forward = HugeIcons.strokeRoundedArrowRight01;
  static const List<List<dynamic>> close = HugeIcons.strokeRoundedCancel01;
  static const List<List<dynamic>> menu = HugeIcons.strokeRoundedMenu01;
  static const List<List<dynamic>> home = HugeIcons.strokeRoundedHome01;
  static const List<List<dynamic>> chevronRight = HugeIcons.strokeRoundedArrowRight01;
  static const List<List<dynamic>> chevronDown = HugeIcons.strokeRoundedArrowDown01;
  static const List<List<dynamic>> chevronUp = HugeIcons.strokeRoundedArrowUp01;

  // Actions
  static const List<List<dynamic>> search = HugeIcons.strokeRoundedSearch01;
  static const List<List<dynamic>> settings = HugeIcons.strokeRoundedSettings01;
  static const List<List<dynamic>> history = HugeIcons.strokeRoundedClock01;
  static const List<List<dynamic>> share = HugeIcons.strokeRoundedShare01;
  static const List<List<dynamic>> refresh = HugeIcons.strokeRoundedRefresh;
  static const List<List<dynamic>> add = HugeIcons.strokeRoundedAdd01;
  static const List<List<dynamic>> edit = HugeIcons.strokeRoundedEdit02;
  static const List<List<dynamic>> delete = HugeIcons.strokeRoundedDelete02;

  // Status
  static const List<List<dynamic>> check = HugeIcons.strokeRoundedTick01;
  static const List<List<dynamic>> checkCircle = HugeIcons.strokeRoundedCheckmarkCircle02;
  static const List<List<dynamic>> error = HugeIcons.strokeRoundedAlertCircle;
  static const List<List<dynamic>> warning = HugeIcons.strokeRoundedAlert02;
  static const List<List<dynamic>> info = HugeIcons.strokeRoundedInformationCircle;

  // Medical/App specific
  static const List<List<dynamic>> medical = HugeIcons.strokeRoundedStethoscope;
  static const List<List<dynamic>> clipboard = HugeIcons.strokeRoundedClipboard;
  static const List<List<dynamic>> document = HugeIcons.strokeRoundedFile02;
  static const List<List<dynamic>> user = HugeIcons.strokeRoundedUser;
  static const List<List<dynamic>> atom = HugeIcons.strokeRoundedAtom01;
  static const List<List<dynamic>> radiation = HugeIcons.strokeRoundedRadioactiveAlert;

  // Body parts for panels
  static const List<List<dynamic>> bone = HugeIcons.strokeRoundedBone01;
  static const List<List<dynamic>> lungs = HugeIcons.strokeRoundedLungs;
  static const List<List<dynamic>> brain = HugeIcons.strokeRoundedBrain;
  static const List<List<dynamic>> heart = HugeIcons.strokeRoundedHeartCheck;
  static const List<List<dynamic>> kidneys = HugeIcons.strokeRoundedKidneys;
  static const List<List<dynamic>> liver = HugeIcons.strokeRoundedLiver;
  static const List<List<dynamic>> xray = HugeIcons.strokeRoundedXRay;

  // Assessment
  static const List<List<dynamic>> question = HugeIcons.strokeRoundedHelpCircle;
  static const List<List<dynamic>> result = HugeIcons.strokeRoundedCheckList;
  static const List<List<dynamic>> recommendation = HugeIcons.strokeRoundedBulb;
  static const List<List<dynamic>> appropriate = HugeIcons.strokeRoundedThumbsUp;
  static const List<List<dynamic>> notAppropriate = HugeIcons.strokeRoundedThumbsDown;

  // Features
  static const List<List<dynamic>> evidenceBased = HugeIcons.strokeRoundedBook02;
  static const List<List<dynamic>> criteria = HugeIcons.strokeRoundedFilterHorizontal;
  static const List<List<dynamic>> quickResults = HugeIcons.strokeRoundedFlash;

  // Theme
  static const List<List<dynamic>> lightMode = HugeIcons.strokeRoundedSun03;
  static const List<List<dynamic>> darkMode = HugeIcons.strokeRoundedMoon02;
  static const List<List<dynamic>> systemMode = HugeIcons.strokeRoundedSmartPhone01;

  // Language
  static const List<List<dynamic>> language = HugeIcons.strokeRoundedGlobe02;

  // Misc
  static const List<List<dynamic>> lock = HugeIcons.strokeRoundedLock;
  static const List<List<dynamic>> baby = HugeIcons.strokeRoundedBaby01;
  static const List<List<dynamic>> stomach = HugeIcons.strokeRoundedKidneys; // Using kidneys as placeholder for abdominal
}
