import 'package:freezed_annotation/freezed_annotation.dart';

part 'panel.freezed.dart';
part 'panel.g.dart';

@freezed
abstract class Panel with _$Panel {
  const Panel._();

  const factory Panel({
    required String id,
    required String name,
    required String nameAr,
    String? description,
    String? descriptionAr,
    String? iconName,
    @Default(true) bool isEnabled,
    @Default(0) int topicCount,
  }) = _Panel;

  factory Panel.fromJson(Map<String, dynamic> json) => _$PanelFromJson(json);

  String getLocalizedName(String locale) =>
      locale == 'ar' ? nameAr : name;

  String? getLocalizedDescription(String locale) =>
      locale == 'ar' ? descriptionAr : description;
}
