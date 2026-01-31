// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NavigationCondition {
  String get contextKey => throw _privateConstructorUsedError;
  ComparisonOperator get operator => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  String get targetNodeId => throw _privateConstructorUsedError;

  /// Create a copy of NavigationCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NavigationConditionCopyWith<NavigationCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationConditionCopyWith<$Res> {
  factory $NavigationConditionCopyWith(
    NavigationCondition value,
    $Res Function(NavigationCondition) then,
  ) = _$NavigationConditionCopyWithImpl<$Res, NavigationCondition>;
  @useResult
  $Res call({
    String contextKey,
    ComparisonOperator operator,
    dynamic value,
    String targetNodeId,
  });
}

/// @nodoc
class _$NavigationConditionCopyWithImpl<$Res, $Val extends NavigationCondition>
    implements $NavigationConditionCopyWith<$Res> {
  _$NavigationConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavigationCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contextKey = null,
    Object? operator = null,
    Object? value = freezed,
    Object? targetNodeId = null,
  }) {
    return _then(
      _value.copyWith(
            contextKey: null == contextKey
                ? _value.contextKey
                : contextKey // ignore: cast_nullable_to_non_nullable
                      as String,
            operator: null == operator
                ? _value.operator
                : operator // ignore: cast_nullable_to_non_nullable
                      as ComparisonOperator,
            value: freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            targetNodeId: null == targetNodeId
                ? _value.targetNodeId
                : targetNodeId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NavigationConditionImplCopyWith<$Res>
    implements $NavigationConditionCopyWith<$Res> {
  factory _$$NavigationConditionImplCopyWith(
    _$NavigationConditionImpl value,
    $Res Function(_$NavigationConditionImpl) then,
  ) = __$$NavigationConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String contextKey,
    ComparisonOperator operator,
    dynamic value,
    String targetNodeId,
  });
}

/// @nodoc
class __$$NavigationConditionImplCopyWithImpl<$Res>
    extends _$NavigationConditionCopyWithImpl<$Res, _$NavigationConditionImpl>
    implements _$$NavigationConditionImplCopyWith<$Res> {
  __$$NavigationConditionImplCopyWithImpl(
    _$NavigationConditionImpl _value,
    $Res Function(_$NavigationConditionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavigationCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contextKey = null,
    Object? operator = null,
    Object? value = freezed,
    Object? targetNodeId = null,
  }) {
    return _then(
      _$NavigationConditionImpl(
        contextKey: null == contextKey
            ? _value.contextKey
            : contextKey // ignore: cast_nullable_to_non_nullable
                  as String,
        operator: null == operator
            ? _value.operator
            : operator // ignore: cast_nullable_to_non_nullable
                  as ComparisonOperator,
        value: freezed == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        targetNodeId: null == targetNodeId
            ? _value.targetNodeId
            : targetNodeId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NavigationConditionImpl implements _NavigationCondition {
  const _$NavigationConditionImpl({
    required this.contextKey,
    required this.operator,
    required this.value,
    required this.targetNodeId,
  });

  @override
  final String contextKey;
  @override
  final ComparisonOperator operator;
  @override
  final dynamic value;
  @override
  final String targetNodeId;

  @override
  String toString() {
    return 'NavigationCondition(contextKey: $contextKey, operator: $operator, value: $value, targetNodeId: $targetNodeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationConditionImpl &&
            (identical(other.contextKey, contextKey) ||
                other.contextKey == contextKey) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.targetNodeId, targetNodeId) ||
                other.targetNodeId == targetNodeId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    contextKey,
    operator,
    const DeepCollectionEquality().hash(value),
    targetNodeId,
  );

  /// Create a copy of NavigationCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationConditionImplCopyWith<_$NavigationConditionImpl> get copyWith =>
      __$$NavigationConditionImplCopyWithImpl<_$NavigationConditionImpl>(
        this,
        _$identity,
      );
}

abstract class _NavigationCondition implements NavigationCondition {
  const factory _NavigationCondition({
    required final String contextKey,
    required final ComparisonOperator operator,
    required final dynamic value,
    required final String targetNodeId,
  }) = _$NavigationConditionImpl;

  @override
  String get contextKey;
  @override
  ComparisonOperator get operator;
  @override
  dynamic get value;
  @override
  String get targetNodeId;

  /// Create a copy of NavigationCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavigationConditionImplCopyWith<_$NavigationConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NavigationRule {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nextNodeId) direct,
    required TResult Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )
    conditional,
    required TResult Function(
      String computationKey,
      Map<String, dynamic>? parameters,
    )
    computed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nextNodeId)? direct,
    TResult? Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )?
    conditional,
    TResult? Function(String computationKey, Map<String, dynamic>? parameters)?
    computed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nextNodeId)? direct,
    TResult Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )?
    conditional,
    TResult Function(String computationKey, Map<String, dynamic>? parameters)?
    computed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectNavigation value) direct,
    required TResult Function(ConditionalNavigation value) conditional,
    required TResult Function(ComputedNavigation value) computed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectNavigation value)? direct,
    TResult? Function(ConditionalNavigation value)? conditional,
    TResult? Function(ComputedNavigation value)? computed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectNavigation value)? direct,
    TResult Function(ConditionalNavigation value)? conditional,
    TResult Function(ComputedNavigation value)? computed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationRuleCopyWith<$Res> {
  factory $NavigationRuleCopyWith(
    NavigationRule value,
    $Res Function(NavigationRule) then,
  ) = _$NavigationRuleCopyWithImpl<$Res, NavigationRule>;
}

