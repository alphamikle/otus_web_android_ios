import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:web_android_ios/config/config.dart';
import 'package:web_android_ios/movie/model/movie_config.dart';
import 'package:web_android_ios/movie/model/movie_response.dart';

part 'movie_repository.g.dart';

@RestApi(
  baseUrl: Config.url,
)
abstract class MovieRepository {
  factory MovieRepository(
    Dio dio, {
    required String baseUrl,
  }) {
    return _MovieRepository(dio, baseUrl: baseUrl);
  }

  @GET('discover/movie')
  Future<MovieResponse> loadMovies(
    @Query('page') int page,
    @Header('Authorization') String credentials,
  );

  @GET('configuration')
  Future<MovieConfigResponse> getConfiguration(
    @Header('Authorization') String credentials,
  );
}
