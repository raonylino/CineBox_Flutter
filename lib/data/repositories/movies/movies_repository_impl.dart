import 'dart:developer';

import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/services/movies/movies_service.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:dio/dio.dart';

import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesService _moviesService;

  MoviesRepositoryImpl({required MoviesService moviesService})
    : _moviesService = moviesService;
  @override
  Future<Result<List<FavoriteMovie>>> getMyFavoriteMovies() async {
    try {
      final response = await _moviesService.getFavoriteMovies();
      final favoriteMovies = response
          .map(
            (f) => FavoriteMovie(
              id: f.movieId,
              title: f.title,
              posterPath: f.posterUrl,
              year: f.year,
            ),
          )
          .toList();

      return Success(favoriteMovies);
    } on DioException catch (e) {
      log(
        'Erro ao buscar filmes favoritos',
        name: 'MovieRepository',
        error: e,
      );
      return Failure(
        DataException(message: 'Erro ao buscar filmes favoritos'),
      );
    }
  }
}
