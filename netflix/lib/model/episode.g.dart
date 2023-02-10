// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String?,
      episodeNumber: json['episode_number'] as int,
      stillPath: json['still_path'] as String?,
      airDate: json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'episode_number': instance.episodeNumber,
      'still_path': instance.stillPath,
      'air_date': instance.airDate?.toIso8601String(),
    };
