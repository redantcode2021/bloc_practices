import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final String originalName;
  final String originalLanguage;
  final String type;
  final List<int> genreIds;
  final double popularity;
  final DateTime? releaseDate;
  final double voteAverage;
  final int voteCount;
  final List<String> originCountry;
  final String? backdropPath;
  final bool adult;
  final bool video;
  final int? runtime;
  final int? episodes;
  final int? seasons;
  final bool details;
  Movie({
    required this.id,
    required this.name,
    required this.overview,
    this.posterPath,
    required this.originalName,
    required this.originalLanguage,
    required this.type,
    required this.genreIds,
    required this.popularity,
    this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
    this.backdropPath,
    required this.adult,
    required this.video,
    this.runtime,
    this.episodes,
    this.seasons,
    required this.details,
  });

  String getRuntime() {
    if (type == 'movie') {
      var hours = runtime! / 60,
          justHours = hours.floor(),
          minutes = ((hours - hours.floor()) * 60).floor();
      return '${justHours > 0 ? '${justHours}h' : ''}${minutes > 0 ? '${justHours > 0 ? ' ' : ''}${minutes}m' : ''}';
    }
    return episodes! < 20 ? '$episodes Episodes' : '$seasons Seasons';
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
