import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/domain/models/movie_by_category.dart';
import 'package:cinebox/domain/usecases/usecases_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movies_by_category_command.g.dart';

@riverpod
class GetMoviesByCategoryCommand extends _$GetMoviesByCategoryCommand {
  @override
  AsyncValue<MovieByCategory?> build() {
    return const AsyncData(null);
  }

  Future<void> execute() async {
    state = AsyncLoading();
    final getMoviesByCategoryUsecase = ref.read(
      getMoviesByCategoryUsecaseProvider,
    );
    final result = await getMoviesByCategoryUsecase.execute();
    state = switch (result) {
      Success<MovieByCategory>(value: final movieByCategory) => AsyncData(
        movieByCategory,
      ),
      Failure<MovieByCategory>(:final error) => AsyncError(
        error,
        StackTrace.current,
      ),
    };
  }
}
