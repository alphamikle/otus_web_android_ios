import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:web_android_ios/config/config.dart';
import 'package:web_android_ios/di/di.config.dart';
import 'package:web_android_ios/movie/logic/movie_repository.dart';

final GetIt di = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
)
void configureDependencies() {
  di.registerFactory(() => Dio());
  di.registerFactory(() => MovieRepository(di.get(), baseUrl: Config.url));
  $initGetIt(di);
}
