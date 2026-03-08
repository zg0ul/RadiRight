// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modality_comparison_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ModalityComparisonResult {
  /// The imaging modality the doctor initially selected
  ImagingModality get selectedModality => throw _privateConstructorUsedError;

  /// The match result (indicated, mayBeAppropriate, notIndicated, noGuidelines)
  ModalityMatchResult get matchResult => throw _privateConstructorUsedError;

  /// The recommendation that matches the doctor's selection (if any)
  ImagingRecommendation? get matchedRecommendation =>
      throw _privateConstructorUsedError;

  /// The primary (priority 1) recommendation(s)
  List<ImagingRecommendation> get primaryRecommendations =>
      throw _privateConstructorUsedError;

  /// The alternative (priority 2) recommendation(s)
  List<ImagingRecommendation> get alternativeRecommendations =>
      throw _privateConstructorUsedError;

  /// AI-generated explanation (placeholder for future integration)
  String? get aiExplanation => throw _privateConstructorUsedError;

  /// AI-generated explanation in Arabic
  String? get aiExplanationAr => throw _privateConstructorUsedError;

  /// Create a copy of ModalityComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModalityComparisonResultCopyWith<ModalityComparisonResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModalityComparisonResultCopyWith<$Res> {
  factory $ModalityComparisonResultCopyWith(
    ModalityComparisonResult value,
    $Res Function(ModalityComparisonResult) then,
  ) = _$ModalityComparisonResultCopyWithImpl<$Res, ModalityComparisonResult>;
  @useResult
  $Res call({
    ImagingModality selectedModality,
    ModalityMatchResult matchResult,
    ImagingRecommendation? matchedRecommendation,
    List<ImagingRecommendation> primaryRecommendations,
    List<ImagingRecommendation> alternativeRecommendations,
    String? aiExplanation,
    String? aiExplanationAr,
  });

  $ImagingRecommendationCopyWith<$Res>? get matchedRecommendation;
}

/// @nodoc
class _$ModalityComparisonResultCopyWithImpl<
  $Res,
  $Val extends ModalityComparisonResult
