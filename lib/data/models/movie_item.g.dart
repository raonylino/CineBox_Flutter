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
  posterPath: json['poster_path'] as String?,
  backdropPath: json['backdrop_path'] as String?,
  voteAverage: (json['voteAverage'] as num?)?.toDouble(),
  releaseDate: json['releaseDate'] as String?,
);

Map<String, dynamic> _$MovieItemToJson(MovieItem instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'genreIds': instance.genreIds,
  'posterPath': instance.posterPath,
  'backdropPath': instance.backdropPath,
  'voteAverage': instance.voteAverage,
  'releaseDate': instance.releaseDate,
};
