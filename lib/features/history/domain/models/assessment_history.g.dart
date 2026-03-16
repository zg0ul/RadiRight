// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentHistoryImpl _$$AssessmentHistoryImplFromJson(
  Map<String, dynamic> json,
) => _$AssessmentHistoryImpl(
  id: json['id'] as String,
  odId: json['odId'] as String,
  topicId: json['topicId'] as String,
  topicName: json['topicName'] as String,
  startedAt: DateTime.parse(json['startedAt'] as String),
  completedAt: DateTime.parse(json['completedAt'] as String),
  answers: (json['answers'] as List<dynamic>)
      .map((e) => AnswerRecord.fromJson(e as Map<String, dynamic>))
      .toList(),
  result: json['result'] == null
      ? null
      : AssessmentResult.fromJson(json['result'] as Map<String, dynamic>),
  selectedModality: $enumDecodeNullable(
    _$ImagingModalityEnumMap,
    json['selectedModality'],
  ),
  matchResult: $enumDecodeNullable(
    _$ModalityMatchResultEnumMap,
    json['matchResult'],
  ),
);

Map<String, dynamic> _$$AssessmentHistoryImplToJson(
  _$AssessmentHistoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'odId': instance.odId,
  'topicId': instance.topicId,
  'topicName': instance.topicName,
  'startedAt': instance.startedAt.toIso8601String(),
  'completedAt': instance.completedAt.toIso8601String(),
  'answers': instance.answers,
  'result': instance.result,
  'selectedModality': _$ImagingModalityEnumMap[instance.selectedModality],
  'matchResult': _$ModalityMatchResultEnumMap[instance.matchResult],
};

const _$ImagingModalityEnumMap = {
  ImagingModality.ultrasound: 'ultrasound',
  ImagingModality.mri: 'mri',
  ImagingModality.ctScan: 'ctScan',
  ImagingModality.nuclearMedicine: 'nuclearMedicine',
  ImagingModality.petImaging: 'petImaging',
  ImagingModality.angiography: 'angiography',
  ImagingModality.mammography: 'mammography',
  ImagingModality.arthrography: 'arthrography',
  ImagingModality.xRay: 'xRay',
};

const _$ModalityMatchResultEnumMap = {
  ModalityMatchResult.indicated: 'indicated',
  ModalityMatchResult.mayBeAppropriate: 'mayBeAppropriate',
  ModalityMatchResult.notIndicated: 'notIndicated',
  ModalityMatchResult.noGuidelines: 'noGuidelines',
};
