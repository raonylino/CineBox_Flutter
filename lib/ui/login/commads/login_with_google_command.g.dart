// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_google_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginWithGoogleCommand)
const loginWithGoogleCommandProvider = LoginWithGoogleCommandProvider._();

final class LoginWithGoogleCommandProvider
    extends $NotifierProvider<LoginWithGoogleCommand, AsyncValue<void>> {
  const LoginWithGoogleCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginWithGoogleCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginWithGoogleCommandHash();

  @$internal
  @override
  LoginWithGoogleCommand create() => LoginWithGoogleCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$loginWithGoogleCommandHash() =>
    r'dd9d3a9aa21709bfbd3290d91201b79c717b73ab';

abstract class _$LoginWithGoogleCommand extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
