// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'red_flag_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RedFlagInfoImpl _$$RedFlagInfoImplFromJson(Map<String, dynamic> json) =>
    _$RedFlagInfoImpl(
      category: json['category'] as String,
      severity: json['severity'] as String,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$RedFlagInfoImplToJson(_$RedFlagInfoImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'severity': instance.severity,
      'reason': instance.reason,
    };
