// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecases_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMoviesByCategoryUsecase)
const getMoviesByCategoryUsecaseProvider =
    GetMoviesByCategoryUsecaseProvider._();

final class GetMoviesByCategoryUsecaseProvider
    extends
        $FunctionalProvider<
          GetMoviesByCategoryUsecase,
          GetMoviesByCategoryUsecase,
          GetMoviesByCategoryUsecase
        >
    with $Provider<GetMoviesByCategoryUsecase> {
  const GetMoviesByCategoryUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByCategoryUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByCategoryUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetMoviesByCategoryUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMoviesByCategoryUsecase create(Ref ref) {
    return getMoviesByCategoryUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMoviesByCategoryUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMoviesByCategoryUsecase>(value),
    );
  }
}

String _$getMoviesByCategoryUsecaseHash() =>
    r'a1402f44e7fc02c62d413b18b021b1d8ac78aa4a';

@ProviderFor(getMoviesByGenreUsecase)
const getMoviesByGenreUsecaseProvider = GetMoviesByGenreUsecaseProvider._();

final class GetMoviesByGenreUsecaseProvider
    extends
        $FunctionalProvider<
          GetMoviesByGenreUsecase,
          GetMoviesByGenreUsecase,
          GetMoviesByGenreUsecase
        >
    with $Provider<GetMoviesByGenreUsecase> {
  const GetMoviesByGenreUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByGenreUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByGenreUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetMoviesByGenreUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMoviesByGenreUsecase create(Ref ref) {
    return getMoviesByGenreUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMoviesByGenreUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMoviesByGenreUsecase>(value),
    );
  }
}

String _$getMoviesByGenreUsecaseHash() =>
    r'1daf2bb3f7017988887e1169768d9f2b4dd1214a';
