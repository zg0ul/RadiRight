// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decision_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DecisionNode {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )
    question,
    required TResult Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )
    result,
    required TResult Function(String id, String? summary, String? summaryAr)
    noGuidelines,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )?
    question,
    TResult? Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )?
    result,
    TResult? Function(String id, String? summary, String? summaryAr)?
    noGuidelines,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )?
    question,
    TResult Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )?
    result,
    TResult Function(String id, String? summary, String? summaryAr)?
    noGuidelines,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionNode value) question,
    required TResult Function(ResultNode value) result,
    required TResult Function(NoGuidelinesNode value) noGuidelines,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionNode value)? question,
    TResult? Function(ResultNode value)? result,
    TResult? Function(NoGuidelinesNode value)? noGuidelines,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionNode value)? question,
    TResult Function(ResultNode value)? result,
    TResult Function(NoGuidelinesNode value)? noGuidelines,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DecisionNodeCopyWith<DecisionNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecisionNodeCopyWith<$Res> {
  factory $DecisionNodeCopyWith(
    DecisionNode value,
    $Res Function(DecisionNode) then,
  ) = _$DecisionNodeCopyWithImpl<$Res, DecisionNode>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$DecisionNodeCopyWithImpl<$Res, $Val extends DecisionNode>
    implements $DecisionNodeCopyWith<$Res> {
  _$DecisionNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuestionNodeImplCopyWith<$Res>
    implements $DecisionNodeCopyWith<$Res> {
  factory _$$QuestionNodeImplCopyWith(
    _$QuestionNodeImpl value,
    $Res Function(_$QuestionNodeImpl) then,
  ) = __$$QuestionNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String questionText,
    String questionTextAr,
    List<AnswerOption> options,
    String? hint,
    String? hintAr,
  });
}

/// @nodoc
class __$$QuestionNodeImplCopyWithImpl<$Res>
    extends _$DecisionNodeCopyWithImpl<$Res, _$QuestionNodeImpl>
    implements _$$QuestionNodeImplCopyWith<$Res> {
  __$$QuestionNodeImplCopyWithImpl(
    _$QuestionNodeImpl _value,
    $Res Function(_$QuestionNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionText = null,
    Object? questionTextAr = null,
    Object? options = null,
    Object? hint = freezed,
    Object? hintAr = freezed,
  }) {
    return _then(
      _$QuestionNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        questionText: null == questionText
            ? _value.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String,
        questionTextAr: null == questionTextAr
            ? _value.questionTextAr
            : questionTextAr // ignore: cast_nullable_to_non_nullable
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

class _$QuestionNodeImpl extends QuestionNode {
  const _$QuestionNodeImpl({
    required this.id,
    required this.questionText,
    required this.questionTextAr,
    required final List<AnswerOption> options,
    this.hint,
    this.hintAr,
  }) : _options = options,
       super._();

  @override
  final String id;
  @override
  final String questionText;
  @override
  final String questionTextAr;
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
    return 'DecisionNode.question(id: $id, questionText: $questionText, questionTextAr: $questionTextAr, options: $options, hint: $hint, hintAr: $hintAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.questionTextAr, questionTextAr) ||
                other.questionTextAr == questionTextAr) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.hintAr, hintAr) || other.hintAr == hintAr));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    questionText,
    questionTextAr,
    const DeepCollectionEquality().hash(_options),
    hint,
    hintAr,
  );

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionNodeImplCopyWith<_$QuestionNodeImpl> get copyWith =>
      __$$QuestionNodeImplCopyWithImpl<_$QuestionNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )
    question,
    required TResult Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )
    result,
    required TResult Function(String id, String? summary, String? summaryAr)
    noGuidelines,
  }) {
    return question(id, questionText, questionTextAr, options, hint, hintAr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )?
    question,
    TResult? Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )?
    result,
    TResult? Function(String id, String? summary, String? summaryAr)?
    noGuidelines,
  }) {
    return question?.call(
      id,
      questionText,
      questionTextAr,
      options,
      hint,
      hintAr,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )?
    question,
    TResult Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )?
    result,
    TResult Function(String id, String? summary, String? summaryAr)?
    noGuidelines,
    required TResult orElse(),
  }) {
    if (question != null) {
      return question(id, questionText, questionTextAr, options, hint, hintAr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionNode value) question,
    required TResult Function(ResultNode value) result,
    required TResult Function(NoGuidelinesNode value) noGuidelines,
  }) {
    return question(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionNode value)? question,
    TResult? Function(ResultNode value)? result,
    TResult? Function(NoGuidelinesNode value)? noGuidelines,
  }) {
    return question?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionNode value)? question,
    TResult Function(ResultNode value)? result,
    TResult Function(NoGuidelinesNode value)? noGuidelines,
    required TResult orElse(),
  }) {
    if (question != null) {
      return question(this);
    }
    return orElse();
  }
}

