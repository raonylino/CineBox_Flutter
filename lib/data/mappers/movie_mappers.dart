import 'package:cinebox/data/models/movie_response.dart';
import 'package:cinebox/domain/models/movie.dart';

class MovieMappers {
  static List<Movie> toMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (movie) => Movie(
            id: movie.id,
            title: movie.title,
            overview: movie.overview,
            genreIds: movie.genreIds ?? [],
            backdropPath: movie.backdropPath,
            posterPath: movie.posterPath,
            voteAverage: movie.voteAverage ?? 0.0,
            releaseDate: movie.releaseDate,
          ),
        )
        .toList();
  }
}
