import 'package:cinebox/ui/movies/widgets/genres_box.dart';
import 'package:cinebox/ui/movies/widgets/movies_appbar.dart';
import 'package:cinebox/ui/movies/widgets/movies_by_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesScrean extends ConsumerStatefulWidget {
  const MoviesScrean({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesScreanState();
}

class _MoviesScreanState extends ConsumerState<MoviesScrean> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MoviesAppbar(),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 22),
            child: GenresBox(),
          ),
        ),
        SliverToBoxAdapter(
          child: MoviesBySearch(),
        ),
      ],
    );
  }
}
