import 'package:freezed_annotation/freezed_annotation.dart';
import 'imaging_recommendation.dart';

part 'assessment_result.freezed.dart';
part 'assessment_result.g.dart';

@freezed
abstract class AssessmentResult with _$AssessmentResult {
  const AssessmentResult._();

  const factory AssessmentResult({
    required String topicId,
    required String topicName,
    required List<ImagingRecommendation> recommendations,
    required List<AnswerRecord> answerHistory,
    required DateTime completedAt,
    String? summary,
  }) = _AssessmentResult;

  factory AssessmentResult.fromJson(Map<String, dynamic> json) => _$AssessmentResultFromJson(json);

  List<ImagingRecommendation> get usuallyAppropriate =>
      recommendations.where((r) => r.appropriateness.name == 'usuallyAppropriate').toList();

  List<ImagingRecommendation> get mayBeAppropriate =>
      recommendations.where((r) => r.appropriateness.name == 'mayBeAppropriate').toList();

  List<ImagingRecommendation> get usuallyNotAppropriate =>
      recommendations.where((r) => r.appropriateness.name == 'usuallyNotAppropriate').toList();
}

@freezed
class AnswerRecord with _$AnswerRecord {
  const factory AnswerRecord({
    required String nodeId,
    required String questionText,
    required String selectedOptionId,
    required String selectedOptionText,
  }) = _AnswerRecord;

  factory AnswerRecord.fromJson(Map<String, dynamic> json) => _$AnswerRecordFromJson(json);
}
