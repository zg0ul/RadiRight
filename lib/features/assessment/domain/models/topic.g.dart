// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicImpl _$$TopicImplFromJson(Map<String, dynamic> json) => _$TopicImpl(
  id: json['id'] as String,
  panelId: json['panelId'] as String,
  name: json['name'] as String,
  nameAr: json['nameAr'] as String,
  description: json['description'] as String?,
  descriptionAr: json['descriptionAr'] as String?,
  rootNodeId: json['rootNodeId'] as String,
  isEnabled: json['isEnabled'] as bool? ?? true,
);

Map<String, dynamic> _$$TopicImplToJson(_$TopicImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'panelId': instance.panelId,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'description': instance.description,
      'descriptionAr': instance.descriptionAr,
      'rootNodeId': instance.rootNodeId,
      'isEnabled': instance.isEnabled,
    };
