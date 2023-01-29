import 'package:json_annotation/json_annotation.dart';

import 'model_barrel.dart';
part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Result {
  final int id;
  final String? slug;
  final String? name;
  final DateTime? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final int? ratingTop;
  final List<Rating>? ratings;
  final int? ratingsCount;
  final int? reviewsTextCount;
  final int? added;
  final AddedByStatus? addedByStatus;
  final int? metacritic;
  final int? playtime;
  final int? suggestionsCount;
  final DateTime? updated;
  final String? userGame;
  final int? reviewsCount;
  final String? saturatedColor;
  final String? dominantColor;
  final List<PlatformElement>? platforms;
  final List<ParentPlatform>? parentPlatforms;
  final List<Genre>? genres;
  final List<Store>? store;
  final String? clip;
  final List<Genre>? tags;
  final EsrbRating? esrbRating;
  final List<ShortScreenShot>? shortScreenshots;
  Result({
    required this.id,
    this.name,
    this.slug,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.playtime,
    this.suggestionsCount,
    this.updated,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.store,
    this.clip,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
