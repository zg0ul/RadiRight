// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentResultImpl _$$AssessmentResultImplFromJson(
  Map<String, dynamic> json,
) => _$AssessmentResultImpl(
  topicId: json['topicId'] as String,
  topicName: json['topicName'] as String,
  recommendations: (json['recommendations'] as List<dynamic>)
      .map((e) => ImagingRecommendation.fromJson(e as Map<String, dynamic>))
      .toList(),
  answerHistory: (json['answerHistory'] as List<dynamic>)
      .map((e) => AnswerRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
  completedAt: DateTime.parse(json['completedAt'] as String),
  summary: json['summary'] as String?,
);

Map<String, dynamic> _$$AssessmentResultImplToJson(
  _$AssessmentResultImpl instance,
) => <String, dynamic>{
  'topicId': instance.topicId,
  'topicName': instance.topicName,
  'recommendations': instance.recommendations,
  'answerHistory': instance.answerHistory,
  'completedAt': instance.completedAt.toIso8601String(),
  'summary': instance.summary,
};

_$AnswerRecordImpl _$$AnswerRecordImplFromJson(Map<String, dynamic> json) =>
    _$AnswerRecordImpl(
      nodeId: json['nodeId'] as String,
      questionText: json['questionText'] as String,
      selectedOptionId: json['selectedOptionId'] as String,
      selectedOptionText: json['selectedOptionText'] as String,
    );

Map<String, dynamic> _$$AnswerRecordImplToJson(_$AnswerRecordImpl instance) =>
    <String, dynamic>{
      'nodeId': instance.nodeId,
      'questionText': instance.questionText,
      'selectedOptionId': instance.selectedOptionId,
      'selectedOptionText': instance.selectedOptionText,
    };
