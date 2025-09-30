import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/models/movie_by_category.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByCategoryUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<MovieByCategory>> execute() async {
    final result = await Future.wait([
      _tmdbRepository.getPopularMovies(language: 'pt-BR', page: 1),
      _tmdbRepository.getTopRatedMovies(language: 'pt-BR', page: 1),
      _tmdbRepository.getNowPlaying(language: 'pt-BR', page: 1),
      _tmdbRepository.getUpcomingMovies(language: 'pt-BR', page: 1),
    ]);

    if (result case [
      Success<List<Movie>>(value: final popular),
      Success<List<Movie>>(value: final topRated),
      Success<List<Movie>>(value: final nowPlaying),
      Success<List<Movie>>(value: final upcoming),
    ]) {
      return Success(
        MovieByCategory(
          popular: popular,
          topRated: topRated,
          nowPlaying: nowPlaying,
          upcoming: upcoming,
        ),
      );
    }
    return Failure(
      DataException(message: 'Erro ao buscar categorias de filmes'),
    );
  }
}
