import 'package:cinebox/ui/movies/commands/get_movie_by_genre_command.dart';
import 'package:cinebox/ui/movies/commands/get_movies_by_category_command.dart';
import 'package:cinebox/ui/movies/commands/search_movies_by_name_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_view_model.g.dart';

enum MoviesViewEnum { byCategory, bySearch, byGenre }

@riverpod
class MoviesViewModel extends _$MoviesViewModel {
  @override
  MoviesViewEnum build() {
    return MoviesViewEnum.byCategory;
  }

  Future<void> changeView(MoviesViewEnum view) async {
    state = view;
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> fetchMoviesByCategory() async {
    await changeView(MoviesViewEnum.byCategory);
    await ref.read(getMoviesByCategoryCommandProvider.notifier).execute();
  }

  Future<void> fetchMoviesByGenre(int genreId) async {
    await changeView(MoviesViewEnum.byGenre);
    await ref.read(getMovieByGenreCommanProvider.notifier).execute(genreId);
  }

  Future<void> fetchMoviesByName(String name) async {
    await changeView(MoviesViewEnum.bySearch);
    await ref.read(searchMoviesByNameCommandProvider.notifier).execute(name);
  }
}
