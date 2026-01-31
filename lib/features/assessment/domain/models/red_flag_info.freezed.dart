// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'red_flag_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RedFlagInfo _$RedFlagInfoFromJson(Map<String, dynamic> json) {
  return _RedFlagInfo.fromJson(json);
}

/// @nodoc
mixin _$RedFlagInfo {
  String get category => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this RedFlagInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RedFlagInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RedFlagInfoCopyWith<RedFlagInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedFlagInfoCopyWith<$Res> {
  factory $RedFlagInfoCopyWith(
    RedFlagInfo value,
    $Res Function(RedFlagInfo) then,
  ) = _$RedFlagInfoCopyWithImpl<$Res, RedFlagInfo>;
  @useResult
  $Res call({String category, String severity, String? reason});
}

/// @nodoc
class _$RedFlagInfoCopyWithImpl<$Res, $Val extends RedFlagInfo>
    implements $RedFlagInfoCopyWith<$Res> {
  _$RedFlagInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RedFlagInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? severity = null,
    Object? reason = freezed,
  }) {
    return _then(
      _value.copyWith(
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RedFlagInfoImplCopyWith<$Res>
    implements $RedFlagInfoCopyWith<$Res> {
  factory _$$RedFlagInfoImplCopyWith(
    _$RedFlagInfoImpl value,
    $Res Function(_$RedFlagInfoImpl) then,
  ) = __$$RedFlagInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, String severity, String? reason});
}

/// @nodoc
class __$$RedFlagInfoImplCopyWithImpl<$Res>
    extends _$RedFlagInfoCopyWithImpl<$Res, _$RedFlagInfoImpl>
    implements _$$RedFlagInfoImplCopyWith<$Res> {
  __$$RedFlagInfoImplCopyWithImpl(
    _$RedFlagInfoImpl _value,
    $Res Function(_$RedFlagInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RedFlagInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? severity = null,
    Object? reason = freezed,
  }) {
    return _then(
      _$RedFlagInfoImpl(
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RedFlagInfoImpl implements _RedFlagInfo {
  const _$RedFlagInfoImpl({
    required this.category,
    required this.severity,
    this.reason,
  });

  factory _$RedFlagInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RedFlagInfoImplFromJson(json);

  @override
  final String category;
  @override
  final String severity;
  @override
  final String? reason;

  @override
  String toString() {
    return 'RedFlagInfo(category: $category, severity: $severity, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedFlagInfoImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, severity, reason);

  /// Create a copy of RedFlagInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedFlagInfoImplCopyWith<_$RedFlagInfoImpl> get copyWith =>
      __$$RedFlagInfoImplCopyWithImpl<_$RedFlagInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RedFlagInfoImplToJson(this);
  }
}

abstract class _RedFlagInfo implements RedFlagInfo {
  const factory _RedFlagInfo({
    required final String category,
    required final String severity,
    final String? reason,
  }) = _$RedFlagInfoImpl;

  factory _RedFlagInfo.fromJson(Map<String, dynamic> json) =
      _$RedFlagInfoImpl.fromJson;

  @override
  String get category;
  @override
  String get severity;
  @override
  String? get reason;

  /// Create a copy of RedFlagInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedFlagInfoImplCopyWith<_$RedFlagInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