/// @nodoc
class _$NavigationRuleCopyWithImpl<$Res, $Val extends NavigationRule>
    implements $NavigationRuleCopyWith<$Res> {
  _$NavigationRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DirectNavigationImplCopyWith<$Res> {
  factory _$$DirectNavigationImplCopyWith(
    _$DirectNavigationImpl value,
    $Res Function(_$DirectNavigationImpl) then,
  ) = __$$DirectNavigationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String nextNodeId});
}

/// @nodoc
class __$$DirectNavigationImplCopyWithImpl<$Res>
    extends _$NavigationRuleCopyWithImpl<$Res, _$DirectNavigationImpl>
    implements _$$DirectNavigationImplCopyWith<$Res> {
  __$$DirectNavigationImplCopyWithImpl(
    _$DirectNavigationImpl _value,
    $Res Function(_$DirectNavigationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nextNodeId = null}) {
    return _then(
      _$DirectNavigationImpl(
        nextNodeId: null == nextNodeId
            ? _value.nextNodeId
            : nextNodeId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DirectNavigationImpl extends DirectNavigation {
  const _$DirectNavigationImpl({required this.nextNodeId}) : super._();

  @override
  final String nextNodeId;

  @override
  String toString() {
    return 'NavigationRule.direct(nextNodeId: $nextNodeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectNavigationImpl &&
            (identical(other.nextNodeId, nextNodeId) ||
                other.nextNodeId == nextNodeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nextNodeId);

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectNavigationImplCopyWith<_$DirectNavigationImpl> get copyWith =>
      __$$DirectNavigationImplCopyWithImpl<_$DirectNavigationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nextNodeId) direct,
    required TResult Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )
    conditional,
    required TResult Function(
      String computationKey,
      Map<String, dynamic>? parameters,
    )
    computed,
  }) {
    return direct(nextNodeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nextNodeId)? direct,
    TResult? Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )?
    conditional,
    TResult? Function(String computationKey, Map<String, dynamic>? parameters)?
    computed,
  }) {
    return direct?.call(nextNodeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nextNodeId)? direct,
    TResult Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )?
    conditional,
    TResult Function(String computationKey, Map<String, dynamic>? parameters)?
    computed,
    required TResult orElse(),
  }) {
    if (direct != null) {
      return direct(nextNodeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectNavigation value) direct,
    required TResult Function(ConditionalNavigation value) conditional,
    required TResult Function(ComputedNavigation value) computed,
  }) {
    return direct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectNavigation value)? direct,
    TResult? Function(ConditionalNavigation value)? conditional,
    TResult? Function(ComputedNavigation value)? computed,
  }) {
    return direct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectNavigation value)? direct,
    TResult Function(ConditionalNavigation value)? conditional,
    TResult Function(ComputedNavigation value)? computed,
    required TResult orElse(),
  }) {
    if (direct != null) {
      return direct(this);
    }
    return orElse();
  }
}

