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

AnswerOption _$AnswerOptionFromJson(Map<String, dynamic> json) {
  return _AnswerOption.fromJson(json);
}

/// @nodoc
mixin _$AnswerOption {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get textAr => throw _privateConstructorUsedError;
  String get nextNodeId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get descriptionAr => throw _privateConstructorUsedError;

  /// Serializes this AnswerOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerOptionCopyWith<AnswerOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerOptionCopyWith<$Res> {
  factory $AnswerOptionCopyWith(
    AnswerOption value,
    $Res Function(AnswerOption) then,
  ) = _$AnswerOptionCopyWithImpl<$Res, AnswerOption>;
  @useResult
  $Res call({
    String id,
    String text,
    String textAr,
    String nextNodeId,
    String? description,
    String? descriptionAr,
  });
}

/// @nodoc
class _$AnswerOptionCopyWithImpl<$Res, $Val extends AnswerOption>
    implements $AnswerOptionCopyWith<$Res> {
  _$AnswerOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? textAr = null,
    Object? nextNodeId = null,
    Object? description = freezed,
    Object? descriptionAr = freezed,
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
            nextNodeId: null == nextNodeId
                ? _value.nextNodeId
                : nextNodeId // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            descriptionAr: freezed == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnswerOptionImplCopyWith<$Res>
    implements $AnswerOptionCopyWith<$Res> {
  factory _$$AnswerOptionImplCopyWith(
    _$AnswerOptionImpl value,
    $Res Function(_$AnswerOptionImpl) then,
  ) = __$$AnswerOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    String textAr,
    String nextNodeId,
    String? description,
    String? descriptionAr,
  });
}

/// @nodoc
class __$$AnswerOptionImplCopyWithImpl<$Res>
    extends _$AnswerOptionCopyWithImpl<$Res, _$AnswerOptionImpl>
    implements _$$AnswerOptionImplCopyWith<$Res> {
  __$$AnswerOptionImplCopyWithImpl(
    _$AnswerOptionImpl _value,
    $Res Function(_$AnswerOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? textAr = null,
    Object? nextNodeId = null,
    Object? description = freezed,
    Object? descriptionAr = freezed,
  }) {
    return _then(
      _$AnswerOptionImpl(
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
        nextNodeId: null == nextNodeId
            ? _value.nextNodeId
            : nextNodeId // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        descriptionAr: freezed == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerOptionImpl extends _AnswerOption {
  const _$AnswerOptionImpl({
    required this.id,
    required this.text,
    required this.textAr,
    required this.nextNodeId,
    this.description,
    this.descriptionAr,
  }) : super._();

  factory _$AnswerOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerOptionImplFromJson(json);

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
  String toString() {
    return 'AnswerOption(id: $id, text: $text, textAr: $textAr, nextNodeId: $nextNodeId, description: $description, descriptionAr: $descriptionAr)';
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
                other.descriptionAr == descriptionAr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    textAr,
    nextNodeId,
    description,
    descriptionAr,
  );

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerOptionImplCopyWith<_$AnswerOptionImpl> get copyWith =>
      __$$AnswerOptionImplCopyWithImpl<_$AnswerOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerOptionImplToJson(this);
  }
}

abstract class _AnswerOption extends AnswerOption {
  const factory _AnswerOption({
    required final String id,
    required final String text,
    required final String textAr,
    required final String nextNodeId,
    final String? description,
    final String? descriptionAr,
  }) = _$AnswerOptionImpl;
  const _AnswerOption._() : super._();

  factory _AnswerOption.fromJson(Map<String, dynamic> json) =
      _$AnswerOptionImpl.fromJson;

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

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerOptionImplCopyWith<_$AnswerOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
