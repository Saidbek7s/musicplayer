import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/darkmode.dart';
import 'package:flutter_application_1/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //init kunnduzgi rejim
  ThemeData _themeData = lightMode;
  //get tema
  ThemeData get themeData => _themeData;
  //is dart mode
  bool get isDarkMode => _themeData == darkMode;
  //set theme

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //togglr mode
  void togatheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
