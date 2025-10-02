// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(googleSignInService)
const googleSignInServiceProvider = GoogleSignInServiceProvider._();

final class GoogleSignInServiceProvider
    extends
        $FunctionalProvider<
          GoogleSigninService,
          GoogleSigninService,
          GoogleSigninService
        >
    with $Provider<GoogleSigninService> {
  const GoogleSignInServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleSignInServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleSignInServiceHash();

  @$internal
  @override
  $ProviderElement<GoogleSigninService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GoogleSigninService create(Ref ref) {
    return googleSignInService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleSigninService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleSigninService>(value),
    );
  }
}

String _$googleSignInServiceHash() =>
    r'96017f94fc014e44fb8cbb7f28d7f78ed7bb5abf';

@ProviderFor(localStorageService)
const localStorageServiceProvider = LocalStorageServiceProvider._();

final class LocalStorageServiceProvider
    extends
        $FunctionalProvider<
          LocalStorageService,
          LocalStorageService,
          LocalStorageService
        >
    with $Provider<LocalStorageService> {
  const LocalStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localStorageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localStorageServiceHash();

  @$internal
  @override
  $ProviderElement<LocalStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalStorageService create(Ref ref) {
    return localStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalStorageService>(value),
    );
  }
}

String _$localStorageServiceHash() =>
    r'6393dfa3b7044bce3761873180d69dc9438297b5';

@ProviderFor(authService)
const authServiceProvider = AuthServiceProvider._();

final class AuthServiceProvider
    extends $FunctionalProvider<AuthService, AuthService, AuthService>
    with $Provider<AuthService> {
  const AuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authServiceHash();

  @$internal
  @override
  $ProviderElement<AuthService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthService create(Ref ref) {
    return authService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthService>(value),
    );
  }
}

String _$authServiceHash() => r'8dcdc997078e48aee9c34886bf2424204f929c84';

@ProviderFor(tmdbService)
const tmdbServiceProvider = TmdbServiceProvider._();

final class TmdbServiceProvider
    extends $FunctionalProvider<TmdbService, TmdbService, TmdbService>
    with $Provider<TmdbService> {
  const TmdbServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbServiceHash();

  @$internal
  @override
  $ProviderElement<TmdbService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TmdbService create(Ref ref) {
    return tmdbService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TmdbService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TmdbService>(value),
    );
  }
}

String _$tmdbServiceHash() => r'bdb5b1649b22bc1a8cec454bd99bd495675de368';

@ProviderFor(moviesService)
const moviesServiceProvider = MoviesServiceProvider._();

final class MoviesServiceProvider
    extends $FunctionalProvider<MoviesService, MoviesService, MoviesService>
    with $Provider<MoviesService> {
  const MoviesServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesServiceHash();

  @$internal
  @override
  $ProviderElement<MoviesService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MoviesService create(Ref ref) {
    return moviesService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoviesService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoviesService>(value),
    );
  }
}

String _$moviesServiceHash() => r'4c608350550028ce99569854f5c12e81e69f2f54';
