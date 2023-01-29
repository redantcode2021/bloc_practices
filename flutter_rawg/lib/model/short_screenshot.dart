import 'package:json_annotation/json_annotation.dart';

part 'short_screenshot.g.dart';

@JsonSerializable()
class ShortScreenShot {
  final int? id;
  final String? image;
  ShortScreenShot({
    this.id,
    this.image,
  });

  factory ShortScreenShot.fromJson(Map<String, dynamic> json) =>
      _$ShortScreenShotFromJson(json);
}
