// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AssessmentResult _$AssessmentResultFromJson(Map<String, dynamic> json) {
  return _AssessmentResult.fromJson(json);
}

/// @nodoc
mixin _$AssessmentResult {
  String get topicId => throw _privateConstructorUsedError;
  String get topicName => throw _privateConstructorUsedError;
  List<ImagingRecommendation> get recommendations =>
      throw _privateConstructorUsedError;
  List<AnswerRecord> get answerHistory => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;

  /// Serializes this AssessmentResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentResultCopyWith<AssessmentResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentResultCopyWith<$Res> {
  factory $AssessmentResultCopyWith(
    AssessmentResult value,
    $Res Function(AssessmentResult) then,
  ) = _$AssessmentResultCopyWithImpl<$Res, AssessmentResult>;
  @useResult
  $Res call({
    String topicId,
    String topicName,
    List<ImagingRecommendation> recommendations,
    List<AnswerRecord> answerHistory,
    DateTime completedAt,
    String? summary,
  });
}

/// @nodoc
class _$AssessmentResultCopyWithImpl<$Res, $Val extends AssessmentResult>
    implements $AssessmentResultCopyWith<$Res> {
  _$AssessmentResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicId = null,
    Object? topicName = null,
    Object? recommendations = null,
    Object? answerHistory = null,
    Object? completedAt = null,
    Object? summary = freezed,
  }) {
    return _then(
      _value.copyWith(
            topicId: null == topicId
                ? _value.topicId
                : topicId // ignore: cast_nullable_to_non_nullable
                      as String,
            topicName: null == topicName
                ? _value.topicName
                : topicName // ignore: cast_nullable_to_non_nullable
                      as String,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<ImagingRecommendation>,
            answerHistory: null == answerHistory
                ? _value.answerHistory
                : answerHistory // ignore: cast_nullable_to_non_nullable
                      as List<AnswerRecord>,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssessmentResultImplCopyWith<$Res>
    implements $AssessmentResultCopyWith<$Res> {
  factory _$$AssessmentResultImplCopyWith(
    _$AssessmentResultImpl value,
    $Res Function(_$AssessmentResultImpl) then,
  ) = __$$AssessmentResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String topicId,
    String topicName,
    List<ImagingRecommendation> recommendations,
    List<AnswerRecord> answerHistory,
    DateTime completedAt,
    String? summary,
  });
}

/// @nodoc
class __$$AssessmentResultImplCopyWithImpl<$Res>
    extends _$AssessmentResultCopyWithImpl<$Res, _$AssessmentResultImpl>
    implements _$$AssessmentResultImplCopyWith<$Res> {
  __$$AssessmentResultImplCopyWithImpl(
    _$AssessmentResultImpl _value,
    $Res Function(_$AssessmentResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AssessmentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicId = null,
    Object? topicName = null,
    Object? recommendations = null,
    Object? answerHistory = null,
    Object? completedAt = null,
    Object? summary = freezed,
  }) {
    return _then(
      _$AssessmentResultImpl(
        topicId: null == topicId
            ? _value.topicId
            : topicId // ignore: cast_nullable_to_non_nullable
                  as String,
        topicName: null == topicName
            ? _value.topicName
            : topicName // ignore: cast_nullable_to_non_nullable
                  as String,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<ImagingRecommendation>,
        answerHistory: null == answerHistory
            ? _value._answerHistory
            : answerHistory // ignore: cast_nullable_to_non_nullable
                  as List<AnswerRecord>,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentResultImpl extends _AssessmentResult {
  const _$AssessmentResultImpl({
    required this.topicId,
    required this.topicName,
    required final List<ImagingRecommendation> recommendations,
    required final List<AnswerRecord> answerHistory,
    required this.completedAt,
    this.summary,
  }) : _recommendations = recommendations,
       _answerHistory = answerHistory,
       super._();

  factory _$AssessmentResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentResultImplFromJson(json);

  @override
  final String topicId;
  @override
  final String topicName;
  final List<ImagingRecommendation> _recommendations;
  @override
  List<ImagingRecommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  final List<AnswerRecord> _answerHistory;
  @override
  List<AnswerRecord> get answerHistory {
    if (_answerHistory is EqualUnmodifiableListView) return _answerHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerHistory);
  }

  @override
  final DateTime completedAt;
  @override
  final String? summary;

  @override
  String toString() {
    return 'AssessmentResult(topicId: $topicId, topicName: $topicName, recommendations: $recommendations, answerHistory: $answerHistory, completedAt: $completedAt, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentResultImpl &&
            (identical(other.topicId, topicId) || other.topicId == topicId) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            const DeepCollectionEquality().equals(
              other._answerHistory,
              _answerHistory,
            ) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    topicId,
    topicName,
    const DeepCollectionEquality().hash(_recommendations),
    const DeepCollectionEquality().hash(_answerHistory),
    completedAt,
    summary,
  );

  /// Create a copy of AssessmentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentResultImplCopyWith<_$AssessmentResultImpl> get copyWith =>
      __$$AssessmentResultImplCopyWithImpl<_$AssessmentResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentResultImplToJson(this);
  }
}

abstract class _AssessmentResult extends AssessmentResult {
  const factory _AssessmentResult({
    required final String topicId,
    required final String topicName,
    required final List<ImagingRecommendation> recommendations,
    required final List<AnswerRecord> answerHistory,
    required final DateTime completedAt,
    final String? summary,
  }) = _$AssessmentResultImpl;
  const _AssessmentResult._() : super._();

  factory _AssessmentResult.fromJson(Map<String, dynamic> json) =
      _$AssessmentResultImpl.fromJson;

  @override
  String get topicId;
  @override
  String get topicName;
  @override
  List<ImagingRecommendation> get recommendations;
  @override
  List<AnswerRecord> get answerHistory;
  @override
  DateTime get completedAt;
  @override
  String? get summary;

  /// Create a copy of AssessmentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentResultImplCopyWith<_$AssessmentResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerRecord _$AnswerRecordFromJson(Map<String, dynamic> json) {
  return _AnswerRecord.fromJson(json);
}

/// @nodoc
mixin _$AnswerRecord {
  String get nodeId => throw _privateConstructorUsedError;
  String get questionText => throw _privateConstructorUsedError;
  String get selectedOptionId => throw _privateConstructorUsedError;
  String get selectedOptionText => throw _privateConstructorUsedError;

  /// Serializes this AnswerRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerRecordCopyWith<AnswerRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerRecordCopyWith<$Res> {
  factory $AnswerRecordCopyWith(
    AnswerRecord value,
    $Res Function(AnswerRecord) then,
  ) = _$AnswerRecordCopyWithImpl<$Res, AnswerRecord>;
  @useResult
  $Res call({
    String nodeId,
    String questionText,
    String selectedOptionId,
    String selectedOptionText,
  });
}

/// @nodoc
class _$AnswerRecordCopyWithImpl<$Res, $Val extends AnswerRecord>
    implements $AnswerRecordCopyWith<$Res> {
  _$AnswerRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodeId = null,
    Object? questionText = null,
    Object? selectedOptionId = null,
    Object? selectedOptionText = null,
  }) {
    return _then(
      _value.copyWith(
            nodeId: null == nodeId
                ? _value.nodeId
                : nodeId // ignore: cast_nullable_to_non_nullable
                      as String,
            questionText: null == questionText
                ? _value.questionText
                : questionText // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedOptionId: null == selectedOptionId
                ? _value.selectedOptionId
                : selectedOptionId // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedOptionText: null == selectedOptionText
                ? _value.selectedOptionText
                : selectedOptionText // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnswerRecordImplCopyWith<$Res>
    implements $AnswerRecordCopyWith<$Res> {
  factory _$$AnswerRecordImplCopyWith(
    _$AnswerRecordImpl value,
    $Res Function(_$AnswerRecordImpl) then,
  ) = __$$AnswerRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String nodeId,
    String questionText,
    String selectedOptionId,
    String selectedOptionText,
  });
}

/// @nodoc
class __$$AnswerRecordImplCopyWithImpl<$Res>
    extends _$AnswerRecordCopyWithImpl<$Res, _$AnswerRecordImpl>
    implements _$$AnswerRecordImplCopyWith<$Res> {
  __$$AnswerRecordImplCopyWithImpl(
    _$AnswerRecordImpl _value,
    $Res Function(_$AnswerRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnswerRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodeId = null,
    Object? questionText = null,
    Object? selectedOptionId = null,
    Object? selectedOptionText = null,
  }) {
    return _then(
      _$AnswerRecordImpl(
        nodeId: null == nodeId
            ? _value.nodeId
            : nodeId // ignore: cast_nullable_to_non_nullable
                  as String,
        questionText: null == questionText
            ? _value.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedOptionId: null == selectedOptionId
            ? _value.selectedOptionId
            : selectedOptionId // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedOptionText: null == selectedOptionText
            ? _value.selectedOptionText
            : selectedOptionText // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerRecordImpl implements _AnswerRecord {
  const _$AnswerRecordImpl({
    required this.nodeId,
    required this.questionText,
    required this.selectedOptionId,
    required this.selectedOptionText,
  });

  factory _$AnswerRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerRecordImplFromJson(json);

  @override
  final String nodeId;
  @override
  final String questionText;
  @override
  final String selectedOptionId;
  @override
  final String selectedOptionText;

  @override
  String toString() {
    return 'AnswerRecord(nodeId: $nodeId, questionText: $questionText, selectedOptionId: $selectedOptionId, selectedOptionText: $selectedOptionText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerRecordImpl &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.selectedOptionId, selectedOptionId) ||
                other.selectedOptionId == selectedOptionId) &&
            (identical(other.selectedOptionText, selectedOptionText) ||
                other.selectedOptionText == selectedOptionText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    nodeId,
    questionText,
    selectedOptionId,
    selectedOptionText,
  );

  /// Create a copy of AnswerRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerRecordImplCopyWith<_$AnswerRecordImpl> get copyWith =>
      __$$AnswerRecordImplCopyWithImpl<_$AnswerRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerRecordImplToJson(this);
  }
}

abstract class _AnswerRecord implements AnswerRecord {
  const factory _AnswerRecord({
    required final String nodeId,
    required final String questionText,
    required final String selectedOptionId,
    required final String selectedOptionText,
  }) = _$AnswerRecordImpl;

  factory _AnswerRecord.fromJson(Map<String, dynamic> json) =
      _$AnswerRecordImpl.fromJson;

  @override
  String get nodeId;
  @override
  String get questionText;
  @override
  String get selectedOptionId;
  @override
  String get selectedOptionText;

  /// Create a copy of AnswerRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerRecordImplCopyWith<_$AnswerRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
