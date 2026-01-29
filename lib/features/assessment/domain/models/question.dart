import 'package:freezed_annotation/freezed_annotation.dart';
import 'answer_option.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
abstract class Question with _$Question {
  const Question._();

  const factory Question({
    required String id,
    required String text,
    required String textAr,
    required List<AnswerOption> options,
    String? hint,
    String? hintAr,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  String getLocalizedText(String locale) =>
      locale == 'ar' ? textAr : text;

  String? getLocalizedHint(String locale) =>
      locale == 'ar' ? hintAr : hint;
}
