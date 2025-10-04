import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/models/save_favorite_movie.dart';
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
              id: f.movie_id,
              title: f.title,
              posterPath: f.poster_url,
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

  @override
  Future<Result<Unit>> deleteFavoriteMovie({required int movieId}) async {
    try {
      await _moviesService.removeFavoriteMovie(movieId);
      return successOfUnit();
    } on DioException catch (e) {
      log(
        'Erro ao remover filme favorito',
        name: 'MovieRepository',
        error: e,
      );
      return Failure(
        DataException(message: 'Erro ao remover filme favorito'),
      );
    }
  }

  @override
  Future<Result<Unit>> saveFavoriteMovie({
    required FavoriteMovie favoriteMovie,
  }) async {
    try {
      await _moviesService.saveFavoriteMovie(
        SaveFavoriteMovie(
          movie_id: favoriteMovie.id,
          title: favoriteMovie.title,
          poster_url: favoriteMovie.posterPath,
          year: favoriteMovie.year,
        ),
      );
      return successOfUnit();
    } on DioException catch (e) {
      log(
        'Erro ao salvar filme favorito',
        name: 'MovieRepository',
        error: e,
      );
      return Failure(
        DataException(message: 'Erro ao salvar filme favorito'),
      );
    }
  }
}
