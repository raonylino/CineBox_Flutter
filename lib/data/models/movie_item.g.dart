// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieItem _$MovieItemFromJson(Map<String, dynamic> json) => MovieItem(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String,
  genreIds: (json['genreIds'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  poster_path: json['poster_path'] as String?,
  backdrop_path: json['backdrop_path'] as String?,
  vote_average: (json['vote_average'] as num?)?.toDouble(),
  release_date: json['release_date'] as String?,
);

Map<String, dynamic> _$MovieItemToJson(MovieItem instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'genreIds': instance.genreIds,
  'poster_path': instance.poster_path,
  'backdrop_path': instance.backdrop_path,
  'vote_average': instance.vote_average,
  'release_date': instance.release_date,
};
