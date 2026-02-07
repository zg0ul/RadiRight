// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haptic_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hapticServiceHash() => r'c132b9a1c123bd86b9dc3b04c2ffb0db5227cb65';

/// See also [hapticService].
@ProviderFor(hapticService)
final hapticServiceProvider = AutoDisposeProvider<HapticService>.internal(
  hapticService,
  name: r'hapticServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hapticServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HapticServiceRef = AutoDisposeProviderRef<HapticService>;
String _$hapticEnabledNotifierHash() =>
    r'ea306f0662b88660bcb6efad45f3ce9fa88624a5';

/// Notifier to manage haptic feedback enabled state
///
/// Copied from [HapticEnabledNotifier].
@ProviderFor(HapticEnabledNotifier)
final hapticEnabledNotifierProvider =
    AutoDisposeNotifierProvider<HapticEnabledNotifier, bool>.internal(
      HapticEnabledNotifier.new,
      name: r'hapticEnabledNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$hapticEnabledNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$HapticEnabledNotifier = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
