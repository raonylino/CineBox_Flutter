// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteMovieResponse _$FavoriteMovieResponseFromJson(
  Map<String, dynamic> json,
) => FavoriteMovieResponse(
  movie_id: (json['movie_id'] as num).toInt(),
  poster_url: json['poster_url'] as String,
  title: json['title'] as String,
  year: (json['year'] as num).toInt(),
);

Map<String, dynamic> _$FavoriteMovieResponseToJson(
  FavoriteMovieResponse instance,
) => <String, dynamic>{
  'movie_id': instance.movie_id,
  'poster_url': instance.poster_url,
  'title': instance.title,
  'year': instance.year,
};
