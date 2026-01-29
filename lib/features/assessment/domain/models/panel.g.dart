// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PanelImpl _$$PanelImplFromJson(Map<String, dynamic> json) => _$PanelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  nameAr: json['nameAr'] as String,
  description: json['description'] as String?,
  descriptionAr: json['descriptionAr'] as String?,
  iconName: json['iconName'] as String?,
  isEnabled: json['isEnabled'] as bool? ?? true,
  topicCount: (json['topicCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$PanelImplToJson(_$PanelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'description': instance.description,
      'descriptionAr': instance.descriptionAr,
      'iconName': instance.iconName,
      'isEnabled': instance.isEnabled,
      'topicCount': instance.topicCount,
    };