abstract class QuestionNode extends DecisionNode {
  const factory QuestionNode({
    required final String id,
    required final String questionText,
    required final String questionTextAr,
    required final List<AnswerOption> options,
    final String? hint,
    final String? hintAr,
  }) = _$QuestionNodeImpl;
  const QuestionNode._() : super._();

  @override
  String get id;
  String get questionText;
  String get questionTextAr;
  List<AnswerOption> get options;
  String? get hint;
  String? get hintAr;

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionNodeImplCopyWith<_$QuestionNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultNodeImplCopyWith<$Res>
    implements $DecisionNodeCopyWith<$Res> {
  factory _$$ResultNodeImplCopyWith(
    _$ResultNodeImpl value,
    $Res Function(_$ResultNodeImpl) then,
  ) = __$$ResultNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    List<ImagingRecommendation> recommendations,
    String? summary,
    String? summaryAr,
  });
}

/// @nodoc
class __$$ResultNodeImplCopyWithImpl<$Res>
    extends _$DecisionNodeCopyWithImpl<$Res, _$ResultNodeImpl>
    implements _$$ResultNodeImplCopyWith<$Res> {
  __$$ResultNodeImplCopyWithImpl(
    _$ResultNodeImpl _value,
    $Res Function(_$ResultNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recommendations = null,
    Object? summary = freezed,
    Object? summaryAr = freezed,
  }) {
    return _then(
      _$ResultNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<ImagingRecommendation>,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        summaryAr: freezed == summaryAr
            ? _value.summaryAr
            : summaryAr // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ResultNodeImpl extends ResultNode {
  const _$ResultNodeImpl({
    required this.id,
    required final List<ImagingRecommendation> recommendations,
    this.summary,
    this.summaryAr,
  }) : _recommendations = recommendations,
       super._();

  @override
  final String id;
  final List<ImagingRecommendation> _recommendations;
  @override
  List<ImagingRecommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final String? summary;
  @override
  final String? summaryAr;

  @override
  String toString() {
    return 'DecisionNode.result(id: $id, recommendations: $recommendations, summary: $summary, summaryAr: $summaryAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.summaryAr, summaryAr) ||
                other.summaryAr == summaryAr));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_recommendations),
    summary,
    summaryAr,
  );

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultNodeImplCopyWith<_$ResultNodeImpl> get copyWith =>
      __$$ResultNodeImplCopyWithImpl<_$ResultNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )
    question,
    required TResult Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )
    result,
    required TResult Function(String id, String? summary, String? summaryAr)
    noGuidelines,
  }) {
    return result(id, recommendations, summary, summaryAr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )?
    question,
    TResult? Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )?
    result,
    TResult? Function(String id, String? summary, String? summaryAr)?
    noGuidelines,
  }) {
    return result?.call(id, recommendations, summary, summaryAr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )?
    question,
    TResult Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )?
    result,
    TResult Function(String id, String? summary, String? summaryAr)?
    noGuidelines,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(id, recommendations, summary, summaryAr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionNode value) question,
    required TResult Function(ResultNode value) result,
    required TResult Function(NoGuidelinesNode value) noGuidelines,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionNode value)? question,
    TResult? Function(ResultNode value)? result,
    TResult? Function(NoGuidelinesNode value)? noGuidelines,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionNode value)? question,
    TResult Function(ResultNode value)? result,
    TResult Function(NoGuidelinesNode value)? noGuidelines,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class ResultNode extends DecisionNode {
  const factory ResultNode({
    required final String id,
    required final List<ImagingRecommendation> recommendations,
    final String? summary,
    final String? summaryAr,
  }) = _$ResultNodeImpl;
  const ResultNode._() : super._();

  @override
  String get id;
  List<ImagingRecommendation> get recommendations;
  String? get summary;
  String? get summaryAr;

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultNodeImplCopyWith<_$ResultNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoGuidelinesNodeImplCopyWith<$Res>
    implements $DecisionNodeCopyWith<$Res> {
  factory _$$NoGuidelinesNodeImplCopyWith(
    _$NoGuidelinesNodeImpl value,
    $Res Function(_$NoGuidelinesNodeImpl) then,
  ) = __$$NoGuidelinesNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? summary, String? summaryAr});
}

