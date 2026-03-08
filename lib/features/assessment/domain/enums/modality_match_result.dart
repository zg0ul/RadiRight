import 'package:flutter/material.dart';
import 'package:radi_right/app/theme/app_colors.dart';

/// Result of comparing the doctor's selected modality against ACR recommendations.
/// Used to determine the color-coded feedback on the result screen.
enum ModalityMatchResult {
  /// Doctor's choice matches Option 1 (primary recommendation)
  /// Displayed with green color
  indicated,

  /// Doctor's choice matches Option 2 (alternative recommendation)
  /// Displayed with amber/yellow color
  mayBeAppropriate,

  /// Doctor's choice is not in the recommended options
  /// Displayed with red color
  notIndicated,

  /// No ACR guidelines cover this clinical scenario
  /// Displayed with blue color, triggers NoGuidelinesScreen
  noGuidelines;

  /// English display name
  String get displayName => switch (this) {
        ModalityMatchResult.indicated => 'TRUE - Imaging Indicated',
        ModalityMatchResult.mayBeAppropriate => 'May Be Appropriate',
        ModalityMatchResult.notIndicated => 'FALSE - Imaging NOT Indicated',
        ModalityMatchResult.noGuidelines => 'No Current Guidelines Available',
      };

  /// Arabic display name
  String get arabicDisplayName => switch (this) {
        ModalityMatchResult.indicated => 'صحيح - التصوير مُوصى به',
        ModalityMatchResult.mayBeAppropriate => 'قد يكون مناسباً',
        ModalityMatchResult.notIndicated => 'خطأ - التصوير غير مُوصى به',
        ModalityMatchResult.noGuidelines => 'لا توجد إرشادات حالية',
      };

  /// Localized display name
  String getLocalizedName(String locale) =>
      locale == 'ar' ? arabicDisplayName : displayName;

  /// Short description for the result
  String get description => switch (this) {
        ModalityMatchResult.indicated =>
          'Your selected imaging study is the recommended choice for this clinical scenario.',
        ModalityMatchResult.mayBeAppropriate =>
          'Your selected imaging study may be appropriate, but other options might be preferred.',
        ModalityMatchResult.notIndicated =>
          'Your selected imaging study is not recommended for this clinical scenario.',
        ModalityMatchResult.noGuidelines =>
          'ACR Appropriateness Criteria do not currently cover this specific clinical scenario.',
      };

  /// Arabic description
  String get arabicDescription => switch (this) {
        ModalityMatchResult.indicated =>
          'دراسة التصوير التي اخترتها هي الخيار الموصى به لهذا السيناريو السريري.',
        ModalityMatchResult.mayBeAppropriate =>
          'قد تكون دراسة التصوير التي اخترتها مناسبة، لكن قد تكون هناك خيارات أفضل.',
        ModalityMatchResult.notIndicated =>
          'دراسة التصوير التي اخترتها غير موصى بها لهذا السيناريو السريري.',
        ModalityMatchResult.noGuidelines =>
          'معايير ملاءمة ACR لا تغطي حالياً هذا السيناريو السريري المحدد.',
      };

  /// Localized description
  String getLocalizedDescription(String locale) =>
      locale == 'ar' ? arabicDescription : description;

  /// Primary color for the result state
  Color get color => switch (this) {
        ModalityMatchResult.indicated => AppColors.usuallyAppropriate,
        ModalityMatchResult.mayBeAppropriate => AppColors.mayBeAppropriate,
        ModalityMatchResult.notIndicated => AppColors.usuallyNotAppropriate,
        ModalityMatchResult.noGuidelines => AppColors.primaryLight,
      };

  /// Background color (lighter shade) for the result state
  Color get backgroundColor => switch (this) {
        ModalityMatchResult.indicated => const Color(0xFFE8F5E9),
        ModalityMatchResult.mayBeAppropriate => const Color(0xFFFFF3E0),
        ModalityMatchResult.notIndicated => const Color(0xFFFFEBEE),
        ModalityMatchResult.noGuidelines => const Color(0xFFE3F2FD),
      };

  /// Gradient colors for the header
  List<Color> get gradientColors => switch (this) {
        ModalityMatchResult.indicated => const [
            Color(0xFF16A34A),
            Color(0xFF22C55E),
          ],
        ModalityMatchResult.mayBeAppropriate => const [
            Color(0xFFF59E0B),
            Color(0xFFFBBF24),
          ],
        ModalityMatchResult.notIndicated => const [
            Color(0xFFDC2626),
            Color(0xFFEF4444),
          ],
        ModalityMatchResult.noGuidelines => const [
            Color(0xFF2196F3),
            Color(0xFF42A5F5),
          ],
      };

  /// Icon for the result state
  IconData get icon => switch (this) {
        ModalityMatchResult.indicated => Icons.check_circle_outline,
        ModalityMatchResult.mayBeAppropriate => Icons.info_outline,
        ModalityMatchResult.notIndicated => Icons.cancel_outlined,
        ModalityMatchResult.noGuidelines => Icons.smart_toy_outlined,
      };

  /// Whether this result indicates a positive outcome
  bool get isPositive =>
      this == ModalityMatchResult.indicated ||
      this == ModalityMatchResult.mayBeAppropriate;

  /// Whether this is a "no guidelines" scenario requiring special handling
  bool get requiresAiFallback => this == ModalityMatchResult.noGuidelines;
}
