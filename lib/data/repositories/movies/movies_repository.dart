import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';

abstract interface class MoviesRepository {
  Future<Result<List<FavoriteMovie>>> getMyFavoriteMovies();

  Future<Result<Unit>> deleteFavoriteMovie({
    required int movieId,
  });

  Future<Result<Unit>> saveFavoriteMovie({
    required FavoriteMovie favoriteMovie,
  });
}
