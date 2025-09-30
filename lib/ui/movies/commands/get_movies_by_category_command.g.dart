// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_by_category_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetMoviesByCategoryCommand)
const getMoviesByCategoryCommandProvider =
    GetMoviesByCategoryCommandProvider._();

final class GetMoviesByCategoryCommandProvider
    extends
        $NotifierProvider<
          GetMoviesByCategoryCommand,
          AsyncValue<MovieByCategory?>
        > {
  const GetMoviesByCategoryCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByCategoryCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByCategoryCommandHash();

  @$internal
  @override
  GetMoviesByCategoryCommand create() => GetMoviesByCategoryCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<MovieByCategory?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<MovieByCategory?>>(value),
    );
  }
}

String _$getMoviesByCategoryCommandHash() =>
    r'06aa3d0d88659822d7b6e3384fb01e3402c406a3';

abstract class _$GetMoviesByCategoryCommand
    extends $Notifier<AsyncValue<MovieByCategory?>> {
  AsyncValue<MovieByCategory?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<MovieByCategory?>, AsyncValue<MovieByCategory?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<MovieByCategory?>,
                AsyncValue<MovieByCategory?>
              >,
              AsyncValue<MovieByCategory?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
