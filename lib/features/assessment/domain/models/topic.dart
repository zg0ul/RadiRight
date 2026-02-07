import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/constants/app_icons.dart';
import '../enums/topic_icon.dart';

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
    int? questionCount,
    String? iconName,
  }) = _Topic;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  String getLocalizedName(String locale) =>
      locale == 'ar' ? nameAr : name;

  String? getLocalizedDescription(String locale) =>
      locale == 'ar' ? descriptionAr : description;

  /// Gets the AppIcons icon data for this topic.
  /// Falls back to inferring from panelId if iconName is not set.
  List<List<dynamic>> getIcon() {
    // First try to use the explicit iconName
    final topicIcon = TopicIcon.tryFromString(iconName);
    if (topicIcon != null) {
      return topicIcon.icon;
    }

    // Fallback: infer from panelId
    switch (panelId.toLowerCase()) {
      case 'msk':
        return AppIcons.bone;
      case 'chest':
        return AppIcons.lungs;
      case 'neuro':
        return AppIcons.brain;
      case 'cardiac':
        return AppIcons.heart;
      case 'abdominal':
        return AppIcons.kidneys;
      case 'pediatric':
        return AppIcons.baby;
      default:
        return AppIcons.medical;
    }
  }
}
