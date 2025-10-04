import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:cinebox/ui/core/widgets/loader_message.dart';
import 'package:cinebox/ui/core/widgets/movie_card.dart';
import 'package:cinebox/ui/favorites/commads/favorites_view_model.dart';
import 'package:cinebox/ui/favorites/commads/get_favorite_command.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen>
    with LoaderAndMessage {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoritesViewModelProvider).fetchFavoriteMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(getFavoriteCommandProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos'),
      ),
      body: favoritesMovies.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Ocorreu um erro ao buscar filmes favoritos')),
        data: (data) {
          if (data.isEmpty) {
            return Center(child: Text('Nenhum filme favorito encontrado'));
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 148,
                    mainAxisExtent: 268,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final FavoriteMovie(
                      :id,
                      :title,
                      :year,
                      posterPath: imageUrl,
                    ) = data[index];
                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: MovieCard(
                        key: UniqueKey(),
                        id: id,
                        title: title,
                        year: year,
                        imageUrl: imageUrl,
                        isFavorite: true,
                        onFavoriteTap: () async {
                          showLoader();
                          await ref
                              .read(favoritesViewModelProvider)
                              .deleteFavoriteMovie(id);
                          hideLoader();
                        },
                      ),
                    );
                  }, childCount: data.length),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
