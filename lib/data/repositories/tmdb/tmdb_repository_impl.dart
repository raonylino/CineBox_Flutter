import 'dart:developer';

import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/models/movie.dart';
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
      return Success(MovieMappers.toMovies(moviesData));
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
      return Success(MovieMappers.toMovies(moviesData));
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
      return Success(MovieMappers.toMovies(moviesData));
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
      return Success(MovieMappers.toMovies(moviesData));
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
}
