// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageConfiguration _$ImageConfigurationFromJson(Map<String, dynamic> json) =>
    ImageConfiguration(
      baseUrl: json['base_url'] as String,
      secureBaseUrl: json['secure_base_url'] as String,
      backdropSizes: (json['backdrop_sizes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      posterSizes: (json['poster_sizes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      profileSizes: (json['profile_sizes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      stillSizes: (json['still_sizes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ImageConfigurationToJson(ImageConfiguration instance) =>
    <String, dynamic>{
      'base_url': instance.baseUrl,
      'secure_base_url': instance.secureBaseUrl,
      'backdrop_sizes': instance.backdropSizes,
      'poster_sizes': instance.posterSizes,
      'profile_sizes': instance.profileSizes,
      'still_sizes': instance.stillSizes,
    };