abstract class DirectNavigation extends NavigationRule {
  const factory DirectNavigation({required final String nextNodeId}) =
      _$DirectNavigationImpl;
  const DirectNavigation._() : super._();

  String get nextNodeId;

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectNavigationImplCopyWith<_$DirectNavigationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConditionalNavigationImplCopyWith<$Res> {
  factory _$$ConditionalNavigationImplCopyWith(
    _$ConditionalNavigationImpl value,
    $Res Function(_$ConditionalNavigationImpl) then,
  ) = __$$ConditionalNavigationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NavigationCondition> conditions, String defaultNodeId});
}

/// @nodoc
class __$$ConditionalNavigationImplCopyWithImpl<$Res>
    extends _$NavigationRuleCopyWithImpl<$Res, _$ConditionalNavigationImpl>
    implements _$$ConditionalNavigationImplCopyWith<$Res> {
  __$$ConditionalNavigationImplCopyWithImpl(
    _$ConditionalNavigationImpl _value,
    $Res Function(_$ConditionalNavigationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? conditions = null, Object? defaultNodeId = null}) {
    return _then(
      _$ConditionalNavigationImpl(
        conditions: null == conditions
            ? _value._conditions
            : conditions // ignore: cast_nullable_to_non_nullable
                  as List<NavigationCondition>,
        defaultNodeId: null == defaultNodeId
            ? _value.defaultNodeId
            : defaultNodeId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ConditionalNavigationImpl extends ConditionalNavigation {
  const _$ConditionalNavigationImpl({
    required final List<NavigationCondition> conditions,
    required this.defaultNodeId,
  }) : _conditions = conditions,
       super._();

  final List<NavigationCondition> _conditions;
  @override
  List<NavigationCondition> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @override
  final String defaultNodeId;

  @override
  String toString() {
    return 'NavigationRule.conditional(conditions: $conditions, defaultNodeId: $defaultNodeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionalNavigationImpl &&
            const DeepCollectionEquality().equals(
              other._conditions,
              _conditions,
            ) &&
            (identical(other.defaultNodeId, defaultNodeId) ||
                other.defaultNodeId == defaultNodeId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_conditions),
    defaultNodeId,
  );

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionalNavigationImplCopyWith<_$ConditionalNavigationImpl>
  get copyWith =>
      __$$ConditionalNavigationImplCopyWithImpl<_$ConditionalNavigationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nextNodeId) direct,
    required TResult Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )
    conditional,
    required TResult Function(
      String computationKey,
      Map<String, dynamic>? parameters,
    )
    computed,
  }) {
    return conditional(conditions, defaultNodeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nextNodeId)? direct,
    TResult? Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )?
    conditional,
    TResult? Function(String computationKey, Map<String, dynamic>? parameters)?
    computed,
  }) {
    return conditional?.call(conditions, defaultNodeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nextNodeId)? direct,
    TResult Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )?
    conditional,
    TResult Function(String computationKey, Map<String, dynamic>? parameters)?
    computed,
    required TResult orElse(),
  }) {
    if (conditional != null) {
      return conditional(conditions, defaultNodeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectNavigation value) direct,
    required TResult Function(ConditionalNavigation value) conditional,
    required TResult Function(ComputedNavigation value) computed,
  }) {
    return conditional(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectNavigation value)? direct,
    TResult? Function(ConditionalNavigation value)? conditional,
    TResult? Function(ComputedNavigation value)? computed,
  }) {
    return conditional?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectNavigation value)? direct,
    TResult Function(ConditionalNavigation value)? conditional,
    TResult Function(ComputedNavigation value)? computed,
    required TResult orElse(),
  }) {
    if (conditional != null) {
      return conditional(this);
    }
    return orElse();
  }
}

abstract class ConditionalNavigation extends NavigationRule {
  const factory ConditionalNavigation({
    required final List<NavigationCondition> conditions,
    required final String defaultNodeId,
  }) = _$ConditionalNavigationImpl;
  const ConditionalNavigation._() : super._();

