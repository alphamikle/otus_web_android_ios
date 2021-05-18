import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'pagination_response.g.dart';

@immutable
abstract class PaginationResponse<T> {
  const PaginationResponse({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  final int page;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'total_results')
  final int totalResults;

  final List<T> results;

  Map<String, dynamic> toJson();
}
