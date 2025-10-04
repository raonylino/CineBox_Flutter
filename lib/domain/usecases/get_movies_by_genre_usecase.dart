import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/repositories/movies/movies_repository.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox/domain/extensions/mark_favorite_extension.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:cinebox/domain/models/movie.dart';

class GetMoviesByGenreUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesRepository _moviesRepository;

  GetMoviesByGenreUsecase({
    required TmdbRepository tmdbRepository,
    required MoviesRepository moviesRepository,
  }) : _tmdbRepository = tmdbRepository,
       _moviesRepository = moviesRepository;

  Future<Result<List<Movie>>> execute({required int genreId}) async {
    final result = await Future.wait([
      _moviesRepository.getMyFavoriteMovies(),
      _tmdbRepository.getMoviesByGenre(
        genreId: genreId,
      ),
    ]);
    if (result case [
      Success<List<FavoriteMovie>>(value: final favorite),
      Success<List<Movie>>(value: final movieByGenre),
    ]) {
      final favoriteIds = favorite.map((e) => e.id).toList();

      return Success(
        movieByGenre.markFavorite(favoriteIds),
      );
    }
    return Failure(
      DataException(message: 'Erro ao buscar os filmes por genero'),
    );
  }
}
