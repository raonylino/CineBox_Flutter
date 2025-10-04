import 'package:cinebox/ui/core/command/remove_favorite_movie_command.dart';
import 'package:cinebox/ui/core/command/save_favorite_movie_command.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_card_view_model.g.dart';

@riverpod
class MovieCardViewModel extends _$MovieCardViewModel {
  @override
  void build(Key key, int movieId) async {}

  void addOrRemoveFavorite({
    required int id,
    required String posterPath,
    required String title,
    required int year,
    required bool favorite,
  }) {
    if (favorite) {
      ref
          .read(saveFavoriteMovieCommandProvider(key, movieId).notifier)
          .execute(
            id: id,
            posterPath: posterPath,
            title: title,
            year: year,
          );
    } else {
      ref
          .read(removeFavoriteMovieCommandProvider(key, movieId).notifier)
          .execute();
    }
  }
}
