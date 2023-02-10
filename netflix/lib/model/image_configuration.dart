import 'package:json_annotation/json_annotation.dart';

part 'image_configuration.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageConfiguration {
  final String baseUrl;
  final String secureBaseUrl;
  final List<String> backdropSizes;
  final List<String> posterSizes;
  final List<String> profileSizes;
  final List<String> stillSizes;
  ImageConfiguration({
    required this.baseUrl,
    required this.secureBaseUrl,
    required this.backdropSizes,
    required this.posterSizes,
    required this.profileSizes,
    required this.stillSizes,
  });

  factory ImageConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ImageConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ImageConfigurationToJson(this);
}
