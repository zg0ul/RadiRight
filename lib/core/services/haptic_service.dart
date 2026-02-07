import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'cache_service.dart';

part 'haptic_service.g.dart';

const String _hapticEnabledKey = 'haptic_feedback_enabled';

@riverpod
HapticService hapticService(Ref ref) {
  final cacheService = ref.read(cacheServiceProvider);
  return HapticService(cacheService);
}

/// Notifier to manage haptic feedback enabled state
@riverpod
class HapticEnabledNotifier extends _$HapticEnabledNotifier {
  @override
  bool build() {
    _loadSavedPreference();
    return true; // Default to enabled
  }

  Future<void> _loadSavedPreference() async {
    final cacheService = ref.read(cacheServiceProvider);
    final enabled = await cacheService.getBool(_hapticEnabledKey);
    if (enabled != null) {
      state = enabled;
    }
  }

  Future<void> setEnabled(bool enabled) async {
    final cacheService = ref.read(cacheServiceProvider);
    await cacheService.setBool(_hapticEnabledKey, enabled);
    state = enabled;
  }

  void toggle() {
    setEnabled(!state);
  }
}

/// Service for providing haptic feedback with user preference support
class HapticService {
  final CacheService _cacheService;
  bool _isEnabled = true;
  bool _initialized = false;

  HapticService(this._cacheService);

  /// Initialize by loading saved preference
  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    final enabled = await _cacheService.getBool(_hapticEnabledKey);
    _isEnabled = enabled ?? true;
    _initialized = true;
  }

  /// Check if haptic feedback is enabled
  Future<bool> get isEnabled async {
    await _ensureInitialized();
    return _isEnabled;
  }

  /// Set haptic feedback enabled state
  Future<void> setEnabled(bool enabled) async {
    _isEnabled = enabled;
    await _cacheService.setBool(_hapticEnabledKey, enabled);
  }

  /// Light haptic feedback - for UI taps and button presses
  Future<void> light() async {
    await _ensureInitialized();
    if (_isEnabled) {
      await HapticFeedback.lightImpact();
    }
  }

  /// Medium haptic feedback - for selections and drag/drop
  Future<void> medium() async {
    await _ensureInitialized();
    if (_isEnabled) {
      await HapticFeedback.mediumImpact();
    }
  }

  /// Heavy haptic feedback - for important actions
  Future<void> heavy() async {
    await _ensureInitialized();
    if (_isEnabled) {
      await HapticFeedback.heavyImpact();
    }
  }

  /// Selection haptic feedback - for picker changes
  Future<void> selection() async {
    await _ensureInitialized();
    if (_isEnabled) {
      await HapticFeedback.selectionClick();
    }
  }

  /// Success haptic feedback - for successful actions
  /// Uses a double light tap pattern
  Future<void> success() async {
    await _ensureInitialized();
    if (_isEnabled) {
      await HapticFeedback.lightImpact();
      await Future.delayed(const Duration(milliseconds: 100));
      await HapticFeedback.lightImpact();
    }
  }

  /// Error haptic feedback - for validation failures
  /// Uses a heavy impact for emphasis
  Future<void> error() async {
    await _ensureInitialized();
    if (_isEnabled) {
      await HapticFeedback.heavyImpact();
    }
  }

  /// Warning haptic feedback - for warnings
  /// Uses a medium impact
  Future<void> warning() async {
    await _ensureInitialized();
    if (_isEnabled) {
      await HapticFeedback.mediumImpact();
    }
  }

  /// Vibrate pattern - for notifications (uses platform vibrate)
  Future<void> vibrate() async {
    await _ensureInitialized();
    if (_isEnabled) {
      await HapticFeedback.vibrate();
    }
  }
}

/// Extension for easy access to haptic feedback from WidgetRef
extension HapticServiceExtension on HapticService {
  /// Perform light haptic if enabled
  void lightSync() {
    light();
  }

  /// Perform medium haptic if enabled
  void mediumSync() {
    medium();
  }

  /// Perform selection haptic if enabled
  void selectionSync() {
    selection();
  }
}
