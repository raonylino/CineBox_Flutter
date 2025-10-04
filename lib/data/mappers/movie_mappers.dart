import 'package:cinebox/data/models/movie_details_response.dart';
import 'package:cinebox/data/models/movie_response.dart';
import 'package:cinebox/domain/models/cast.dart';
import 'package:cinebox/domain/models/genre.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/models/movie_detail.dart';

class MovieMappers {
  static List<Movie> mapToMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (movie) => Movie(
            id: movie.id,
            title: movie.title,
            overview: movie.overview,
            genreIds: movie.genreIds ?? [],
            backdropPath: movie.backdrop_path,
            posterPath: movie.poster_path,
            voteAverage: movie.vote_average ?? 0.0,
            releaseDate: movie.release_date,
          ),
        )
        .toList();
  }

  static mapToMovieDetail(MovieDetailsResponse result) {
    return MovieDetail(
      title: result.title,
      overview: result.overview,
      releaseDate: result.release_date,
      runtime: result.runtime,
      voteAverage: result.vote_average,
      voteCount: result.vote_count,
      images: result.images.backdrops
          .map((image) => 'https://images.tmdb.org/t/p/w342${image.filePath}')
          .toList(),
      videos: result.videos.results.map((video) => video.key).toList(),
      genres: result.genres
          .map((genre) => Genre(id: genre.id, name: genre.name))
          .toList(),
      cast: result.credits.cast
          .map(
            (cast) => Cast(
              name: cast.name,
              character: cast.character,
              profilePath: cast.profilePath,
            ),
          )
          .toList(),
    );
  }
}
