import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/domain/usecases/get_movies_by_category_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecases_provider.g.dart';

@riverpod
GetMoviesByCategoryUsecase getMoviesByCategoryUsecase(Ref ref) =>
    GetMoviesByCategoryUsecase(
      tmdbRepository: ref.watch(tmdbRepositoryProvider),
    );
