import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_option.freezed.dart';
part 'answer_option.g.dart';

@freezed
abstract class AnswerOption with _$AnswerOption {
  const AnswerOption._();

  const factory AnswerOption({
    required String id,
    required String text,
    required String textAr,
    required String nextNodeId,
    String? description,
    String? descriptionAr,
  }) = _AnswerOption;

  factory AnswerOption.fromJson(Map<String, dynamic> json) =>
      _$AnswerOptionFromJson(json);

  String getLocalizedText(String locale) =>
      locale == 'ar' ? textAr : text;

  String? getLocalizedDescription(String locale) =>
      locale == 'ar' ? descriptionAr : description;
}
