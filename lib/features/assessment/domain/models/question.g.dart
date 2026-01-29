// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      textAr: json['textAr'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => AnswerOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      hint: json['hint'] as String?,
      hintAr: json['hintAr'] as String?,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'textAr': instance.textAr,
      'options': instance.options,
      'hint': instance.hint,
      'hintAr': instance.hintAr,
    };
