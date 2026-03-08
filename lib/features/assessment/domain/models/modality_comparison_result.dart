import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radi_right/features/assessment/domain/enums/imaging_modality.dart';
import 'package:radi_right/features/assessment/domain/enums/modality_match_result.dart';
import 'package:radi_right/features/assessment/domain/models/imaging_recommendation.dart';

part 'modality_comparison_result.freezed.dart';

/// Result of comparing the doctor's selected imaging modality
/// against the ACR recommendations for a clinical scenario.
@freezed
class ModalityComparisonResult with _$ModalityComparisonResult {
  const ModalityComparisonResult._();

  const factory ModalityComparisonResult({
    /// The imaging modality the doctor initially selected
    required ImagingModality selectedModality,

    /// The match result (indicated, mayBeAppropriate, notIndicated, noGuidelines)
    required ModalityMatchResult matchResult,

    /// The recommendation that matches the doctor's selection (if any)
    ImagingRecommendation? matchedRecommendation,

    /// The primary (priority 1) recommendation(s)
    @Default([]) List<ImagingRecommendation> primaryRecommendations,

    /// The alternative (priority 2) recommendation(s)
    @Default([]) List<ImagingRecommendation> alternativeRecommendations,

    /// AI-generated explanation (placeholder for future integration)
    String? aiExplanation,

    /// AI-generated explanation in Arabic
    String? aiExplanationAr,
  }) = _ModalityComparisonResult;

  /// Get localized AI explanation
  String? getLocalizedAiExplanation(String locale) =>
      locale == 'ar' ? aiExplanationAr : aiExplanation;

  /// Check if the doctor's choice was appropriate
  bool get isAppropriate => matchResult.isPositive;

  /// Check if this scenario has no guidelines
  bool get hasNoGuidelines => matchResult == ModalityMatchResult.noGuidelines;

  /// Get all recommendations sorted by priority
  List<ImagingRecommendation> get allRecommendations => [
        ...primaryRecommendations,
        ...alternativeRecommendations,
      ];

  /// Factory to compute the comparison result from modality and recommendations
  factory ModalityComparisonResult.compute({
    required ImagingModality selectedModality,
    required List<ImagingRecommendation> recommendations,
  }) {
    // Handle empty recommendations (no guidelines)
    if (recommendations.isEmpty) {
      return ModalityComparisonResult(
        selectedModality: selectedModality,
        matchResult: ModalityMatchResult.noGuidelines,
        primaryRecommendations: const [],
        alternativeRecommendations: const [],
      );
    }

    // Sort recommendations by priority
    final sortedRecs = List<ImagingRecommendation>.from(recommendations)
      ..sort((a, b) => a.priority.compareTo(b.priority));

    final primaryRecs =
        sortedRecs.where((r) => r.priority == 1).toList();
    final alternativeRecs =
        sortedRecs.where((r) => r.priority == 2).toList();

    // Find if the selected modality matches any recommendation
    ImagingRecommendation? matchedRec;
    ModalityMatchResult matchResult = ModalityMatchResult.notIndicated;

    for (final rec in sortedRecs) {
      if (selectedModality.matches(rec.modality)) {
        matchedRec = rec;
        if (rec.priority == 1) {
          matchResult = ModalityMatchResult.indicated;
        } else if (rec.priority == 2) {
          matchResult = ModalityMatchResult.mayBeAppropriate;
        }
        break;
      }
    }

    return ModalityComparisonResult(
      selectedModality: selectedModality,
      matchResult: matchResult,
      matchedRecommendation: matchedRec,
      primaryRecommendations: primaryRecs,
      alternativeRecommendations: alternativeRecs,
    );
  }
}
