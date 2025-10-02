import 'package:cinebox/ui/movies/commands/search_movies_by_name_command.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    final searchMovies = ref.watch(searchMoviesByNameCommandProvider);

    return searchMovies.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          Center(child: Text('Ocorreu um erro ao buscar filmes')),
      data: (data) {
        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: MoviesBox(
            title: 'Filmes Encontrados pela busca',
            vertical: true,
            movies: data,
          ),
        );
      },
    );
  }
}
