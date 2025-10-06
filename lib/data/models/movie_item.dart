// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'movie_item.g.dart';

@JsonSerializable()
class MovieItem {
  final int id;
  final String title;
  final String overview;
  final List<int>? genre_ids;
  final String? poster_path;
  final String? backdrop_path;
  final double? vote_average;
  final String? release_date;

  MovieItem({
    required this.id,
    required this.title,
    required this.overview,
    this.genre_ids,
    this.poster_path,
    this.backdrop_path,
    this.vote_average,
    this.release_date,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) =>
      _$MovieItemFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemToJson(this);
}
