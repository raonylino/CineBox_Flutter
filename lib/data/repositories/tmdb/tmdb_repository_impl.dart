import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/models/genre.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/models/movie_detail.dart';
import 'package:dio/dio.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required TmdbService tmdbService})
    : _tmdbService = tmdbService;
  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes populares',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar filmes populares'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getNowPlaying(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes em cartaz',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar filmes em cartaz'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar top filmes ',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar top filmes'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getUpcomingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getUpcomingMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes lancamentos',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar filmes lancamentos'),
      );
    }
  }

  @override
  Future<Result<List<Genre>>> getMovieGenres() async {
    try {
      final data = await _tmdbService.getMovieGenres();
      final genres = data.genres
          .map((e) => Genre(id: e.id, name: e.name))
          .toList();
      return Success(genres);
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar generos de filmes',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar generos de filmes'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getMoviesByGenre({required int genreId}) async {
    try {
      final data = await _tmdbService.getDiscoverMovie(
        withGenres: genreId.toString(),
      );
      return Success(MovieMappers.mapToMovies(data));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes por genero',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar filmes por genero'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> searchMovies({required String query}) async {
    try {
      final data = await _tmdbService.searchMovies(query: query);
      return Success(MovieMappers.mapToMovies(data));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes por nome',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar filmes por nome'),
      );
    }
  }

  @override
  Future<Result<MovieDetail>> getMovieDetail({required int movieId}) async {
    try {
      final result = await _tmdbService.getMovieDetails(
        movieId: movieId,
        appendToResponse:
            'credits,videos,recommendations,releases_dates,images',
      );
      final movieDetail = MovieMappers.mapToMovieDetail(result);
      return Success(movieDetail);
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar detalhes do filme',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar detalhes do filme'),
      );
    }
  }
}
