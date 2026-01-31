// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PatientProfile {
  String get ageGroup => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  String get anatomicalLocation => throw _privateConstructorUsedError;

  /// Create a copy of PatientProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientProfileCopyWith<PatientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientProfileCopyWith<$Res> {
  factory $PatientProfileCopyWith(
    PatientProfile value,
    $Res Function(PatientProfile) then,
  ) = _$PatientProfileCopyWithImpl<$Res, PatientProfile>;
  @useResult
  $Res call({String ageGroup, String sex, String anatomicalLocation});
}

/// @nodoc
class _$PatientProfileCopyWithImpl<$Res, $Val extends PatientProfile>
    implements $PatientProfileCopyWith<$Res> {
  _$PatientProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ageGroup = null,
    Object? sex = null,
    Object? anatomicalLocation = null,
  }) {
    return _then(
      _value.copyWith(
            ageGroup: null == ageGroup
                ? _value.ageGroup
                : ageGroup // ignore: cast_nullable_to_non_nullable
                      as String,
            sex: null == sex
                ? _value.sex
                : sex // ignore: cast_nullable_to_non_nullable
                      as String,
            anatomicalLocation: null == anatomicalLocation
                ? _value.anatomicalLocation
                : anatomicalLocation // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientProfileImplCopyWith<$Res>
    implements $PatientProfileCopyWith<$Res> {
  factory _$$PatientProfileImplCopyWith(
    _$PatientProfileImpl value,
    $Res Function(_$PatientProfileImpl) then,
  ) = __$$PatientProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ageGroup, String sex, String anatomicalLocation});
}

/// @nodoc
class __$$PatientProfileImplCopyWithImpl<$Res>
    extends _$PatientProfileCopyWithImpl<$Res, _$PatientProfileImpl>
    implements _$$PatientProfileImplCopyWith<$Res> {
  __$$PatientProfileImplCopyWithImpl(
    _$PatientProfileImpl _value,
    $Res Function(_$PatientProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ageGroup = null,
    Object? sex = null,
    Object? anatomicalLocation = null,
  }) {
    return _then(
      _$PatientProfileImpl(
        ageGroup: null == ageGroup
            ? _value.ageGroup
            : ageGroup // ignore: cast_nullable_to_non_nullable
                  as String,
        sex: null == sex
            ? _value.sex
            : sex // ignore: cast_nullable_to_non_nullable
                  as String,
        anatomicalLocation: null == anatomicalLocation
            ? _value.anatomicalLocation
            : anatomicalLocation // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PatientProfileImpl extends _PatientProfile {
  const _$PatientProfileImpl({
    required this.ageGroup,
    required this.sex,
    required this.anatomicalLocation,
  }) : super._();

  @override
  final String ageGroup;
  @override
  final String sex;
  @override
  final String anatomicalLocation;

  @override
  String toString() {
    return 'PatientProfile(ageGroup: $ageGroup, sex: $sex, anatomicalLocation: $anatomicalLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientProfileImpl &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.anatomicalLocation, anatomicalLocation) ||
                other.anatomicalLocation == anatomicalLocation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ageGroup, sex, anatomicalLocation);

  /// Create a copy of PatientProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientProfileImplCopyWith<_$PatientProfileImpl> get copyWith =>
      __$$PatientProfileImplCopyWithImpl<_$PatientProfileImpl>(
        this,
        _$identity,
      );
}

abstract class _PatientProfile extends PatientProfile {
  const factory _PatientProfile({
    required final String ageGroup,
    required final String sex,
    required final String anatomicalLocation,
  }) = _$PatientProfileImpl;
  const _PatientProfile._() : super._();

  @override
  String get ageGroup;
  @override
  String get sex;
  @override
  String get anatomicalLocation;

  /// Create a copy of PatientProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientProfileImplCopyWith<_$PatientProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
