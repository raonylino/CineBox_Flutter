// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteMovieResponse _$FavoriteMovieResponseFromJson(
  Map<String, dynamic> json,
) => FavoriteMovieResponse(
  movieId: (json['movieId'] as num).toInt(),
  title: json['title'] as String,
  posterUrl: json['posterUrl'] as String,
  year: (json['year'] as num).toInt(),
);

Map<String, dynamic> _$FavoriteMovieResponseToJson(
  FavoriteMovieResponse instance,
) => <String, dynamic>{
  'movieId': instance.movieId,
  'title': instance.title,
  'posterUrl': instance.posterUrl,
  'year': instance.year,
};
