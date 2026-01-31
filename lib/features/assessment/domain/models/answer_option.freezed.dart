// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AnswerOption {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get textAr => throw _privateConstructorUsedError;
  String get nextNodeId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get descriptionAr => throw _privateConstructorUsedError;
  NavigationRule? get navigationRule => throw _privateConstructorUsedError;
  Map<String, dynamic>? get contextData => throw _privateConstructorUsedError;
  RedFlagInfo? get redFlag => throw _privateConstructorUsedError;
  ScoreContribution? get scoreImpact => throw _privateConstructorUsedError;
}

/// @nodoc

class _$AnswerOptionImpl extends _AnswerOption {
  const _$AnswerOptionImpl({
    required this.id,
    required this.text,
    required this.textAr,
    required this.nextNodeId,
    this.description,
    this.descriptionAr,
    this.navigationRule,
    final Map<String, dynamic>? contextData,
    this.redFlag,
    this.scoreImpact,
  }) : _contextData = contextData,
       super._();

  @override
  final String id;
  @override
  final String text;
  @override
  final String textAr;
  @override
  final String nextNodeId;
  @override
  final String? description;
  @override
  final String? descriptionAr;
  @override
  final NavigationRule? navigationRule;
  final Map<String, dynamic>? _contextData;
  @override
  Map<String, dynamic>? get contextData {
    final value = _contextData;
    if (value == null) return null;
    if (_contextData is EqualUnmodifiableMapView) return _contextData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final RedFlagInfo? redFlag;
  @override
  final ScoreContribution? scoreImpact;

  @override
  String toString() {
    return 'AnswerOption(id: $id, text: $text, textAr: $textAr, nextNodeId: $nextNodeId, description: $description, descriptionAr: $descriptionAr, navigationRule: $navigationRule, contextData: $contextData, redFlag: $redFlag, scoreImpact: $scoreImpact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.textAr, textAr) || other.textAr == textAr) &&
            (identical(other.nextNodeId, nextNodeId) ||
                other.nextNodeId == nextNodeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.navigationRule, navigationRule) ||
                other.navigationRule == navigationRule) &&
            const DeepCollectionEquality().equals(
              other._contextData,
              _contextData,
            ) &&
            (identical(other.redFlag, redFlag) || other.redFlag == redFlag) &&
            (identical(other.scoreImpact, scoreImpact) ||
                other.scoreImpact == scoreImpact));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    textAr,
    nextNodeId,
    description,
    descriptionAr,
    navigationRule,
    const DeepCollectionEquality().hash(_contextData),
    redFlag,
    scoreImpact,
  );
}

abstract class _AnswerOption extends AnswerOption {
  const factory _AnswerOption({
    required final String id,
    required final String text,
    required final String textAr,
    required final String nextNodeId,
    final String? description,
    final String? descriptionAr,
    final NavigationRule? navigationRule,
    final Map<String, dynamic>? contextData,
    final RedFlagInfo? redFlag,
    final ScoreContribution? scoreImpact,
  }) = _$AnswerOptionImpl;
  const _AnswerOption._() : super._();

  @override
  String get id;
  @override
  String get text;
  @override
  String get textAr;
  @override
  String get nextNodeId;
  @override
  String? get description;
  @override
  String? get descriptionAr;
  @override
  NavigationRule? get navigationRule;
  @override
  Map<String, dynamic>? get contextData;
  @override
  RedFlagInfo? get redFlag;
  @override
  ScoreContribution? get scoreImpact;
}
