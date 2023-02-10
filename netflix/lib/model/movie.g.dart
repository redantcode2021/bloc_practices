// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      originalName: json['original_name'] as String,
      originalLanguage: json['original_language'] as String,
      mediaType: json['media_type'] as String,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      backdropPath: json['backdrop_path'] as String?,
      adult: json['adult'] as bool?,
      video: json['video'] as bool?,
      runtime: json['runtime'] as int?,
      episodes: json['episodes'] as int?,
      seasons: json['seasons'] as int?,
      details: json['details'] as bool?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'original_name': instance.originalName,
      'original_language': instance.originalLanguage,
      'media_type': instance.mediaType,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate?.toIso8601String(),
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'origin_country': instance.originCountry,
      'backdrop_path': instance.backdropPath,
      'adult': instance.adult,
      'video': instance.video,
      'runtime': instance.runtime,
      'episodes': instance.episodes,
      'seasons': instance.seasons,
      'details': instance.details,
    };
