import 'package:cinebox/domain/models/movie.dart';

extension MarkFavoriteExtension on List<Movie> {
  List<Movie> markFavorite(List<int> myFavories) {
    return map((movie) {
      if (myFavories.contains(movie.id)) {
        return movie.copyWith(isFavorite: true);
      } else {
        return movie;
      }
    }).toList();
  }
}
