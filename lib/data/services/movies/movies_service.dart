import 'package:cinebox/data/models/favorite_movie_response.dart';
import 'package:cinebox/data/models/save_favorite_movie.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MoviesService {
  factory MoviesService(Dio dio, {String baseUrl}) = _MoviesService;

  @GET('/favorite')
  Future<List<FavoriteMovieResponse>> getFavoriteMovies();

  @DELETE('/favorite/{movieId}')
  Future<void> removeFavoriteMovie(@Path('movieId') int movieId);

  @POST('/favorite')
  Future<void> saveFavoriteMovie(@Body() SaveFavoriteMovie request);
}
