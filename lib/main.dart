import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_android_ios/di/di.dart';
import 'package:web_android_ios/movie/movie_view.dart';
import 'package:web_android_ios/provider/provider_wrapper.dart';
import 'package:web_android_ios/settings/settings_view.dart';
import 'package:web_android_ios/theme/theme_state.dart';

void main() {
  configureDependencies();
  runApp(
    const ProviderWrapper(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeState>().theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CinemApp'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Movies'),
              Tab(text: 'Settings'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MovieView(),
            SettingsView(),
          ],
        ),
      ),
    );
  }
}
