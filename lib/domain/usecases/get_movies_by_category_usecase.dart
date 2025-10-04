import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/repositories/movies/movies_repository.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox/domain/extensions/mark_favorite_extension.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/models/movie_by_category.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesRepository _moviesRepository;

  GetMoviesByCategoryUsecase({
    required TmdbRepository tmdbRepository,
    required MoviesRepository moviesRepository,
  }) : _tmdbRepository = tmdbRepository,
       _moviesRepository = moviesRepository;

  Future<Result<MovieByCategory>> execute() async {
    final result = await Future.wait([
      _moviesRepository.getMyFavoriteMovies(),
      _tmdbRepository.getPopularMovies(),
      _tmdbRepository.getTopRatedMovies(),
      _tmdbRepository.getNowPlaying(),
      _tmdbRepository.getUpcomingMovies(),
    ]);

    if (result case [
      Success<List<FavoriteMovie>>(value: final favorite),
      Success<List<Movie>>(value: final popular),
      Success<List<Movie>>(value: final topRated),
      Success<List<Movie>>(value: final nowPlaying),
      Success<List<Movie>>(value: final upcoming),
    ]) {
      final favoriteIds = favorite.map((e) => e.id).toList();

      return Success(
        MovieByCategory(
          popular: popular.markFavorite(favoriteIds),
          topRated: topRated.markFavorite(favoriteIds),
          nowPlaying: nowPlaying.markFavorite(favoriteIds),
          upcoming: upcoming.markFavorite(favoriteIds),
        ),
      );
    }
    return Failure(
      DataException(message: 'Erro ao buscar categorias de filmes'),
    );
  }
}
