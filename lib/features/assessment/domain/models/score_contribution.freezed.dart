// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_contribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ScoreContribution _$ScoreContributionFromJson(Map<String, dynamic> json) {
  return _ScoreContribution.fromJson(json);
}

/// @nodoc
mixin _$ScoreContribution {
  String get modalityKey => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  /// Serializes this ScoreContribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScoreContribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreContributionCopyWith<ScoreContribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreContributionCopyWith<$Res> {
  factory $ScoreContributionCopyWith(
    ScoreContribution value,
    $Res Function(ScoreContribution) then,
  ) = _$ScoreContributionCopyWithImpl<$Res, ScoreContribution>;
  @useResult
  $Res call({String modalityKey, int score});
}

/// @nodoc
class _$ScoreContributionCopyWithImpl<$Res, $Val extends ScoreContribution>
    implements $ScoreContributionCopyWith<$Res> {
  _$ScoreContributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoreContribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? modalityKey = null, Object? score = null}) {
    return _then(
      _value.copyWith(
            modalityKey: null == modalityKey
                ? _value.modalityKey
                : modalityKey // ignore: cast_nullable_to_non_nullable
                      as String,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScoreContributionImplCopyWith<$Res>
    implements $ScoreContributionCopyWith<$Res> {
  factory _$$ScoreContributionImplCopyWith(
    _$ScoreContributionImpl value,
    $Res Function(_$ScoreContributionImpl) then,
  ) = __$$ScoreContributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String modalityKey, int score});
}

/// @nodoc
class __$$ScoreContributionImplCopyWithImpl<$Res>
    extends _$ScoreContributionCopyWithImpl<$Res, _$ScoreContributionImpl>
    implements _$$ScoreContributionImplCopyWith<$Res> {
  __$$ScoreContributionImplCopyWithImpl(
    _$ScoreContributionImpl _value,
    $Res Function(_$ScoreContributionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScoreContribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? modalityKey = null, Object? score = null}) {
    return _then(
      _$ScoreContributionImpl(
        modalityKey: null == modalityKey
            ? _value.modalityKey
            : modalityKey // ignore: cast_nullable_to_non_nullable
                  as String,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreContributionImpl implements _ScoreContribution {
  const _$ScoreContributionImpl({
    required this.modalityKey,
    required this.score,
  });

  factory _$ScoreContributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreContributionImplFromJson(json);

  @override
  final String modalityKey;
  @override
  final int score;

  @override
  String toString() {
    return 'ScoreContribution(modalityKey: $modalityKey, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreContributionImpl &&
            (identical(other.modalityKey, modalityKey) ||
                other.modalityKey == modalityKey) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, modalityKey, score);

  /// Create a copy of ScoreContribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreContributionImplCopyWith<_$ScoreContributionImpl> get copyWith =>
      __$$ScoreContributionImplCopyWithImpl<_$ScoreContributionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreContributionImplToJson(this);
  }
}

abstract class _ScoreContribution implements ScoreContribution {
  const factory _ScoreContribution({
    required final String modalityKey,
    required final int score,
  }) = _$ScoreContributionImpl;

  factory _ScoreContribution.fromJson(Map<String, dynamic> json) =
      _$ScoreContributionImpl.fromJson;

  @override
  String get modalityKey;
  @override
  int get score;

  /// Create a copy of ScoreContribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreContributionImplCopyWith<_$ScoreContributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
