// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_favorite_movie_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RemoveFavoriteMovieCommand)
const removeFavoriteMovieCommandProvider = RemoveFavoriteMovieCommandFamily._();

final class RemoveFavoriteMovieCommandProvider
    extends $NotifierProvider<RemoveFavoriteMovieCommand, AsyncValue<int>> {
  const RemoveFavoriteMovieCommandProvider._({
    required RemoveFavoriteMovieCommandFamily super.from,
    required (Key, int) super.argument,
  }) : super(
         retry: null,
         name: r'removeFavoriteMovieCommandProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$removeFavoriteMovieCommandHash();

  @override
  String toString() {
    return r'removeFavoriteMovieCommandProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  RemoveFavoriteMovieCommand create() => RemoveFavoriteMovieCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveFavoriteMovieCommandProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$removeFavoriteMovieCommandHash() =>
    r'06e2974049cd3854749e025eb94e9df03735036d';

final class RemoveFavoriteMovieCommandFamily extends $Family
    with
        $ClassFamilyOverride<
          RemoveFavoriteMovieCommand,
          AsyncValue<int>,
          AsyncValue<int>,
          AsyncValue<int>,
          (Key, int)
        > {
  const RemoveFavoriteMovieCommandFamily._()
    : super(
        retry: null,
        name: r'removeFavoriteMovieCommandProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RemoveFavoriteMovieCommandProvider call(Key key, int movieId) =>
      RemoveFavoriteMovieCommandProvider._(
        argument: (key, movieId),
        from: this,
      );

  @override
  String toString() => r'removeFavoriteMovieCommandProvider';
}

abstract class _$RemoveFavoriteMovieCommand extends $Notifier<AsyncValue<int>> {
  late final _$args = ref.$arg as (Key, int);
  Key get key => _$args.$1;
  int get movieId => _$args.$2;

  AsyncValue<int> build(Key key, int movieId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<AsyncValue<int>, AsyncValue<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, AsyncValue<int>>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
