import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_favorite_command.g.dart';

@riverpod
class GetFavoriteCommand extends _$GetFavoriteCommand {
  @override
  AsyncValue<List<FavoriteMovie>> build() {
    return const AsyncValue.loading();
  }

  Future<void> execute() async {
    final result = await ref
        .read(moviesRepositoryProvider)
        .getMyFavoriteMovies();
    state = switch (result) {
      Success<List<FavoriteMovie>>(value: final favoriteMovies) => AsyncData(
        favoriteMovies,
      ),
      Failure() => AsyncError(
        'erro ao buscar filmes favoritos',
        StackTrace.current,
      ),
    };
  }
}
