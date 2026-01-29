// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get textAr => throw _privateConstructorUsedError;
  List<AnswerOption> get options => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  String? get hintAr => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call({
    String id,
    String text,
    String textAr,
    List<AnswerOption> options,
    String? hint,
    String? hintAr,
  });
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? textAr = null,
    Object? options = null,
    Object? hint = freezed,
    Object? hintAr = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            textAr: null == textAr
                ? _value.textAr
                : textAr // ignore: cast_nullable_to_non_nullable
                      as String,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<AnswerOption>,
            hint: freezed == hint
                ? _value.hint
                : hint // ignore: cast_nullable_to_non_nullable
                      as String?,
            hintAr: freezed == hintAr
                ? _value.hintAr
                : hintAr // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
    _$QuestionImpl value,
    $Res Function(_$QuestionImpl) then,
  ) = __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    String textAr,
    List<AnswerOption> options,
    String? hint,
    String? hintAr,
  });
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
    _$QuestionImpl _value,
    $Res Function(_$QuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? textAr = null,
    Object? options = null,
    Object? hint = freezed,
    Object? hintAr = freezed,
  }) {
    return _then(
      _$QuestionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        textAr: null == textAr
            ? _value.textAr
            : textAr // ignore: cast_nullable_to_non_nullable
                  as String,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<AnswerOption>,
        hint: freezed == hint
            ? _value.hint
            : hint // ignore: cast_nullable_to_non_nullable
                  as String?,
        hintAr: freezed == hintAr
            ? _value.hintAr
            : hintAr // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl extends _Question {
  const _$QuestionImpl({
    required this.id,
    required this.text,
    required this.textAr,
    required final List<AnswerOption> options,
    this.hint,
    this.hintAr,
  }) : _options = options,
       super._();

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String textAr;
  final List<AnswerOption> _options;
  @override
  List<AnswerOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final String? hint;
  @override
  final String? hintAr;

  @override
  String toString() {
    return 'Question(id: $id, text: $text, textAr: $textAr, options: $options, hint: $hint, hintAr: $hintAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.textAr, textAr) || other.textAr == textAr) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.hintAr, hintAr) || other.hintAr == hintAr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    textAr,
    const DeepCollectionEquality().hash(_options),
    hint,
    hintAr,
  );

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(this);
  }
}

abstract class _Question extends Question {
  const factory _Question({
    required final String id,
    required final String text,
    required final String textAr,
    required final List<AnswerOption> options,
    final String? hint,
    final String? hintAr,
  }) = _$QuestionImpl;
  const _Question._() : super._();

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String get textAr;
  @override
  List<AnswerOption> get options;
  @override
  String? get hint;
  @override
  String? get hintAr;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
