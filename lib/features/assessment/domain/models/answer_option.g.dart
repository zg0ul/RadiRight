// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerOptionImpl _$$AnswerOptionImplFromJson(Map<String, dynamic> json) =>
    _$AnswerOptionImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      textAr: json['textAr'] as String,
      nextNodeId: json['nextNodeId'] as String,
      description: json['description'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
    );

Map<String, dynamic> _$$AnswerOptionImplToJson(_$AnswerOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'textAr': instance.textAr,
      'nextNodeId': instance.nextNodeId,
      'description': instance.description,
      'descriptionAr': instance.descriptionAr,
    };
