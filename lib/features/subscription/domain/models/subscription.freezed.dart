// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return _Subscription.fromJson(json);
}

/// @nodoc
mixin _$Subscription {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  SubscriptionTier get tier => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  bool get isTrialUsed => throw _privateConstructorUsedError;
  DateTime? get trialEndDate => throw _privateConstructorUsedError;

  /// Serializes this Subscription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
    Subscription value,
    $Res Function(Subscription) then,
  ) = _$SubscriptionCopyWithImpl<$Res, Subscription>;
  @useResult
  $Res call({
    String id,
    String userId,
    SubscriptionTier tier,
    DateTime startDate,
    DateTime endDate,
    bool isTrialUsed,
    DateTime? trialEndDate,
  });
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res, $Val extends Subscription>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? tier = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? isTrialUsed = null,
    Object? trialEndDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            tier: null == tier
                ? _value.tier
                : tier // ignore: cast_nullable_to_non_nullable
                      as SubscriptionTier,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isTrialUsed: null == isTrialUsed
                ? _value.isTrialUsed
                : isTrialUsed // ignore: cast_nullable_to_non_nullable
                      as bool,
            trialEndDate: freezed == trialEndDate
                ? _value.trialEndDate
                : trialEndDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionImplCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$SubscriptionImplCopyWith(
    _$SubscriptionImpl value,
    $Res Function(_$SubscriptionImpl) then,
  ) = __$$SubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    SubscriptionTier tier,
    DateTime startDate,
    DateTime endDate,
    bool isTrialUsed,
    DateTime? trialEndDate,
  });
}

/// @nodoc
class __$$SubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$SubscriptionImpl>
    implements _$$SubscriptionImplCopyWith<$Res> {
  __$$SubscriptionImplCopyWithImpl(
    _$SubscriptionImpl _value,
    $Res Function(_$SubscriptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? tier = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? isTrialUsed = null,
    Object? trialEndDate = freezed,
  }) {
    return _then(
      _$SubscriptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        tier: null == tier
            ? _value.tier
            : tier // ignore: cast_nullable_to_non_nullable
                  as SubscriptionTier,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isTrialUsed: null == isTrialUsed
            ? _value.isTrialUsed
            : isTrialUsed // ignore: cast_nullable_to_non_nullable
                  as bool,
        trialEndDate: freezed == trialEndDate
            ? _value.trialEndDate
            : trialEndDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionImpl extends _Subscription {
  const _$SubscriptionImpl({
    required this.id,
    required this.userId,
    required this.tier,
    required this.startDate,
    required this.endDate,
    this.isTrialUsed = false,
    this.trialEndDate,
  }) : super._();

  factory _$SubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final SubscriptionTier tier;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  @JsonKey()
  final bool isTrialUsed;
  @override
  final DateTime? trialEndDate;

  @override
  String toString() {
    return 'Subscription(id: $id, userId: $userId, tier: $tier, startDate: $startDate, endDate: $endDate, isTrialUsed: $isTrialUsed, trialEndDate: $trialEndDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isTrialUsed, isTrialUsed) ||
                other.isTrialUsed == isTrialUsed) &&
            (identical(other.trialEndDate, trialEndDate) ||
                other.trialEndDate == trialEndDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    tier,
    startDate,
    endDate,
    isTrialUsed,
    trialEndDate,
  );

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      __$$SubscriptionImplCopyWithImpl<_$SubscriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionImplToJson(this);
  }
}

abstract class _Subscription extends Subscription {
  const factory _Subscription({
    required final String id,
    required final String userId,
    required final SubscriptionTier tier,
    required final DateTime startDate,
    required final DateTime endDate,
    final bool isTrialUsed,
    final DateTime? trialEndDate,
  }) = _$SubscriptionImpl;
  const _Subscription._() : super._();

  factory _Subscription.fromJson(Map<String, dynamic> json) =
      _$SubscriptionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  SubscriptionTier get tier;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  bool get isTrialUsed;
  @override
  DateTime? get trialEndDate;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
