// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authNotifierHash() => r'cd3095094d1d3211ae6c68f65f6f94850bed1dc8';

/// See also [AuthNotifier].
@ProviderFor(AuthNotifier)
final authNotifierProvider =
    AutoDisposeStreamNotifierProvider<AuthNotifier, AppUser?>.internal(
      AuthNotifier.new,
      name: r'authNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthNotifier = AutoDisposeStreamNotifier<AppUser?>;
String _$authFormStateHash() => r'5e7fca3ef4ebd3bfb79dfa56ac412a4f30a18956';

/// See also [AuthFormState].
@ProviderFor(AuthFormState)
final authFormStateProvider =
    AutoDisposeNotifierProvider<AuthFormState, AuthFormData>.internal(
      AuthFormState.new,
      name: r'authFormStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authFormStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthFormState = AutoDisposeNotifier<AuthFormData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
