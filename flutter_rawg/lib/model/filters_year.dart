import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_rawg/model/year_game.dart';
import 'model_barrel.dart';

part 'filters_year.g.dart';

@JsonSerializable()
class FiltersYear {
  final int? from;
  final int? to;
  final String? filter;
  final int? decade;
  final List<YearGame>? years;
  final bool? nofollow;
  final int? count;
  FiltersYear({
    this.from,
    this.to,
    this.filter,
    this.decade,
    this.years,
    this.nofollow,
    this.count,
  });

  factory FiltersYear.fromJson(Map<String, dynamic> json) =>
      _$FiltersYearFromJson(json);
}
