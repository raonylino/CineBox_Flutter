import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/domain/models/genre.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/models/movie_detail.dart';

abstract interface class TmdbRepository {
  Future<Result<List<Movie>>> getPopularMovies({
    String language,
    int page,
  });

  Future<Result<List<Movie>>> getTopRatedMovies({
    String language,
    int page,
  });

  Future<Result<List<Movie>>> getNowPlaying({
    String language,
    int page,
  });

  Future<Result<List<Movie>>> getUpcomingMovies({
    String language,
    int page,
  });

  Future<Result<List<Genre>>> getMovieGenres();

  Future<Result<List<Movie>>> getMoviesByGenre({required int genreId});

  Future<Result<List<Movie>>> searchMovies({
    required String query,
  });
  Future<Result<MovieDetail>> getMovieDetail({required int movieId});
}
