import 'package:flutter/cupertino.dart';
import 'package:web_android_ios/config/config.dart';
import 'package:web_android_ios/movie/logic/movie_repository.dart';
import 'package:web_android_ios/movie/model/movie.dart';
import 'package:web_android_ios/movie/model/movie_config.dart';
import 'package:web_android_ios/movie/model/movie_response.dart';

class MovieState with ChangeNotifier {
  MovieState({
    required this.movieRepository,
  });

  @protected
  final MovieRepository movieRepository;

  MovieResponse moviesData = const MovieResponse(page: 0, totalPages: 0, totalResults: 0, results: []);
  final Set<int> loadedPages = {};
  final List<Movie> movies = [];
  int get moviesCount => movies.length;
  bool isLoading = false;
  MovieConfig? config;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> _loadConfig() async {
    final MovieConfigResponse response = await movieRepository.getConfiguration(Config.tkn);
    config = response.config;
  }

  Future<void> loadMovies([int page = 1]) async {
    startLoading();
    if (config == null) {
      await _loadConfig();
    }
    final MovieResponse response = await getMoviesResponse(page);
    moviesData = response;
    movies.addAll(response.results);
    endLoading();
    notifyListeners();
  }

  Future<MovieResponse> getMoviesResponse(int page) async {
    final MovieResponse response = await movieRepository.loadMovies(page, Config.tkn);
    loadedPages.add(page);
    return response.copyWith(results: response.results.map((Movie movie) => movie.copyWith(imageUrl: config!.generateSmallUrl(movie.imageUrl))).toList());
  }

  Future<void> loadNextPage() async {
    final int maxPage = moviesData.totalPages;
    final int nextPage = moviesData.page + 1;
    if (isLoading || nextPage > maxPage || loadedPages.contains(nextPage)) {
      return;
    }
    startLoading();
    final MovieResponse response = await getMoviesResponse(nextPage);
    moviesData = response;
    movies.addAll(response.results);
    endLoading();
  }
}
