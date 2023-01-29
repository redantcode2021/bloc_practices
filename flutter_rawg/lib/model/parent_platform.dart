import 'package:json_annotation/json_annotation.dart';

import 'model_barrel.dart';
part 'parent_platform.g.dart';

@JsonSerializable()
class ParentPlatform {
  final EsrbRating? platform;
  ParentPlatform({
    this.platform,
  });

  factory ParentPlatform.fromJson(Map<String, dynamic> json) =>
      _$ParentPlatformFromJson(json);
}
