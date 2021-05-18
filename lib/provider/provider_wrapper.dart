import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_android_ios/di/di.dart';
import 'package:web_android_ios/movie/logic/movie_state.dart';
import 'package:web_android_ios/theme/theme_state.dart';

class ProviderWrapper extends StatelessWidget {
  const ProviderWrapper({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieState(movieRepository: di.get())..loadMovies()),
        ChangeNotifierProvider(create: (_) => ThemeState()..init()),
      ],
      child: child,
    );
  }
}
