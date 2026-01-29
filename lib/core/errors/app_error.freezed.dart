// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) network,
    required TResult Function(String message, String? code) auth,
    required TResult Function(String message, String? code) firebase,
    required TResult Function(String message, Map<String, String>? fieldErrors)
    validation,
    required TResult Function(String message) notFound,
    required TResult Function(String message) cache,
    required TResult Function(String message, Object? originalError) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? network,
    TResult? Function(String message, String? code)? auth,
    TResult? Function(String message, String? code)? firebase,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? originalError)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? network,
    TResult Function(String message, String? code)? auth,
    TResult Function(String message, String? code)? firebase,
    TResult Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult Function(String message)? notFound,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? originalError)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(AuthError value) auth,
    required TResult Function(FirebaseError value) firebase,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(CacheError value) cache,
    required TResult Function(UnknownError value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(AuthError value)? auth,
    TResult? Function(FirebaseError value)? firebase,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(CacheError value)? cache,
    TResult? Function(UnknownError value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(AuthError value)? auth,
    TResult Function(FirebaseError value)? firebase,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(CacheError value)? cache,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppErrorCopyWith<AppError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) then) =
      _$AppErrorCopyWithImpl<$Res, AppError>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AppErrorCopyWithImpl<$Res, $Val extends AppError>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
    _$NetworkErrorImpl value,
    $Res Function(_$NetworkErrorImpl) then,
  ) = __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int? statusCode});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
    _$NetworkErrorImpl _value,
    $Res Function(_$NetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? statusCode = freezed}) {
    return _then(
      _$NetworkErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: freezed == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$NetworkErrorImpl extends NetworkError {
  const _$NetworkErrorImpl({required this.message, this.statusCode})
    : super._();

  @override
  final String message;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'AppError.network(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) network,
    required TResult Function(String message, String? code) auth,
    required TResult Function(String message, String? code) firebase,
    required TResult Function(String message, Map<String, String>? fieldErrors)
    validation,
    required TResult Function(String message) notFound,
    required TResult Function(String message) cache,
    required TResult Function(String message, Object? originalError) unknown,
  }) {
    return network(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? network,
    TResult? Function(String message, String? code)? auth,
    TResult? Function(String message, String? code)? firebase,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? originalError)? unknown,
  }) {
    return network?.call(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? network,
    TResult Function(String message, String? code)? auth,
    TResult Function(String message, String? code)? firebase,
    TResult Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult Function(String message)? notFound,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? originalError)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(AuthError value) auth,
    required TResult Function(FirebaseError value) firebase,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(CacheError value) cache,
    required TResult Function(UnknownError value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(AuthError value)? auth,
    TResult? Function(FirebaseError value)? firebase,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(CacheError value)? cache,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(AuthError value)? auth,
    TResult Function(FirebaseError value)? firebase,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(CacheError value)? cache,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkError extends AppError {
  const factory NetworkError({
    required final String message,
    final int? statusCode,
  }) = _$NetworkErrorImpl;
  const NetworkError._() : super._();

  @override
  String get message;
  int? get statusCode;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
    _$AuthErrorImpl value,
    $Res Function(_$AuthErrorImpl) then,
  ) = __$$AuthErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
    _$AuthErrorImpl _value,
    $Res Function(_$AuthErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = freezed}) {
    return _then(
      _$AuthErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AuthErrorImpl extends AuthError {
  const _$AuthErrorImpl({required this.message, this.code}) : super._();

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AppError.auth(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) network,
    required TResult Function(String message, String? code) auth,
    required TResult Function(String message, String? code) firebase,
    required TResult Function(String message, Map<String, String>? fieldErrors)
    validation,
    required TResult Function(String message) notFound,
    required TResult Function(String message) cache,
    required TResult Function(String message, Object? originalError) unknown,
  }) {
    return auth(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? network,
    TResult? Function(String message, String? code)? auth,
    TResult? Function(String message, String? code)? firebase,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? originalError)? unknown,
  }) {
    return auth?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? network,
    TResult Function(String message, String? code)? auth,
    TResult Function(String message, String? code)? firebase,
    TResult Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult Function(String message)? notFound,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? originalError)? unknown,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(AuthError value) auth,
    required TResult Function(FirebaseError value) firebase,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(CacheError value) cache,
    required TResult Function(UnknownError value) unknown,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(AuthError value)? auth,
    TResult? Function(FirebaseError value)? firebase,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(CacheError value)? cache,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(AuthError value)? auth,
    TResult Function(FirebaseError value)? firebase,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(CacheError value)? cache,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class AuthError extends AppError {
  const factory AuthError({required final String message, final String? code}) =
      _$AuthErrorImpl;
  const AuthError._() : super._();

  @override
  String get message;
  String? get code;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$FirebaseErrorImplCopyWith(
    _$FirebaseErrorImpl value,
    $Res Function(_$FirebaseErrorImpl) then,
  ) = __$$FirebaseErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$FirebaseErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$FirebaseErrorImpl>
    implements _$$FirebaseErrorImplCopyWith<$Res> {
  __$$FirebaseErrorImplCopyWithImpl(
    _$FirebaseErrorImpl _value,
    $Res Function(_$FirebaseErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = freezed}) {
    return _then(
      _$FirebaseErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FirebaseErrorImpl extends FirebaseError {
  const _$FirebaseErrorImpl({required this.message, this.code}) : super._();

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AppError.firebase(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseErrorImplCopyWith<_$FirebaseErrorImpl> get copyWith =>
      __$$FirebaseErrorImplCopyWithImpl<_$FirebaseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) network,
    required TResult Function(String message, String? code) auth,
    required TResult Function(String message, String? code) firebase,
    required TResult Function(String message, Map<String, String>? fieldErrors)
    validation,
    required TResult Function(String message) notFound,
    required TResult Function(String message) cache,
    required TResult Function(String message, Object? originalError) unknown,
  }) {
    return firebase(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? network,
    TResult? Function(String message, String? code)? auth,
    TResult? Function(String message, String? code)? firebase,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? originalError)? unknown,
  }) {
    return firebase?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? network,
    TResult Function(String message, String? code)? auth,
    TResult Function(String message, String? code)? firebase,
    TResult Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult Function(String message)? notFound,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? originalError)? unknown,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(AuthError value) auth,
    required TResult Function(FirebaseError value) firebase,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(CacheError value) cache,
    required TResult Function(UnknownError value) unknown,
  }) {
    return firebase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(AuthError value)? auth,
    TResult? Function(FirebaseError value)? firebase,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(CacheError value)? cache,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return firebase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(AuthError value)? auth,
    TResult Function(FirebaseError value)? firebase,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(CacheError value)? cache,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(this);
    }
    return orElse();
  }
}

