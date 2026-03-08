import 'package:freezed_annotation/freezed_annotation.dart';
import 'answer_option.dart';
import 'imaging_recommendation.dart';

part 'decision_node.freezed.dart';

@freezed
sealed class DecisionNode with _$DecisionNode {
  const DecisionNode._();

  const factory DecisionNode.question({
    required String id,
    required String questionText,
    required String questionTextAr,
    required List<AnswerOption> options,
    String? hint,
    String? hintAr,
  }) = QuestionNode;

  const factory DecisionNode.result({
    required String id,
    required List<ImagingRecommendation> recommendations,
    String? summary,
    String? summaryAr,
  }) = ResultNode;

  /// Result node for scenarios where no ACR guidelines exist
  const factory DecisionNode.noGuidelines({
    required String id,
    String? summary,
    String? summaryAr,
  }) = NoGuidelinesNode;

  factory DecisionNode.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    if (type == 'question') {
      return DecisionNode.question(
        id: json['id'] as String,
        questionText: json['questionText'] as String,
        questionTextAr:
            json['questionTextAr'] as String? ?? json['questionText'] as String,
        options: (json['options'] as List<dynamic>)
            .map((e) => AnswerOption.fromJson(e as Map<String, dynamic>))
            .toList(),
        hint: json['hint'] as String?,
        hintAr: json['hintAr'] as String?,
      );
    } else if (type == 'noGuidelines') {
      return DecisionNode.noGuidelines(
        id: json['id'] as String,
        summary: json['summary'] as String?,
        summaryAr: json['summaryAr'] as String?,
      );
    } else {
      return DecisionNode.result(
        id: json['id'] as String,
        recommendations: (json['recommendations'] as List<dynamic>)
            .map((e) =>
                ImagingRecommendation.fromJson(e as Map<String, dynamic>))
            .toList(),
        summary: json['summary'] as String?,
        summaryAr: json['summaryAr'] as String?,
      );
    }
  }

  bool get isQuestion => this is QuestionNode;
  bool get isResult => this is ResultNode;
  bool get isNoGuidelines => this is NoGuidelinesNode;

  String getLocalizedQuestionText(String locale) {
    return switch (this) {
      QuestionNode(:final questionText, :final questionTextAr) =>
        locale == 'ar' ? questionTextAr : questionText,
      ResultNode() => '',
      NoGuidelinesNode() => '',
    };
  }

  String? getLocalizedHint(String locale) {
    return switch (this) {
      QuestionNode(:final hint, :final hintAr) =>
        locale == 'ar' ? hintAr : hint,
      ResultNode() => null,
      NoGuidelinesNode() => null,
    };
  }

  /// Get localized summary for result nodes
  String? getLocalizedSummary(String locale) {
    return switch (this) {
      QuestionNode() => null,
      ResultNode(:final summary, :final summaryAr) =>
        locale == 'ar' ? summaryAr : summary,
      NoGuidelinesNode(:final summary, :final summaryAr) =>
        locale == 'ar' ? summaryAr : summary,
    };
  }
}
