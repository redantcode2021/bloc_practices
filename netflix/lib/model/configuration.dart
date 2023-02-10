import 'package:json_annotation/json_annotation.dart';

import 'package:netflix/model/image_configuration.dart';

part 'configuration.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Configuration {
  final ImageConfiguration images;
  final List<String> changeKeys;
  Configuration({
    required this.images,
    required this.changeKeys,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}