  List<NavigationCondition> get conditions;
  String get defaultNodeId;

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionalNavigationImplCopyWith<_$ConditionalNavigationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComputedNavigationImplCopyWith<$Res> {
  factory _$$ComputedNavigationImplCopyWith(
    _$ComputedNavigationImpl value,
    $Res Function(_$ComputedNavigationImpl) then,
  ) = __$$ComputedNavigationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String computationKey, Map<String, dynamic>? parameters});
}

/// @nodoc
class __$$ComputedNavigationImplCopyWithImpl<$Res>
    extends _$NavigationRuleCopyWithImpl<$Res, _$ComputedNavigationImpl>
    implements _$$ComputedNavigationImplCopyWith<$Res> {
  __$$ComputedNavigationImplCopyWithImpl(
    _$ComputedNavigationImpl _value,
    $Res Function(_$ComputedNavigationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? computationKey = null, Object? parameters = freezed}) {
    return _then(
      _$ComputedNavigationImpl(
        computationKey: null == computationKey
            ? _value.computationKey
            : computationKey // ignore: cast_nullable_to_non_nullable
                  as String,
        parameters: freezed == parameters
            ? _value._parameters
            : parameters // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$ComputedNavigationImpl extends ComputedNavigation {
  const _$ComputedNavigationImpl({
    required this.computationKey,
    final Map<String, dynamic>? parameters,
  }) : _parameters = parameters,
       super._();

  @override
  final String computationKey;
  final Map<String, dynamic>? _parameters;
  @override
  Map<String, dynamic>? get parameters {
    final value = _parameters;
    if (value == null) return null;
    if (_parameters is EqualUnmodifiableMapView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'NavigationRule.computed(computationKey: $computationKey, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComputedNavigationImpl &&
            (identical(other.computationKey, computationKey) ||
                other.computationKey == computationKey) &&
            const DeepCollectionEquality().equals(
              other._parameters,
              _parameters,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    computationKey,
    const DeepCollectionEquality().hash(_parameters),
  );

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComputedNavigationImplCopyWith<_$ComputedNavigationImpl> get copyWith =>
      __$$ComputedNavigationImplCopyWithImpl<_$ComputedNavigationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nextNodeId) direct,
    required TResult Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )
    conditional,
    required TResult Function(
      String computationKey,
      Map<String, dynamic>? parameters,
    )
    computed,
  }) {
    return computed(computationKey, parameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nextNodeId)? direct,
    TResult? Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )?
    conditional,
    TResult? Function(String computationKey, Map<String, dynamic>? parameters)?
    computed,
  }) {
    return computed?.call(computationKey, parameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nextNodeId)? direct,
    TResult Function(
      List<NavigationCondition> conditions,
      String defaultNodeId,
    )?
    conditional,
    TResult Function(String computationKey, Map<String, dynamic>? parameters)?
    computed,
    required TResult orElse(),
  }) {
    if (computed != null) {
      return computed(computationKey, parameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectNavigation value) direct,
    required TResult Function(ConditionalNavigation value) conditional,
    required TResult Function(ComputedNavigation value) computed,
  }) {
    return computed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DirectNavigation value)? direct,
    TResult? Function(ConditionalNavigation value)? conditional,
    TResult? Function(ComputedNavigation value)? computed,
  }) {
    return computed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectNavigation value)? direct,
    TResult Function(ConditionalNavigation value)? conditional,
    TResult Function(ComputedNavigation value)? computed,
    required TResult orElse(),
  }) {
    if (computed != null) {
      return computed(this);
    }
    return orElse();
  }
}

abstract class ComputedNavigation extends NavigationRule {
  const factory ComputedNavigation({
    required final String computationKey,
    final Map<String, dynamic>? parameters,
  }) = _$ComputedNavigationImpl;
  const ComputedNavigation._() : super._();

  String get computationKey;
  Map<String, dynamic>? get parameters;

  /// Create a copy of NavigationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComputedNavigationImplCopyWith<_$ComputedNavigationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
