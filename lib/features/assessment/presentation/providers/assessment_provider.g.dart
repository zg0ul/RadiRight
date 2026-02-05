// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$panelsHash() => r'84562ce35ff4b856608cb918e5ebd9b81ce83e7e';

/// See also [panels].
@ProviderFor(panels)
final panelsProvider = AutoDisposeFutureProvider<List<Panel>>.internal(
  panels,
  name: r'panelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$panelsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PanelsRef = AutoDisposeFutureProviderRef<List<Panel>>;
String _$topicsHash() => r'b88050f0ed527c7b281fb82883eadfac24690bcc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [topics].
@ProviderFor(topics)
const topicsProvider = TopicsFamily();

/// See also [topics].
class TopicsFamily extends Family<AsyncValue<List<Topic>>> {
  /// See also [topics].
  const TopicsFamily();

  /// See also [topics].
  TopicsProvider call(String panelId) {
    return TopicsProvider(panelId);
  }

  @override
  TopicsProvider getProviderOverride(covariant TopicsProvider provider) {
    return call(provider.panelId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'topicsProvider';
}

/// See also [topics].
class TopicsProvider extends AutoDisposeFutureProvider<List<Topic>> {
  /// See also [topics].
  TopicsProvider(String panelId)
    : this._internal(
        (ref) => topics(ref as TopicsRef, panelId),
        from: topicsProvider,
        name: r'topicsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$topicsHash,
        dependencies: TopicsFamily._dependencies,
        allTransitiveDependencies: TopicsFamily._allTransitiveDependencies,
        panelId: panelId,
      );

  TopicsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.panelId,
  }) : super.internal();

  final String panelId;

  @override
  Override overrideWith(
    FutureOr<List<Topic>> Function(TopicsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopicsProvider._internal(
        (ref) => create(ref as TopicsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        panelId: panelId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Topic>> createElement() {
    return _TopicsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopicsProvider && other.panelId == panelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, panelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TopicsRef on AutoDisposeFutureProviderRef<List<Topic>> {
  /// The parameter `panelId` of this provider.
  String get panelId;
}

class _TopicsProviderElement
    extends AutoDisposeFutureProviderElement<List<Topic>>
    with TopicsRef {
  _TopicsProviderElement(super.provider);

  @override
  String get panelId => (origin as TopicsProvider).panelId;
}

String _$topicHash() => r'b3b4e46e2f06a5d283badab5b132eef7f7edbef0';

/// See also [topic].
@ProviderFor(topic)
const topicProvider = TopicFamily();

/// See also [topic].
class TopicFamily extends Family<AsyncValue<Topic?>> {
  /// See also [topic].
  const TopicFamily();

  /// See also [topic].
  TopicProvider call(String topicId) {
    return TopicProvider(topicId);
  }

  @override
  TopicProvider getProviderOverride(covariant TopicProvider provider) {
    return call(provider.topicId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'topicProvider';
}

/// See also [topic].
class TopicProvider extends AutoDisposeFutureProvider<Topic?> {
  /// See also [topic].
  TopicProvider(String topicId)
    : this._internal(
        (ref) => topic(ref as TopicRef, topicId),
        from: topicProvider,
        name: r'topicProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$topicHash,
        dependencies: TopicFamily._dependencies,
        allTransitiveDependencies: TopicFamily._allTransitiveDependencies,
        topicId: topicId,
      );

  TopicProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.topicId,
  }) : super.internal();

  final String topicId;

  @override
  Override overrideWith(FutureOr<Topic?> Function(TopicRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: TopicProvider._internal(
        (ref) => create(ref as TopicRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        topicId: topicId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Topic?> createElement() {
    return _TopicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopicProvider && other.topicId == topicId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, topicId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TopicRef on AutoDisposeFutureProviderRef<Topic?> {
  /// The parameter `topicId` of this provider.
  String get topicId;
}

class _TopicProviderElement extends AutoDisposeFutureProviderElement<Topic?>
    with TopicRef {
  _TopicProviderElement(super.provider);

  @override
  String get topicId => (origin as TopicProvider).topicId;
}

String _$currentAssessmentHash() => r'491cc0088df589ece450ef5b61c87b27f811c4b5';

/// See also [CurrentAssessment].
@ProviderFor(CurrentAssessment)
final currentAssessmentProvider =
    NotifierProvider<CurrentAssessment, AssessmentState>.internal(
      CurrentAssessment.new,
      name: r'currentAssessmentProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentAssessmentHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CurrentAssessment = Notifier<AssessmentState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
