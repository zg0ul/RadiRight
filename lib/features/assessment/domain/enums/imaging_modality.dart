import 'package:flutter/material.dart';
import 'package:radi_right/app/theme/app_colors.dart';

/// Imaging modality types that doctors can select at the start of an assessment.
/// These represent the imaging study the doctor is considering recommending.
enum ImagingModality {
  ultrasound,
  mri,
  ctScan,
  nuclearMedicine,
  petImaging,
  angiography,
  mammography,
  arthrography,
  xRay;

  /// English display name for the modality
  String get displayName => switch (this) {
        ImagingModality.ultrasound => 'Ultrasound',
        ImagingModality.mri => 'MRI',
        ImagingModality.ctScan => 'CT Scan',
        ImagingModality.nuclearMedicine => 'Nuclear Medicine',
        ImagingModality.petImaging => 'PET Imaging',
        ImagingModality.angiography => 'Angiography',
        ImagingModality.mammography => 'Mammography',
        ImagingModality.arthrography => 'Arthrography',
        ImagingModality.xRay => 'X-ray',
      };

  /// Arabic display name for the modality
  String get arabicDisplayName => switch (this) {
        ImagingModality.ultrasound => 'الموجات فوق الصوتية',
        ImagingModality.mri => 'الرنين المغناطيسي',
        ImagingModality.ctScan => 'الأشعة المقطعية',
        ImagingModality.nuclearMedicine => 'الطب النووي',
        ImagingModality.petImaging => 'التصوير المقطعي بالإصدار البوزيتروني',
        ImagingModality.angiography => 'تصوير الأوعية',
        ImagingModality.mammography => 'تصوير الثدي',
        ImagingModality.arthrography => 'تصوير المفاصل',
        ImagingModality.xRay => 'الأشعة السينية',
      };

  /// Localized display name based on locale
  String getLocalizedName(String locale) =>
      locale == 'ar' ? arabicDisplayName : displayName;

  /// Short code used for matching with JSON modality strings
  /// These should match the modality field in ImagingRecommendation
  String get shortCode => switch (this) {
        ImagingModality.ultrasound => 'US',
        ImagingModality.mri => 'MRI',
        ImagingModality.ctScan => 'CT',
        ImagingModality.nuclearMedicine => 'NM',
        ImagingModality.petImaging => 'PET',
        ImagingModality.angiography => 'Angiography',
        ImagingModality.mammography => 'Mammography',
        ImagingModality.arthrography => 'Arthrography',
        ImagingModality.xRay => 'X-ray',
      };

  /// Alternative short codes for flexible matching
  List<String> get alternativeShortCodes => switch (this) {
        ImagingModality.ultrasound => ['US', 'Ultrasound', 'USG', 'Sonography'],
        ImagingModality.mri => ['MRI', 'MR', 'Magnetic Resonance'],
        ImagingModality.ctScan => ['CT', 'CAT', 'Computed Tomography'],
        ImagingModality.nuclearMedicine => ['NM', 'Nuclear', 'Nuclear Medicine'],
        ImagingModality.petImaging => ['PET', 'PET/CT', 'PET-CT', 'PET Imaging'],
        ImagingModality.angiography => ['Angiography', 'Angio', 'DSA'],
        ImagingModality.mammography => ['Mammography', 'Mammo'],
        ImagingModality.arthrography => ['Arthrography', 'Arthro'],
        ImagingModality.xRay => ['X-ray', 'XR', 'Radiograph', 'Radiographs', 'Plain Film'],
      };

  /// Icon for the modality (emoji representation)
  String get icon => switch (this) {
        ImagingModality.ultrasound => '🔊',
        ImagingModality.mri => '🧲',
        ImagingModality.ctScan => '🔬',
        ImagingModality.nuclearMedicine => '☢️',
        ImagingModality.petImaging => '🔍',
        ImagingModality.angiography => '💉',
        ImagingModality.mammography => '🩻',
        ImagingModality.arthrography => '💧',
        ImagingModality.xRay => '⚡',
      };

  /// Color associated with the modality for UI
  Color get color => AppColors.primaryLight;

  /// Checks if a given modality string matches this enum value
  bool matches(String modalityString) {
    final normalized = modalityString.toLowerCase().trim();
    return alternativeShortCodes
        .any((code) => code.toLowerCase() == normalized);
  }

  /// Factory to create from a string value
  static ImagingModality? fromString(String value) {
    final normalized = value.toLowerCase().trim();

    for (final modality in ImagingModality.values) {
      if (modality.name.toLowerCase() == normalized ||
          modality.displayName.toLowerCase() == normalized ||
          modality.shortCode.toLowerCase() == normalized ||
          modality.alternativeShortCodes
              .any((code) => code.toLowerCase() == normalized)) {
        return modality;
      }
    }

    return null;
  }
}
