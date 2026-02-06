import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radi_right/features/assessment/domain/enums/panel_icon.dart';
import '../../../../core/constants/app_icons.dart';

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

  String getLocalizedName(String locale) => locale == 'ar' ? nameAr : name;

  String? getLocalizedDescription(String locale) => locale == 'ar' ? descriptionAr : description;

  /// Gets the AppIcons icon data for this panel.
  /// Returns a default medical icon if iconName is not recognized.
  List<List<dynamic>> getIcon() {
    final panelIcon = PanelIcon.tryFromString(iconName);
    return panelIcon?.icon ?? AppIcons.medical;
  }
}
