import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic.freezed.dart';
part 'topic.g.dart';

@freezed
abstract class Topic with _$Topic {
  const Topic._();

  const factory Topic({
    required String id,
    required String panelId,
    required String name,
    required String nameAr,
    String? description,
    String? descriptionAr,
    required String rootNodeId,
    @Default(true) bool isEnabled,
  }) = _Topic;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  String getLocalizedName(String locale) =>
      locale == 'ar' ? nameAr : name;

  String? getLocalizedDescription(String locale) =>
      locale == 'ar' ? descriptionAr : description;
}