abstract class FirebaseError extends AppError {
  const factory FirebaseError({
    required final String message,
    final String? code,
  }) = _$FirebaseErrorImpl;
  const FirebaseError._() : super._();

  @override
  String get message;
  String? get code;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseErrorImplCopyWith<_$FirebaseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(
    _$ValidationErrorImpl value,
    $Res Function(_$ValidationErrorImpl) then,
  ) = __$$ValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Map<String, String>? fieldErrors});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
    _$ValidationErrorImpl _value,
    $Res Function(_$ValidationErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? fieldErrors = freezed}) {
    return _then(
      _$ValidationErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        fieldErrors: freezed == fieldErrors
            ? _value._fieldErrors
            : fieldErrors // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>?,
      ),
    );
  }
}

/// @nodoc

class _$ValidationErrorImpl extends ValidationError {
  const _$ValidationErrorImpl({
    required this.message,
    final Map<String, String>? fieldErrors,
  }) : _fieldErrors = fieldErrors,
       super._();

  @override
  final String message;
  final Map<String, String>? _fieldErrors;
  @override
  Map<String, String>? get fieldErrors {
    final value = _fieldErrors;
    if (value == null) return null;
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppError.validation(message: $message, fieldErrors: $fieldErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._fieldErrors,
              _fieldErrors,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(_fieldErrors),
  );

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) network,
    required TResult Function(String message, String? code) auth,
    required TResult Function(String message, String? code) firebase,
    required TResult Function(String message, Map<String, String>? fieldErrors)
    validation,
    required TResult Function(String message) notFound,
    required TResult Function(String message) cache,
    required TResult Function(String message, Object? originalError) unknown,
  }) {
    return validation(message, fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? network,
    TResult? Function(String message, String? code)? auth,
    TResult? Function(String message, String? code)? firebase,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? originalError)? unknown,
  }) {
    return validation?.call(message, fieldErrors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? network,
    TResult Function(String message, String? code)? auth,
    TResult Function(String message, String? code)? firebase,
    TResult Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult Function(String message)? notFound,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? originalError)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, fieldErrors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(AuthError value) auth,
    required TResult Function(FirebaseError value) firebase,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(CacheError value) cache,
    required TResult Function(UnknownError value) unknown,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(AuthError value)? auth,
    TResult? Function(FirebaseError value)? firebase,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(CacheError value)? cache,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(AuthError value)? auth,
    TResult Function(FirebaseError value)? firebase,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(CacheError value)? cache,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationError extends AppError {
  const factory ValidationError({
    required final String message,
    final Map<String, String>? fieldErrors,
  }) = _$ValidationErrorImpl;
  const ValidationError._() : super._();

  @override
  String get message;
  Map<String, String>? get fieldErrors;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$NotFoundErrorImplCopyWith(
    _$NotFoundErrorImpl value,
    $Res Function(_$NotFoundErrorImpl) then,
  ) = __$$NotFoundErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NotFoundErrorImpl>
    implements _$$NotFoundErrorImplCopyWith<$Res> {
  __$$NotFoundErrorImplCopyWithImpl(
    _$NotFoundErrorImpl _value,
    $Res Function(_$NotFoundErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NotFoundErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NotFoundErrorImpl extends NotFoundError {
  const _$NotFoundErrorImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'AppError.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundErrorImplCopyWith<_$NotFoundErrorImpl> get copyWith =>
      __$$NotFoundErrorImplCopyWithImpl<_$NotFoundErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) network,
    required TResult Function(String message, String? code) auth,
    required TResult Function(String message, String? code) firebase,
    required TResult Function(String message, Map<String, String>? fieldErrors)
    validation,
    required TResult Function(String message) notFound,
    required TResult Function(String message) cache,
    required TResult Function(String message, Object? originalError) unknown,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? network,
    TResult? Function(String message, String? code)? auth,
    TResult? Function(String message, String? code)? firebase,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? originalError)? unknown,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? network,
    TResult Function(String message, String? code)? auth,
    TResult Function(String message, String? code)? firebase,
    TResult Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult Function(String message)? notFound,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? originalError)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(AuthError value) auth,
    required TResult Function(FirebaseError value) firebase,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(CacheError value) cache,
    required TResult Function(UnknownError value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(AuthError value)? auth,
    TResult? Function(FirebaseError value)? firebase,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(CacheError value)? cache,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(AuthError value)? auth,
    TResult Function(FirebaseError value)? firebase,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(CacheError value)? cache,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundError extends AppError {
  const factory NotFoundError({required final String message}) =
      _$NotFoundErrorImpl;
  const NotFoundError._() : super._();

  @override
  String get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundErrorImplCopyWith<_$NotFoundErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$CacheErrorImplCopyWith(
    _$CacheErrorImpl value,
    $Res Function(_$CacheErrorImpl) then,
  ) = __$$CacheErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CacheErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$CacheErrorImpl>
    implements _$$CacheErrorImplCopyWith<$Res> {
  __$$CacheErrorImplCopyWithImpl(
    _$CacheErrorImpl _value,
    $Res Function(_$CacheErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CacheErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CacheErrorImpl extends CacheError {
  const _$CacheErrorImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'AppError.cache(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheErrorImplCopyWith<_$CacheErrorImpl> get copyWith =>
      __$$CacheErrorImplCopyWithImpl<_$CacheErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) network,
    required TResult Function(String message, String? code) auth,
    required TResult Function(String message, String? code) firebase,
    required TResult Function(String message, Map<String, String>? fieldErrors)
    validation,
    required TResult Function(String message) notFound,
    required TResult Function(String message) cache,
    required TResult Function(String message, Object? originalError) unknown,
  }) {
    return cache(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? network,
    TResult? Function(String message, String? code)? auth,
    TResult? Function(String message, String? code)? firebase,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? originalError)? unknown,
  }) {
    return cache?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? network,
    TResult Function(String message, String? code)? auth,
    TResult Function(String message, String? code)? firebase,
    TResult Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult Function(String message)? notFound,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? originalError)? unknown,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(AuthError value) auth,
    required TResult Function(FirebaseError value) firebase,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(CacheError value) cache,
    required TResult Function(UnknownError value) unknown,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(AuthError value)? auth,
    TResult? Function(FirebaseError value)? firebase,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(CacheError value)? cache,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(AuthError value)? auth,
    TResult Function(FirebaseError value)? firebase,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(CacheError value)? cache,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheError extends AppError {
  const factory CacheError({required final String message}) = _$CacheErrorImpl;
  const CacheError._() : super._();

  @override
  String get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheErrorImplCopyWith<_$CacheErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
    _$UnknownErrorImpl value,
    $Res Function(_$UnknownErrorImpl) then,
  ) = __$$UnknownErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? originalError});
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
    _$UnknownErrorImpl _value,
    $Res Function(_$UnknownErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? originalError = freezed}) {
    return _then(
      _$UnknownErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
      ),
    );
  }
}

