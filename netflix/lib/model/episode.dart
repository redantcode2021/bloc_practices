import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Episode {
  final int id;
  final String name;
  final String? overview;
  final int episodeNumber;
  final String? stillPath;
  final DateTime? airDate;
  Episode({
    required this.id,
    required this.name,
    this.overview,
    required this.episodeNumber,
    this.stillPath,
    this.airDate,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}
