import 'package:freezed_annotation/freezed_annotation.dart';

part 'red_flag_info.freezed.dart';
part 'red_flag_info.g.dart';

@freezed
class RedFlagInfo with _$RedFlagInfo {
  const factory RedFlagInfo({required String category, required String severity, String? reason}) = _RedFlagInfo;

  factory RedFlagInfo.fromJson(Map<String, dynamic> json) => _$RedFlagInfoFromJson(json);
}
