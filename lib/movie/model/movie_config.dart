import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_config.g.dart';

@immutable
@JsonSerializable()
@CopyWith()
class MovieConfig {
  const MovieConfig({
    required this.url,
    required this.sizes,
  });

  factory MovieConfig.fromJson(Map<String, dynamic> json) => _$MovieConfigFromJson(json);

  @JsonKey(name: 'secure_base_url')
  final String url;

  @JsonKey(name: 'backdrop_sizes')
  final List<String> sizes;

  String generateSmallUrl(String imageUrl) => '${url}w500$imageUrl';
}

@immutable
@JsonSerializable()
@CopyWith()
class MovieConfigResponse {
  const MovieConfigResponse({
    required this.config,
  });

  factory MovieConfigResponse.fromJson(Map<String, dynamic> json) => _$MovieConfigResponseFromJson(json);

  @JsonKey(name: 'images')
  final MovieConfig config;
}
