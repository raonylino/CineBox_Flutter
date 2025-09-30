import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/usecases/usecases_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_by_genre_command.g.dart';

@riverpod
class GetMovieByGenreComman extends _$GetMovieByGenreComman {
  @override
  AsyncValue<List<Movie>> build() => AsyncLoading();
  Future<void> execute(int genreId) async {
    state = AsyncLoading();
    final getMoviesByGenreUsecase = ref.read(getMoviesByGenreUsecaseProvider);
    final result = await getMoviesByGenreUsecase.execute(genreId: genreId);
    state = switch (result) {
      Success(value: final movies) => AsyncData(movies),
      Failure(:final error) => AsyncError(
        error,
        StackTrace.current,
      ),
    };
  }
}
