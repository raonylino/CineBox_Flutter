// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_by_genre_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetMovieByGenreComman)
const getMovieByGenreCommanProvider = GetMovieByGenreCommanProvider._();

final class GetMovieByGenreCommanProvider
    extends $NotifierProvider<GetMovieByGenreComman, AsyncValue<List<Movie>>> {
  const GetMovieByGenreCommanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieByGenreCommanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieByGenreCommanHash();

  @$internal
  @override
  GetMovieByGenreComman create() => GetMovieByGenreComman();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Movie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Movie>>>(value),
    );
  }
}

String _$getMovieByGenreCommanHash() =>
    r'8bcad05c3caf8d1a003f3d9de69a821245ea1469';

abstract class _$GetMovieByGenreComman
    extends $Notifier<AsyncValue<List<Movie>>> {
  AsyncValue<List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Movie>>, AsyncValue<List<Movie>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, AsyncValue<List<Movie>>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
