import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ThemeState with ChangeNotifier {
  Brightness _brightness = Brightness.light;
  FlexScheme _scheme = FlexScheme.deepBlue;
  late ThemeData _theme;

  Brightness get brightness => _brightness;
  FlexScheme get scheme => _scheme;
  ThemeData get theme => _theme;

  void setBrightness(Brightness brightness) {
    _brightness = brightness;
    _buildTheme();
  }

  void setScheme(FlexScheme scheme) {
    _scheme = scheme;
    _buildTheme();
  }

  void init() {
    _buildTheme();
  }

  void _buildTheme() {
    if (brightness == Brightness.dark) {
      _theme = FlexColorScheme.dark(
        scheme: scheme,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme;
    } else {
      _theme = FlexColorScheme.light(
        scheme: scheme,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme;
    }
    notifyListeners();
  }
}
