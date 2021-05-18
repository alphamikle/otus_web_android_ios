import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web_android_ios/movie/model/movie.dart';
import 'package:web_android_ios/repository/pagination_response.dart';

part 'movie_response.g.dart';

@immutable
@CopyWith()
@JsonSerializable()
class MovieResponse extends PaginationResponse<Movie> {
  const MovieResponse({
    required int page,
    required int totalPages,
    required int totalResults,
    required this.results,
  }) : super(page: page, totalPages: totalPages, totalResults: totalResults, results: results);

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  @override
  final List<Movie> results;
}
