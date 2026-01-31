import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_rule.freezed.dart';

enum ComparisonOperator { equals, notEquals, greaterThan, lessThan, greaterOrEqual, lessOrEqual, contains, anyOf }

@freezed
class NavigationCondition with _$NavigationCondition {
  const factory NavigationCondition({
    required String contextKey,
    required ComparisonOperator operator,
    required dynamic value,
    required String targetNodeId,
  }) = _NavigationCondition;

  factory NavigationCondition.fromJson(Map<String, dynamic> json) {
    final opStr = json['operator'] as String? ?? 'equals';
    final op = ComparisonOperator.values.firstWhere((e) => e.name == opStr, orElse: () => ComparisonOperator.equals);
    return NavigationCondition(
      contextKey: json['contextKey'] as String,
      operator: op,
      value: json['value'],
      targetNodeId: json['targetNodeId'] as String,
    );
  }
}

@freezed
sealed class NavigationRule with _$NavigationRule {
  const NavigationRule._();

  const factory NavigationRule.direct({required String nextNodeId}) = DirectNavigation;

  const factory NavigationRule.conditional({
    required List<NavigationCondition> conditions,
    required String defaultNodeId,
  }) = ConditionalNavigation;

  const factory NavigationRule.computed({required String computationKey, Map<String, dynamic>? parameters}) =
      ComputedNavigation;
}

NavigationRule navigationRuleFromJson(Map<String, dynamic> json) {
  final type = json['type'] as String? ?? 'direct';
  switch (type) {
    case 'direct':
      return NavigationRule.direct(nextNodeId: json['nextNodeId'] as String);
    case 'conditional':
      return NavigationRule.conditional(
        conditions:
            (json['conditions'] as List<dynamic>?)
                ?.map((e) => NavigationCondition.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        defaultNodeId: json['defaultNodeId'] as String,
      );
    case 'computed':
      return NavigationRule.computed(
        computationKey: json['computationKey'] as String,
        parameters: json['parameters'] as Map<String, dynamic>?,
      );
    default:
      return NavigationRule.direct(nextNodeId: json['nextNodeId'] as String);
  }
}
