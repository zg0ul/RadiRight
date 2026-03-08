// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imaging_recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ImagingRecommendation {
  String get modality => throw _privateConstructorUsedError;
  String get modalityAr => throw _privateConstructorUsedError;
  String get procedure => throw _privateConstructorUsedError;
  String get procedureAr => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  String? get commentsAr => throw _privateConstructorUsedError;

  /// Priority level for the recommendation.
  /// 1 = primary/best choice (Option 1)
  /// 2 = acceptable alternative (Option 2)
  /// Higher numbers = lower priority
  int get priority => throw _privateConstructorUsedError;

  /// Create a copy of ImagingRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImagingRecommendationCopyWith<ImagingRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagingRecommendationCopyWith<$Res> {
  factory $ImagingRecommendationCopyWith(
    ImagingRecommendation value,
    $Res Function(ImagingRecommendation) then,
  ) = _$ImagingRecommendationCopyWithImpl<$Res, ImagingRecommendation>;
  @useResult
  $Res call({
    String modality,
    String modalityAr,
    String procedure,
    String procedureAr,
    String? comments,
    String? commentsAr,
    int priority,
  });
}

/// @nodoc
class _$ImagingRecommendationCopyWithImpl<
  $Res,
  $Val extends ImagingRecommendation
>
    implements $ImagingRecommendationCopyWith<$Res> {
  _$ImagingRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImagingRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modality = null,
    Object? modalityAr = null,
    Object? procedure = null,
    Object? procedureAr = null,
    Object? comments = freezed,
    Object? commentsAr = freezed,
    Object? priority = null,
  }) {
    return _then(
      _value.copyWith(
            modality: null == modality
                ? _value.modality
                : modality // ignore: cast_nullable_to_non_nullable
                      as String,
            modalityAr: null == modalityAr
                ? _value.modalityAr
                : modalityAr // ignore: cast_nullable_to_non_nullable
                      as String,
            procedure: null == procedure
                ? _value.procedure
                : procedure // ignore: cast_nullable_to_non_nullable
                      as String,
            procedureAr: null == procedureAr
                ? _value.procedureAr
                : procedureAr // ignore: cast_nullable_to_non_nullable
                      as String,
            comments: freezed == comments
                ? _value.comments
                : comments // ignore: cast_nullable_to_non_nullable
                      as String?,
            commentsAr: freezed == commentsAr
                ? _value.commentsAr
                : commentsAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImagingRecommendationImplCopyWith<$Res>
    implements $ImagingRecommendationCopyWith<$Res> {
  factory _$$ImagingRecommendationImplCopyWith(
    _$ImagingRecommendationImpl value,
    $Res Function(_$ImagingRecommendationImpl) then,
  ) = __$$ImagingRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String modality,
    String modalityAr,
    String procedure,
    String procedureAr,
    String? comments,
    String? commentsAr,
    int priority,
  });
}

/// @nodoc
class __$$ImagingRecommendationImplCopyWithImpl<$Res>
    extends
        _$ImagingRecommendationCopyWithImpl<$Res, _$ImagingRecommendationImpl>
    implements _$$ImagingRecommendationImplCopyWith<$Res> {
  __$$ImagingRecommendationImplCopyWithImpl(
    _$ImagingRecommendationImpl _value,
    $Res Function(_$ImagingRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImagingRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modality = null,
    Object? modalityAr = null,
    Object? procedure = null,
    Object? procedureAr = null,
    Object? comments = freezed,
    Object? commentsAr = freezed,
    Object? priority = null,
  }) {
    return _then(
      _$ImagingRecommendationImpl(
        modality: null == modality
            ? _value.modality
            : modality // ignore: cast_nullable_to_non_nullable
                  as String,
        modalityAr: null == modalityAr
            ? _value.modalityAr
            : modalityAr // ignore: cast_nullable_to_non_nullable
                  as String,
        procedure: null == procedure
            ? _value.procedure
            : procedure // ignore: cast_nullable_to_non_nullable
                  as String,
        procedureAr: null == procedureAr
            ? _value.procedureAr
            : procedureAr // ignore: cast_nullable_to_non_nullable
                  as String,
        comments: freezed == comments
            ? _value.comments
            : comments // ignore: cast_nullable_to_non_nullable
                  as String?,
        commentsAr: freezed == commentsAr
            ? _value.commentsAr
            : commentsAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ImagingRecommendationImpl extends _ImagingRecommendation {
  const _$ImagingRecommendationImpl({
    required this.modality,
    required this.modalityAr,
    required this.procedure,
    required this.procedureAr,
    this.comments,
    this.commentsAr,
    this.priority = 1,
  }) : super._();

  @override
  final String modality;
  @override
  final String modalityAr;
  @override
  final String procedure;
  @override
  final String procedureAr;
  @override
  final String? comments;
  @override
  final String? commentsAr;

  /// Priority level for the recommendation.
  /// 1 = primary/best choice (Option 1)
  /// 2 = acceptable alternative (Option 2)
  /// Higher numbers = lower priority
  @override
  @JsonKey()
  final int priority;

  @override
  String toString() {
    return 'ImagingRecommendation(modality: $modality, modalityAr: $modalityAr, procedure: $procedure, procedureAr: $procedureAr, comments: $comments, commentsAr: $commentsAr, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagingRecommendationImpl &&
            (identical(other.modality, modality) ||
                other.modality == modality) &&
            (identical(other.modalityAr, modalityAr) ||
                other.modalityAr == modalityAr) &&
            (identical(other.procedure, procedure) ||
                other.procedure == procedure) &&
            (identical(other.procedureAr, procedureAr) ||
                other.procedureAr == procedureAr) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.commentsAr, commentsAr) ||
                other.commentsAr == commentsAr) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    modality,
    modalityAr,
    procedure,
    procedureAr,
    comments,
    commentsAr,
    priority,
  );

  /// Create a copy of ImagingRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagingRecommendationImplCopyWith<_$ImagingRecommendationImpl>
  get copyWith =>
      __$$ImagingRecommendationImplCopyWithImpl<_$ImagingRecommendationImpl>(
        this,
        _$identity,
      );
}

abstract class _ImagingRecommendation extends ImagingRecommendation {
  const factory _ImagingRecommendation({
    required final String modality,
    required final String modalityAr,
    required final String procedure,
    required final String procedureAr,
    final String? comments,
    final String? commentsAr,
    final int priority,
  }) = _$ImagingRecommendationImpl;
  const _ImagingRecommendation._() : super._();

  @override
  String get modality;
  @override
  String get modalityAr;
  @override
  String get procedure;
  @override
  String get procedureAr;
  @override
  String? get comments;
  @override
  String? get commentsAr;

  /// Priority level for the recommendation.
  /// 1 = primary/best choice (Option 1)
  /// 2 = acceptable alternative (Option 2)
  /// Higher numbers = lower priority
  @override
  int get priority;

  /// Create a copy of ImagingRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImagingRecommendationImplCopyWith<_$ImagingRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}
