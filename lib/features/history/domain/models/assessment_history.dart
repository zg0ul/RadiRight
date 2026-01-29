import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../assessment/domain/models/assessment_result.dart';

part 'assessment_history.freezed.dart';
part 'assessment_history.g.dart';

@freezed
class AssessmentHistory with _$AssessmentHistory {
  const AssessmentHistory._();

  const factory AssessmentHistory({
    required String id,
    required String odId,
    required String topicId,
    required String topicName,
    required DateTime startedAt,
    required DateTime completedAt,
    required List<AnswerRecord> answers,
    AssessmentResult? result,
  }) = _AssessmentHistory;

  factory AssessmentHistory.fromJson(Map<String, dynamic> json) =>
      _$AssessmentHistoryFromJson(json);

  Duration get duration => completedAt.difference(startedAt);

  String get formattedDate {
    return '${completedAt.day}/${completedAt.month}/${completedAt.year}';
  }

  String get formattedTime {
    final hour = completedAt.hour.toString().padLeft(2, '0');
    final minute = completedAt.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