>
    implements $ModalityComparisonResultCopyWith<$Res> {
  _$ModalityComparisonResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModalityComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedModality = null,
    Object? matchResult = null,
    Object? matchedRecommendation = freezed,
    Object? primaryRecommendations = null,
    Object? alternativeRecommendations = null,
    Object? aiExplanation = freezed,
    Object? aiExplanationAr = freezed,
  }) {
    return _then(
      _value.copyWith(
            selectedModality: null == selectedModality
                ? _value.selectedModality
                : selectedModality // ignore: cast_nullable_to_non_nullable
                      as ImagingModality,
            matchResult: null == matchResult
                ? _value.matchResult
                : matchResult // ignore: cast_nullable_to_non_nullable
                      as ModalityMatchResult,
            matchedRecommendation: freezed == matchedRecommendation
                ? _value.matchedRecommendation
                : matchedRecommendation // ignore: cast_nullable_to_non_nullable
                      as ImagingRecommendation?,
            primaryRecommendations: null == primaryRecommendations
                ? _value.primaryRecommendations
                : primaryRecommendations // ignore: cast_nullable_to_non_nullable
                      as List<ImagingRecommendation>,
            alternativeRecommendations: null == alternativeRecommendations
                ? _value.alternativeRecommendations
                : alternativeRecommendations // ignore: cast_nullable_to_non_nullable
                      as List<ImagingRecommendation>,
            aiExplanation: freezed == aiExplanation
                ? _value.aiExplanation
                : aiExplanation // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiExplanationAr: freezed == aiExplanationAr
                ? _value.aiExplanationAr
                : aiExplanationAr // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ModalityComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImagingRecommendationCopyWith<$Res>? get matchedRecommendation {
    if (_value.matchedRecommendation == null) {
      return null;
    }

    return $ImagingRecommendationCopyWith<$Res>(_value.matchedRecommendation!, (
      value,
    ) {
      return _then(_value.copyWith(matchedRecommendation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ModalityComparisonResultImplCopyWith<$Res>
    implements $ModalityComparisonResultCopyWith<$Res> {
  factory _$$ModalityComparisonResultImplCopyWith(
    _$ModalityComparisonResultImpl value,
    $Res Function(_$ModalityComparisonResultImpl) then,
  ) = __$$ModalityComparisonResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ImagingModality selectedModality,
    ModalityMatchResult matchResult,
    ImagingRecommendation? matchedRecommendation,
    List<ImagingRecommendation> primaryRecommendations,
    List<ImagingRecommendation> alternativeRecommendations,
    String? aiExplanation,
    String? aiExplanationAr,
  });

  @override
  $ImagingRecommendationCopyWith<$Res>? get matchedRecommendation;
}

/// @nodoc
class __$$ModalityComparisonResultImplCopyWithImpl<$Res>
    extends
        _$ModalityComparisonResultCopyWithImpl<
          $Res,
          _$ModalityComparisonResultImpl
        >
    implements _$$ModalityComparisonResultImplCopyWith<$Res> {
  __$$ModalityComparisonResultImplCopyWithImpl(
    _$ModalityComparisonResultImpl _value,
    $Res Function(_$ModalityComparisonResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ModalityComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedModality = null,
    Object? matchResult = null,
    Object? matchedRecommendation = freezed,
    Object? primaryRecommendations = null,
    Object? alternativeRecommendations = null,
    Object? aiExplanation = freezed,
    Object? aiExplanationAr = freezed,
  }) {
    return _then(
      _$ModalityComparisonResultImpl(
        selectedModality: null == selectedModality
            ? _value.selectedModality
            : selectedModality // ignore: cast_nullable_to_non_nullable
                  as ImagingModality,
        matchResult: null == matchResult
            ? _value.matchResult
            : matchResult // ignore: cast_nullable_to_non_nullable
                  as ModalityMatchResult,
        matchedRecommendation: freezed == matchedRecommendation
            ? _value.matchedRecommendation
            : matchedRecommendation // ignore: cast_nullable_to_non_nullable
                  as ImagingRecommendation?,
        primaryRecommendations: null == primaryRecommendations
            ? _value._primaryRecommendations
            : primaryRecommendations // ignore: cast_nullable_to_non_nullable
                  as List<ImagingRecommendation>,
        alternativeRecommendations: null == alternativeRecommendations
            ? _value._alternativeRecommendations
            : alternativeRecommendations // ignore: cast_nullable_to_non_nullable
                  as List<ImagingRecommendation>,
        aiExplanation: freezed == aiExplanation
            ? _value.aiExplanation
            : aiExplanation // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiExplanationAr: freezed == aiExplanationAr
            ? _value.aiExplanationAr
            : aiExplanationAr // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ModalityComparisonResultImpl extends _ModalityComparisonResult {
  const _$ModalityComparisonResultImpl({
    required this.selectedModality,
    required this.matchResult,
    this.matchedRecommendation,
    final List<ImagingRecommendation> primaryRecommendations = const [],
    final List<ImagingRecommendation> alternativeRecommendations = const [],
    this.aiExplanation,
    this.aiExplanationAr,
  }) : _primaryRecommendations = primaryRecommendations,
       _alternativeRecommendations = alternativeRecommendations,
       super._();

  /// The imaging modality the doctor initially selected
  @override
  final ImagingModality selectedModality;

  /// The match result (indicated, mayBeAppropriate, notIndicated, noGuidelines)
  @override
  final ModalityMatchResult matchResult;

  /// The recommendation that matches the doctor's selection (if any)
  @override
  final ImagingRecommendation? matchedRecommendation;

  /// The primary (priority 1) recommendation(s)
  final List<ImagingRecommendation> _primaryRecommendations;

  /// The primary (priority 1) recommendation(s)
  @override
  @JsonKey()
  List<ImagingRecommendation> get primaryRecommendations {
    if (_primaryRecommendations is EqualUnmodifiableListView)
      return _primaryRecommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_primaryRecommendations);
  }

  /// The alternative (priority 2) recommendation(s)
  final List<ImagingRecommendation> _alternativeRecommendations;

  /// The alternative (priority 2) recommendation(s)
  @override
  @JsonKey()
  List<ImagingRecommendation> get alternativeRecommendations {
    if (_alternativeRecommendations is EqualUnmodifiableListView)
      return _alternativeRecommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alternativeRecommendations);
  }

  /// AI-generated explanation (placeholder for future integration)
  @override
  final String? aiExplanation;

  /// AI-generated explanation in Arabic
  @override
  final String? aiExplanationAr;

  @override
  String toString() {
    return 'ModalityComparisonResult(selectedModality: $selectedModality, matchResult: $matchResult, matchedRecommendation: $matchedRecommendation, primaryRecommendations: $primaryRecommendations, alternativeRecommendations: $alternativeRecommendations, aiExplanation: $aiExplanation, aiExplanationAr: $aiExplanationAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModalityComparisonResultImpl &&
            (identical(other.selectedModality, selectedModality) ||
                other.selectedModality == selectedModality) &&
            (identical(other.matchResult, matchResult) ||
                other.matchResult == matchResult) &&
            (identical(other.matchedRecommendation, matchedRecommendation) ||
                other.matchedRecommendation == matchedRecommendation) &&
            const DeepCollectionEquality().equals(
              other._primaryRecommendations,
              _primaryRecommendations,
            ) &&
            const DeepCollectionEquality().equals(
              other._alternativeRecommendations,
              _alternativeRecommendations,
            ) &&
            (identical(other.aiExplanation, aiExplanation) ||
                other.aiExplanation == aiExplanation) &&
            (identical(other.aiExplanationAr, aiExplanationAr) ||
                other.aiExplanationAr == aiExplanationAr));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    selectedModality,
    matchResult,
    matchedRecommendation,
    const DeepCollectionEquality().hash(_primaryRecommendations),
    const DeepCollectionEquality().hash(_alternativeRecommendations),
    aiExplanation,
    aiExplanationAr,
  );

  /// Create a copy of ModalityComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModalityComparisonResultImplCopyWith<_$ModalityComparisonResultImpl>
  get copyWith =>
      __$$ModalityComparisonResultImplCopyWithImpl<
        _$ModalityComparisonResultImpl
      >(this, _$identity);
}

abstract class _ModalityComparisonResult extends ModalityComparisonResult {
  const factory _ModalityComparisonResult({
    required final ImagingModality selectedModality,
    required final ModalityMatchResult matchResult,
    final ImagingRecommendation? matchedRecommendation,
    final List<ImagingRecommendation> primaryRecommendations,
    final List<ImagingRecommendation> alternativeRecommendations,
    final String? aiExplanation,
    final String? aiExplanationAr,
  }) = _$ModalityComparisonResultImpl;
  const _ModalityComparisonResult._() : super._();

  /// The imaging modality the doctor initially selected
  @override
  ImagingModality get selectedModality;

  /// The match result (indicated, mayBeAppropriate, notIndicated, noGuidelines)
  @override
  ModalityMatchResult get matchResult;

  /// The recommendation that matches the doctor's selection (if any)
  @override
  ImagingRecommendation? get matchedRecommendation;

  /// The primary (priority 1) recommendation(s)
  @override
  List<ImagingRecommendation> get primaryRecommendations;

  /// The alternative (priority 2) recommendation(s)
  @override
  List<ImagingRecommendation> get alternativeRecommendations;

  /// AI-generated explanation (placeholder for future integration)
  @override
  String? get aiExplanation;

  /// AI-generated explanation in Arabic
  @override
  String? get aiExplanationAr;

  /// Create a copy of ModalityComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModalityComparisonResultImplCopyWith<_$ModalityComparisonResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}
