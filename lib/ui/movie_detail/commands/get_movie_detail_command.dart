import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/domain/models/movie_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_detail_command.g.dart';

@riverpod
class GetMovieDetailCommand extends _$GetMovieDetailCommand {
  @override
  AsyncValue<MovieDetail?> build() => AsyncLoading();

  Future<void> execute(int movieId) async {
    final result = await ref
        .read(tmdbRepositoryProvider)
        .getMovieDetail(movieId: movieId);

    state = switch (result) {
      Success(value: final movieDetail) => AsyncData(movieDetail),
      Failure() => AsyncError(
        'Erro ao buscar detalhes do filme',
        StackTrace.current,
      ),
    };
  }
}
