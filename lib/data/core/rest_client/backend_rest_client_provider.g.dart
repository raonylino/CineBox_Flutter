// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend_rest_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(backendRestClient)
const backendRestClientProvider = BackendRestClientProvider._();

final class BackendRestClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const BackendRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backendRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backendRestClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return backendRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$backendRestClientHash() => r'ce4d86f2b7693e7bba3e5393af4b2f15b4aca0f0';