/// @nodoc
class __$$NoGuidelinesNodeImplCopyWithImpl<$Res>
    extends _$DecisionNodeCopyWithImpl<$Res, _$NoGuidelinesNodeImpl>
    implements _$$NoGuidelinesNodeImplCopyWith<$Res> {
  __$$NoGuidelinesNodeImplCopyWithImpl(
    _$NoGuidelinesNodeImpl _value,
    $Res Function(_$NoGuidelinesNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? summary = freezed,
    Object? summaryAr = freezed,
  }) {
    return _then(
      _$NoGuidelinesNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        summaryAr: freezed == summaryAr
            ? _value.summaryAr
            : summaryAr // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NoGuidelinesNodeImpl extends NoGuidelinesNode {
  const _$NoGuidelinesNodeImpl({required this.id, this.summary, this.summaryAr})
    : super._();

  @override
  final String id;
  @override
  final String? summary;
  @override
  final String? summaryAr;

  @override
  String toString() {
    return 'DecisionNode.noGuidelines(id: $id, summary: $summary, summaryAr: $summaryAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoGuidelinesNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.summaryAr, summaryAr) ||
                other.summaryAr == summaryAr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, summary, summaryAr);

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoGuidelinesNodeImplCopyWith<_$NoGuidelinesNodeImpl> get copyWith =>
      __$$NoGuidelinesNodeImplCopyWithImpl<_$NoGuidelinesNodeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )
    question,
    required TResult Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )
    result,
    required TResult Function(String id, String? summary, String? summaryAr)
    noGuidelines,
  }) {
    return noGuidelines(id, summary, summaryAr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )?
    question,
    TResult? Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )?
    result,
    TResult? Function(String id, String? summary, String? summaryAr)?
    noGuidelines,
  }) {
    return noGuidelines?.call(id, summary, summaryAr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String questionText,
      String questionTextAr,
      List<AnswerOption> options,
      String? hint,
      String? hintAr,
    )?
    question,
    TResult Function(
      String id,
      List<ImagingRecommendation> recommendations,
      String? summary,
      String? summaryAr,
    )?
    result,
    TResult Function(String id, String? summary, String? summaryAr)?
    noGuidelines,
    required TResult orElse(),
  }) {
    if (noGuidelines != null) {
      return noGuidelines(id, summary, summaryAr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionNode value) question,
    required TResult Function(ResultNode value) result,
    required TResult Function(NoGuidelinesNode value) noGuidelines,
  }) {
    return noGuidelines(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionNode value)? question,
    TResult? Function(ResultNode value)? result,
    TResult? Function(NoGuidelinesNode value)? noGuidelines,
  }) {
    return noGuidelines?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionNode value)? question,
    TResult Function(ResultNode value)? result,
    TResult Function(NoGuidelinesNode value)? noGuidelines,
    required TResult orElse(),
  }) {
    if (noGuidelines != null) {
      return noGuidelines(this);
    }
    return orElse();
  }
}

abstract class NoGuidelinesNode extends DecisionNode {
  const factory NoGuidelinesNode({
    required final String id,
    final String? summary,
    final String? summaryAr,
  }) = _$NoGuidelinesNodeImpl;
  const NoGuidelinesNode._() : super._();

  @override
  String get id;
  String? get summary;
  String? get summaryAr;

  /// Create a copy of DecisionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoGuidelinesNodeImplCopyWith<_$NoGuidelinesNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
