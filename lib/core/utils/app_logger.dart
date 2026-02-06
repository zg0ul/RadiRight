import 'package:flutter/foundation.dart' show kDebugMode;
import 'dart:developer' as developer;
import 'dart:convert';

class Logger {
  static void log(String message, {String tag = 'Maluk-Log'}) {
    if (kDebugMode) {
      developer.log(message, name: tag, time: DateTime.now());
    }
  }

  static void error(String message, {String tag = 'Maluk-Error'}) {
    if (kDebugMode) {
      // Handle multiline messages by applying color to each line individually
      final lines = message.split('\n');
      final coloredLines = lines.map((line) => '\x1B[31m$line\x1B[0m').join('\n');

      developer.log(
        coloredLines,
        name: tag,
        time: DateTime.now(),
        level: 1000, // Higher level for errors
      );
    }
  }

  static void warn(String message, {String tag = 'Maluk-Warning'}) {
    if (kDebugMode) {
      developer.log(
        message,
        name: tag,
        time: DateTime.now(),
        level: 900, // Warnings level
      );
    }
  }

  static void info(String message, {String tag = 'Maluk-Info'}) {
    if (kDebugMode) {
      developer.log(
        '\x1B[37m$message\x1B[0m',
        name: tag,
        time: DateTime.now(),
        level: 800, // Info level
      );
    }
  }

  static void http(String message, {String tag = 'Maluk-HTTP'}) {
    final lines = message.split('\n');
    final coloredLines = lines.map((line) => '\x1B[32m$line\x1B[0m').join('\n');
    if (kDebugMode) {
      developer.log(
        coloredLines,
        name: tag,
        time: DateTime.now(),
        level: 900, // Info level
      );
    }
  }

  /// Pretty prints an object (Map, List, or any object with toJson()) as formatted JSON
  ///
  /// Example:
  /// ```dart
  /// Logger.debugObject({'key': 'value', 'nested': {'data': 123}}, tag: 'MyTag');
  /// Logger.debugObject(someObject, label: 'Report', tag: 'MyTag');
  /// ```
  static void debugObject(dynamic object, {String tag = 'Maluk-Debug', String? label}) {
    if (!kDebugMode) return;

    try {
      // Convert object to JSON-serializable format
      dynamic jsonObject = object;

      // If object is already a Map or List, use it directly
      if (object is Map || object is List) {
        jsonObject = object;
      } else if (object != null) {
        // Try to call toJson() if it exists (for freezed classes, etc.)
        try {
          jsonObject = (object as dynamic).toJson();
        } catch (_) {
          // If toJson() doesn't exist or fails, use the object as-is
          jsonObject = object;
        }
      }

      // Pretty print JSON with 2-space indentation
      const encoder = JsonEncoder.withIndent('  ');
      final prettyJson = encoder.convert(jsonObject);

      // Add label prefix if provided
      final message = label != null ? '[$label] $prettyJson' : prettyJson;

      developer.log(
        '\x1B[36m$message\x1B[0m', // Cyan color for debug objects
        name: tag,
        time: DateTime.now(),
        level: 700, // Debug level
      );
    } catch (e) {
      // Fallback to regular logging if JSON conversion fails
      final fallbackMessage = label != null ? '[$label] ${object.toString()}' : object.toString();
      developer.log(
        '\x1B[33m$fallbackMessage\x1B[0m', // Yellow color for fallback
        name: tag,
        time: DateTime.now(),
        level: 700,
      );
      // Also log the error
      error('Failed to pretty-print object: $e', tag: tag);
    }
  }
}
