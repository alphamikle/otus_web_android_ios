import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@immutable
@CopyWith()
@JsonSerializable()
class Movie {
  const Movie({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  final String title;

  @JsonKey(name: 'backdrop_path')
  final String imageUrl;

  @JsonKey(name: 'vote_average')
  final double rating;

  final String overview;
}
