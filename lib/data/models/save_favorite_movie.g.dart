// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_favorite_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveFavoriteMovie _$SaveFavoriteMovieFromJson(Map<String, dynamic> json) =>
    SaveFavoriteMovie(
      movie_id: (json['movie_id'] as num).toInt(),
      poster_url: json['poster_url'] as String,
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$SaveFavoriteMovieToJson(SaveFavoriteMovie instance) =>
    <String, dynamic>{
      'movie_id': instance.movie_id,
      'poster_url': instance.poster_url,
      'title': instance.title,
      'year': instance.year,
    };