/// @nodoc

class _$UnknownErrorImpl extends UnknownError {
  const _$UnknownErrorImpl({required this.message, this.originalError})
    : super._();

  @override
  final String message;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'AppError.unknown(message: $message, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(originalError),
  );

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      __$$UnknownErrorImplCopyWithImpl<_$UnknownErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) network,
    required TResult Function(String message, String? code) auth,
    required TResult Function(String message, String? code) firebase,
    required TResult Function(String message, Map<String, String>? fieldErrors)
    validation,
    required TResult Function(String message) notFound,
    required TResult Function(String message) cache,
    required TResult Function(String message, Object? originalError) unknown,
  }) {
    return unknown(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? network,
    TResult? Function(String message, String? code)? auth,
    TResult? Function(String message, String? code)? firebase,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? cache,
    TResult? Function(String message, Object? originalError)? unknown,
  }) {
    return unknown?.call(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? network,
    TResult Function(String message, String? code)? auth,
    TResult Function(String message, String? code)? firebase,
    TResult Function(String message, Map<String, String>? fieldErrors)?
    validation,
    TResult Function(String message)? notFound,
    TResult Function(String message)? cache,
    TResult Function(String message, Object? originalError)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(AuthError value) auth,
    required TResult Function(FirebaseError value) firebase,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(CacheError value) cache,
    required TResult Function(UnknownError value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(AuthError value)? auth,
    TResult? Function(FirebaseError value)? firebase,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(CacheError value)? cache,
    TResult? Function(UnknownError value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(AuthError value)? auth,
    TResult Function(FirebaseError value)? firebase,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(CacheError value)? cache,
    TResult Function(UnknownError value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownError extends AppError {
  const factory UnknownError({
    required final String message,
    final Object? originalError,
  }) = _$UnknownErrorImpl;
  const UnknownError._() : super._();

  @override
  String get message;
  Object? get originalError;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
