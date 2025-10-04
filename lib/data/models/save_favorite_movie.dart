// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'save_favorite_movie.g.dart';

@JsonSerializable()
class SaveFavoriteMovie {
  final int movie_id;
  final String poster_url;
  final String title;
  final int year;

  SaveFavoriteMovie({
    required this.movie_id,
    required this.poster_url,
    required this.title,
    required this.year,
  });

  factory SaveFavoriteMovie.fromJson(Map<String, dynamic> json) =>
      _$SaveFavoriteMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SaveFavoriteMovieToJson(this);
}
