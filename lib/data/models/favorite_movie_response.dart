// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'favorite_movie_response.g.dart';

@JsonSerializable()
class FavoriteMovieResponse {
  final int movie_id;
  final String poster_url;
  final String title;
  final int year;

  FavoriteMovieResponse({
    required this.movie_id,
    required this.poster_url,
    required this.title,
    required this.year,
  });

  factory FavoriteMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteMovieResponseToJson(this);
}
