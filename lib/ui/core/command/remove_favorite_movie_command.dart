import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/ui/core/command/favorite_movie_command.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_favorite_movie_command.g.dart';

@riverpod
class RemoveFavoriteMovieCommand extends _$RemoveFavoriteMovieCommand {
  @override
  AsyncValue<int> build(Key key, int movieId) => AsyncData(movieId);

  Future<void> execute() async {
    final favoriteMoiveCommand = ref.read(
      favoriteMovieCommandProvider(movieId).notifier,
    )..setFavorite(false);
    final repo = ref.read(moviesRepositoryProvider);
    final result = await repo.deleteFavoriteMovie(movieId: movieId);
    switch (result) {
      case Success():
        log('Success: favortie movie removido com sucesso');
      case Failure(:final error):
        favoriteMoiveCommand.setFavorite(true);
        state = AsyncError(error, StackTrace.current);
    }
  }
}
