// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favoritesViewModel)
const favoritesViewModelProvider = FavoritesViewModelProvider._();

final class FavoritesViewModelProvider
    extends
        $FunctionalProvider<
          FavoritesViewModel,
          FavoritesViewModel,
          FavoritesViewModel
        >
    with $Provider<FavoritesViewModel> {
  const FavoritesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesViewModelHash();

  @$internal
  @override
  $ProviderElement<FavoritesViewModel> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FavoritesViewModel create(Ref ref) {
    return favoritesViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoritesViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoritesViewModel>(value),
    );
  }
}

String _$favoritesViewModelHash() =>
    r'd37f04f015645e32cf51edd56b1bf579ffe0a996';
