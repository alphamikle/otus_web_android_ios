import 'dart:convert';

import 'package:web_android_ios/config/credentials.dart';

abstract class Config {
  static const String url = 'https://api.themoviedb.org/3/';
  static final String tkn = utf8.decode(cr);
}
