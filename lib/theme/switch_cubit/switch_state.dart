import 'package:flutter/material.dart';
import 'package:flutter_weather_app_v2/theme/theme_data.dart';

class SwitchState {
  final bool isDarkThemeOn;
  ThemeData theme = ThemeData();
  String titleText = 'Dark';

  SwitchState({required this.isDarkThemeOn}) {
    if (isDarkThemeOn) {
      titleText = 'Dark';
      theme = appThemeData[AppTheme.darkAppTheme]!;
    } else {
      titleText = 'Light';
      theme = appThemeData[AppTheme.lightAppTheme]!;
    }
  }

  SwitchState copyWith({ bool? changeState}) {
    return SwitchState(isDarkThemeOn: changeState ?? isDarkThemeOn);
  }
}