import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'app_error.dart';

abstract class RepositoryErrorMapper {
  static AppError mapException(Object error) {
    if (error is FirebaseAuthException) {
      return _mapFirebaseAuthError(error);
    } else if (error is FirebaseException) {
      return _mapFirebaseError(error);
    } else if (error is DioException) {
      return _mapDioError(error);
    } else if (error is AppError) {
      return error;
    } else {
      return AppError.unknown(
        message: 'An unexpected error occurred',
        originalError: error,
      );
    }
  }

  static AppError _mapFirebaseAuthError(FirebaseAuthException error) {
    final message = switch (error.code) {
      'user-not-found' => 'No user found with this email',
      'wrong-password' => 'Incorrect password',
      'email-already-in-use' => 'This email is already registered',
      'weak-password' => 'Password is too weak',
      'invalid-email' => 'Invalid email address',
      'user-disabled' => 'This account has been disabled',
      'too-many-requests' => 'Too many attempts. Please try again later',
      'network-request-failed' => 'Network error. Please check your connection',
      _ => error.message ?? 'Authentication failed',
    };

    return AppError.auth(message: message, code: error.code);
  }

  static AppError _mapFirebaseError(FirebaseException error) {
    return AppError.firebase(
      message: error.message ?? 'Firebase operation failed',
      code: error.code,
    );
  }

  static AppError _mapDioError(DioException error) {
    final message = switch (error.type) {
      DioExceptionType.connectionTimeout => 'Connection timeout',
      DioExceptionType.sendTimeout => 'Request timeout',
      DioExceptionType.receiveTimeout => 'Response timeout',
      DioExceptionType.connectionError => 'No internet connection',
      DioExceptionType.badResponse => _mapStatusCode(error.response?.statusCode),
      _ => 'Network error occurred',
    };

    return AppError.network(
      message: message,
      statusCode: error.response?.statusCode,
    );
  }

  static String _mapStatusCode(int? statusCode) {
    return switch (statusCode) {
      400 => 'Bad request',
      401 => 'Unauthorized',
      403 => 'Access denied',
      404 => 'Resource not found',
      500 => 'Server error',
      502 => 'Service unavailable',
      503 => 'Service temporarily unavailable',
      _ => 'Request failed',
    };
  }
}
