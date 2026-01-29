// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'panel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Panel _$PanelFromJson(Map<String, dynamic> json) {
  return _Panel.fromJson(json);
}

/// @nodoc
mixin _$Panel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get descriptionAr => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  int get topicCount => throw _privateConstructorUsedError;

  /// Serializes this Panel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Panel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PanelCopyWith<Panel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PanelCopyWith<$Res> {
  factory $PanelCopyWith(Panel value, $Res Function(Panel) then) =
      _$PanelCopyWithImpl<$Res, Panel>;
  @useResult
  $Res call({
    String id,
    String name,
    String nameAr,
    String? description,
    String? descriptionAr,
    String? iconName,
    bool isEnabled,
    int topicCount,
  });
}

/// @nodoc
class _$PanelCopyWithImpl<$Res, $Val extends Panel>
    implements $PanelCopyWith<$Res> {
  _$PanelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Panel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameAr = null,
    Object? description = freezed,
    Object? descriptionAr = freezed,
    Object? iconName = freezed,
    Object? isEnabled = null,
    Object? topicCount = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            nameAr: null == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            descriptionAr: freezed == descriptionAr
                ? _value.descriptionAr
                : descriptionAr // ignore: cast_nullable_to_non_nullable
                      as String?,
            iconName: freezed == iconName
                ? _value.iconName
                : iconName // ignore: cast_nullable_to_non_nullable
                      as String?,
            isEnabled: null == isEnabled
                ? _value.isEnabled
                : isEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            topicCount: null == topicCount
                ? _value.topicCount
                : topicCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PanelImplCopyWith<$Res> implements $PanelCopyWith<$Res> {
  factory _$$PanelImplCopyWith(
    _$PanelImpl value,
    $Res Function(_$PanelImpl) then,
  ) = __$$PanelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String nameAr,
    String? description,
    String? descriptionAr,
    String? iconName,
    bool isEnabled,
    int topicCount,
  });
}

/// @nodoc
class __$$PanelImplCopyWithImpl<$Res>
    extends _$PanelCopyWithImpl<$Res, _$PanelImpl>
    implements _$$PanelImplCopyWith<$Res> {
  __$$PanelImplCopyWithImpl(
    _$PanelImpl _value,
    $Res Function(_$PanelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Panel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameAr = null,
    Object? description = freezed,
    Object? descriptionAr = freezed,
    Object? iconName = freezed,
    Object? isEnabled = null,
    Object? topicCount = null,
  }) {
    return _then(
      _$PanelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAr: null == nameAr
            ? _value.nameAr
            : nameAr // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        descriptionAr: freezed == descriptionAr
            ? _value.descriptionAr
            : descriptionAr // ignore: cast_nullable_to_non_nullable
                  as String?,
        iconName: freezed == iconName
            ? _value.iconName
            : iconName // ignore: cast_nullable_to_non_nullable
                  as String?,
        isEnabled: null == isEnabled
            ? _value.isEnabled
            : isEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        topicCount: null == topicCount
            ? _value.topicCount
            : topicCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PanelImpl extends _Panel {
  const _$PanelImpl({
    required this.id,
    required this.name,
    required this.nameAr,
    this.description,
    this.descriptionAr,
    this.iconName,
    this.isEnabled = true,
    this.topicCount = 0,
  }) : super._();

  factory _$PanelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PanelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String nameAr;
  @override
  final String? description;
  @override
  final String? descriptionAr;
  @override
  final String? iconName;
  @override
  @JsonKey()
  final bool isEnabled;
  @override
  @JsonKey()
  final int topicCount;

  @override
  String toString() {
    return 'Panel(id: $id, name: $name, nameAr: $nameAr, description: $description, descriptionAr: $descriptionAr, iconName: $iconName, isEnabled: $isEnabled, topicCount: $topicCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionAr, descriptionAr) ||
                other.descriptionAr == descriptionAr) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.topicCount, topicCount) ||
                other.topicCount == topicCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    nameAr,
    description,
    descriptionAr,
    iconName,
    isEnabled,
    topicCount,
  );

  /// Create a copy of Panel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanelImplCopyWith<_$PanelImpl> get copyWith =>
      __$$PanelImplCopyWithImpl<_$PanelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PanelImplToJson(this);
  }
}

abstract class _Panel extends Panel {
  const factory _Panel({
    required final String id,
    required final String name,
    required final String nameAr,
    final String? description,
    final String? descriptionAr,
    final String? iconName,
    final bool isEnabled,
    final int topicCount,
  }) = _$PanelImpl;
  const _Panel._() : super._();

  factory _Panel.fromJson(Map<String, dynamic> json) = _$PanelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get nameAr;
  @override
  String? get description;
  @override
  String? get descriptionAr;
  @override
  String? get iconName;
  @override
  bool get isEnabled;
  @override
  int get topicCount;

  /// Create a copy of Panel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanelImplCopyWith<_$PanelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
