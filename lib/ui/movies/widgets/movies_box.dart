import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/ui/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesBox extends StatelessWidget {
  final String title;
  final bool vertical;
  final List<Movie> movies;
  const MoviesBox({
    super.key,
    required this.title,
    this.vertical = false,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 32, bottom: 24),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
        ),
        Visibility(
          visible: !vertical,
          replacement: Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              runAlignment: WrapAlignment.center,
              children: [
                for (var movie in movies)
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: MovieCard(
                      id: movie.id,
                      title: movie.title,
                      year:
                          movie.releaseDate != null &&
                              movie.releaseDate!.isNotEmpty
                          ? DateTime.parse(movie.releaseDate!).year
                          : DateTime.now().year,
                      imageUrl:
                          'https://images.tmdb.org/t/p/w154${movie.posterPath}',
                      isFavorite: movie.isFavorite,
                    ),
                  ),
              ],
            ),
          ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 253,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20),
              itemCount: movies.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: MovieCard(
                    key: UniqueKey(),
                    id: movie.id,
                    title: movie.title,
                    year:
                        movie.releaseDate != null &&
                            movie.releaseDate!.isNotEmpty
                        ? DateTime.parse(movie.releaseDate!).year
                        : DateTime.now().year,
                    imageUrl:
                        'https://images.tmdb.org/t/p/w154${movie.posterPath}',
                    isFavorite: movie.isFavorite,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
