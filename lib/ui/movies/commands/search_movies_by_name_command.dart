import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/usecases/usecases_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_by_name_command.g.dart';

@riverpod
class SearchMoviesByNameCommand extends _$SearchMoviesByNameCommand {
  @override
  AsyncValue<List<Movie>> build() => const AsyncLoading();

  Future<void> execute(String name) async {
    state = const AsyncLoading();
    final getMoviesByNameUsecase = ref.read(getMoviesByNameUsecaseProvider);
    final result = await getMoviesByNameUsecase.execute(name: name);
    state = switch (result) {
      Success(value: final movies) => AsyncData(movies),
      Failure(:final error) => AsyncError(
        error,
        StackTrace.current,
      ),
    };
  }
}
