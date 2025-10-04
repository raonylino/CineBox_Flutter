// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_detail_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetMovieDetailCommand)
const getMovieDetailCommandProvider = GetMovieDetailCommandProvider._();

final class GetMovieDetailCommandProvider
    extends $NotifierProvider<GetMovieDetailCommand, AsyncValue<MovieDetail?>> {
  const GetMovieDetailCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieDetailCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieDetailCommandHash();

  @$internal
  @override
  GetMovieDetailCommand create() => GetMovieDetailCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<MovieDetail?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<MovieDetail?>>(value),
    );
  }
}

String _$getMovieDetailCommandHash() =>
    r'0a6e8672f27dcb5df9f41969d8fb380c287e5551';

abstract class _$GetMovieDetailCommand
    extends $Notifier<AsyncValue<MovieDetail?>> {
  AsyncValue<MovieDetail?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<MovieDetail?>, AsyncValue<MovieDetail?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MovieDetail?>, AsyncValue<MovieDetail?>>,
              AsyncValue<MovieDetail?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
