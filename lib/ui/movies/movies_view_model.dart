import 'package:cinebox/ui/movies/commands/get_movies_by_category_command.dart';
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
}
