import 'package:cinebox/ui/movie_detail/commands/get_movie_detail_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_detail_view_model.g.dart';

class MovieDetailViewModel {
  final GetMovieDetailCommand _getMovieDetailCommand;

  MovieDetailViewModel({required GetMovieDetailCommand getMovieDetailCommand})
    : _getMovieDetailCommand = getMovieDetailCommand;

  Future<void> fetchMovieDetail(int movieId) async =>
      _getMovieDetailCommand.execute(movieId);
  //fetchMo
}

@riverpod
MovieDetailViewModel movieDetailViewModel(Ref ref) => MovieDetailViewModel(
  getMovieDetailCommand: ref.read(getMovieDetailCommandProvider.notifier),
);
