import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
sealed class AppError with _$AppError {
  const AppError._();

  const factory AppError.network({
    required String message,
    int? statusCode,
  }) = NetworkError;

  const factory AppError.auth({
    required String message,
    String? code,
  }) = AuthError;

  const factory AppError.firebase({
    required String message,
    String? code,
  }) = FirebaseError;

  const factory AppError.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationError;

  const factory AppError.notFound({
    required String message,
  }) = NotFoundError;

  const factory AppError.cache({
    required String message,
  }) = CacheError;

  const factory AppError.unknown({
    required String message,
    Object? originalError,
  }) = UnknownError;

  String get displayMessage => switch (this) {
        NetworkError(:final message) => message,
        AuthError(:final message) => message,
        FirebaseError(:final message) => message,
        ValidationError(:final message) => message,
        NotFoundError(:final message) => message,
        CacheError(:final message) => message,
        UnknownError(:final message) => message,
      };
}
