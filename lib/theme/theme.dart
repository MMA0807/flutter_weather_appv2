import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app_v2/colors.dart';
import 'package:flutter_weather_app_v2/theme/theme_preferences.dart';

class ThemeModel with ChangeNotifier {
  bool _isDark = false;
  ThemePreferences _preferences = ThemePreferences();

  bool get isDark => _isDark;

  var _theme = ThemeData();

  ThemeData themeDark = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.blueGrey,
    ).copyWith(secondary: AppColors.blueGrey700,
      onPrimary: Colors.black,
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: AppColors.black)),
  );

  ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(bodyText2: TextStyle(color: AppColors.white)),
  );

  String titleText = 'Dark Mode';

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }

  toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  currentTheme() {
    var elements = {};
    var icon = Icons.nightlight_round;
    var gradient = AppColors.linearGradientGreyBlue;
    var shadowColor = AppColors.blueGrey.withOpacity(.5);
    var colorOfImage = AppColors.black.withOpacity(.5);
    Color backgroundColor = AppColors.blueGrey;

    if(_isDark) {
      titleText = tr('home.dark_mode');
      _theme = themeDark;
      elements = {
        'theme' : _theme,
        'icon' : icon,
        'gradient' : gradient,
        'shadowColor' : shadowColor,
        'colorOfImage' : colorOfImage,
        'backgroundColor' : backgroundColor,
        'titleText' : titleText,
      };
    } else {
      titleText = tr('home.light_mode');
      _theme = themeLight;
      icon = Icons.wb_sunny;
      gradient = AppColors.linearGradientBlue;
      shadowColor = AppColors.primaryColor.withOpacity(.5);
      colorOfImage = AppColors.white.withOpacity(.5);
      backgroundColor = AppColors.primaryColor;

      elements = {
        'theme' : _theme,
        'icon' : icon,
        'gradient' : gradient,
        'shadowColor' : shadowColor,
        'colorOfImage' : colorOfImage,
        'backgroundColor' : backgroundColor,
        'titleText' : titleText,
      };
    }
    return elements;
  }
}
