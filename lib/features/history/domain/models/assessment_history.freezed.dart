// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AssessmentHistory _$AssessmentHistoryFromJson(Map<String, dynamic> json) {
  return _AssessmentHistory.fromJson(json);
}

/// @nodoc
mixin _$AssessmentHistory {
  String get id => throw _privateConstructorUsedError;
  String get odId => throw _privateConstructorUsedError;
  String get topicId => throw _privateConstructorUsedError;
  String get topicName => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;
  List<AnswerRecord> get answers => throw _privateConstructorUsedError;
  AssessmentResult? get result => throw _privateConstructorUsedError;

  /// Serializes this AssessmentHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentHistoryCopyWith<AssessmentHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentHistoryCopyWith<$Res> {
  factory $AssessmentHistoryCopyWith(
    AssessmentHistory value,
    $Res Function(AssessmentHistory) then,
  ) = _$AssessmentHistoryCopyWithImpl<$Res, AssessmentHistory>;
  @useResult
  $Res call({
    String id,
    String odId,
    String topicId,
    String topicName,
    DateTime startedAt,
    DateTime completedAt,
    List<AnswerRecord> answers,
    AssessmentResult? result,
  });

  $AssessmentResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$AssessmentHistoryCopyWithImpl<$Res, $Val extends AssessmentHistory>
    implements $AssessmentHistoryCopyWith<$Res> {
  _$AssessmentHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? odId = null,
    Object? topicId = null,
    Object? topicName = null,
    Object? startedAt = null,
    Object? completedAt = null,
    Object? answers = null,
    Object? result = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            odId: null == odId
                ? _value.odId
                : odId // ignore: cast_nullable_to_non_nullable
                      as String,
            topicId: null == topicId
                ? _value.topicId
                : topicId // ignore: cast_nullable_to_non_nullable
                      as String,
            topicName: null == topicName
                ? _value.topicName
                : topicName // ignore: cast_nullable_to_non_nullable
                      as String,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            answers: null == answers
                ? _value.answers
                : answers // ignore: cast_nullable_to_non_nullable
                      as List<AnswerRecord>,
            result: freezed == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as AssessmentResult?,
          )
          as $Val,
    );
  }

  /// Create a copy of AssessmentHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssessmentResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $AssessmentResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssessmentHistoryImplCopyWith<$Res>
    implements $AssessmentHistoryCopyWith<$Res> {
  factory _$$AssessmentHistoryImplCopyWith(
    _$AssessmentHistoryImpl value,
    $Res Function(_$AssessmentHistoryImpl) then,
  ) = __$$AssessmentHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String odId,
    String topicId,
    String topicName,
    DateTime startedAt,
    DateTime completedAt,
    List<AnswerRecord> answers,
    AssessmentResult? result,
  });

  @override
  $AssessmentResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$AssessmentHistoryImplCopyWithImpl<$Res>
    extends _$AssessmentHistoryCopyWithImpl<$Res, _$AssessmentHistoryImpl>
    implements _$$AssessmentHistoryImplCopyWith<$Res> {
  __$$AssessmentHistoryImplCopyWithImpl(
    _$AssessmentHistoryImpl _value,
    $Res Function(_$AssessmentHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AssessmentHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? odId = null,
    Object? topicId = null,
    Object? topicName = null,
    Object? startedAt = null,
    Object? completedAt = null,
    Object? answers = null,
    Object? result = freezed,
  }) {
    return _then(
      _$AssessmentHistoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        odId: null == odId
            ? _value.odId
            : odId // ignore: cast_nullable_to_non_nullable
                  as String,
        topicId: null == topicId
            ? _value.topicId
            : topicId // ignore: cast_nullable_to_non_nullable
                  as String,
        topicName: null == topicName
            ? _value.topicName
            : topicName // ignore: cast_nullable_to_non_nullable
                  as String,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        answers: null == answers
            ? _value._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as List<AnswerRecord>,
        result: freezed == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as AssessmentResult?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentHistoryImpl extends _AssessmentHistory {
  const _$AssessmentHistoryImpl({
    required this.id,
    required this.odId,
    required this.topicId,
    required this.topicName,
    required this.startedAt,
    required this.completedAt,
    required final List<AnswerRecord> answers,
    this.result,
  }) : _answers = answers,
       super._();

  factory _$AssessmentHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String odId;
  @override
  final String topicId;
  @override
  final String topicName;
  @override
  final DateTime startedAt;
  @override
  final DateTime completedAt;
  final List<AnswerRecord> _answers;
  @override
  List<AnswerRecord> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final AssessmentResult? result;

  @override
  String toString() {
    return 'AssessmentHistory(id: $id, odId: $odId, topicId: $topicId, topicName: $topicName, startedAt: $startedAt, completedAt: $completedAt, answers: $answers, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.odId, odId) || other.odId == odId) &&
            (identical(other.topicId, topicId) || other.topicId == topicId) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    odId,
    topicId,
    topicName,
    startedAt,
    completedAt,
    const DeepCollectionEquality().hash(_answers),
    result,
  );

  /// Create a copy of AssessmentHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentHistoryImplCopyWith<_$AssessmentHistoryImpl> get copyWith =>
      __$$AssessmentHistoryImplCopyWithImpl<_$AssessmentHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentHistoryImplToJson(this);
  }
}

abstract class _AssessmentHistory extends AssessmentHistory {
  const factory _AssessmentHistory({
    required final String id,
    required final String odId,
    required final String topicId,
    required final String topicName,
    required final DateTime startedAt,
    required final DateTime completedAt,
    required final List<AnswerRecord> answers,
    final AssessmentResult? result,
  }) = _$AssessmentHistoryImpl;
  const _AssessmentHistory._() : super._();

  factory _AssessmentHistory.fromJson(Map<String, dynamic> json) =
      _$AssessmentHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get odId;
  @override
  String get topicId;
  @override
  String get topicName;
  @override
  DateTime get startedAt;
  @override
  DateTime get completedAt;
  @override
  List<AnswerRecord> get answers;
  @override
  AssessmentResult? get result;

  /// Create a copy of AssessmentHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentHistoryImplCopyWith<_$AssessmentHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
