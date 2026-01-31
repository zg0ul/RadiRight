import 'package:freezed_annotation/freezed_annotation.dart';

import 'navigation_rule.dart' show NavigationRule, DirectNavigation, navigationRuleFromJson;
import 'red_flag_info.dart';
import 'score_contribution.dart';

part 'answer_option.freezed.dart';

@Freezed(copyWith: false)
abstract class AnswerOption with _$AnswerOption {
  const AnswerOption._();

  const factory AnswerOption({
    required String id,
    required String text,
    required String textAr,
    required String nextNodeId,
    String? description,
    String? descriptionAr,
    NavigationRule? navigationRule,
    Map<String, dynamic>? contextData,
    RedFlagInfo? redFlag,
    ScoreContribution? scoreImpact,
  }) = _AnswerOption;

  factory AnswerOption.fromJson(Map<String, dynamic> json) {
    final nextNodeId = json['nextNodeId'] as String?;
    NavigationRule? navigationRule;
    if (json['navigationRule'] != null) {
      navigationRule = navigationRuleFromJson(json['navigationRule'] as Map<String, dynamic>);
    }
    String resolvedNextNodeId = nextNodeId ?? '';
    if (resolvedNextNodeId.isEmpty && navigationRule is DirectNavigation) {
      resolvedNextNodeId = navigationRule.nextNodeId;
    }
    return AnswerOption(
      id: json['id'] as String,
      text: json['text'] as String,
      textAr: json['textAr'] as String,
      nextNodeId: resolvedNextNodeId,
      description: json['description'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      navigationRule: navigationRule,
      contextData: json['contextData'] as Map<String, dynamic>?,
      redFlag: json['redFlag'] != null ? RedFlagInfo.fromJson(json['redFlag'] as Map<String, dynamic>) : null,
      scoreImpact: json['scoreImpact'] != null
          ? ScoreContribution.fromJson(json['scoreImpact'] as Map<String, dynamic>)
          : null,
    );
  }

  String getLocalizedText(String locale) => locale == 'ar' ? textAr : text;

  String? getLocalizedDescription(String locale) => locale == 'ar' ? descriptionAr : description;

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'textAr': textAr,
    'nextNodeId': nextNodeId,
    'description': description,
    'descriptionAr': descriptionAr,
  };
}
