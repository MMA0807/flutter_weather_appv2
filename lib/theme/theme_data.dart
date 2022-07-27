import 'package:flutter/material.dart';
import 'package:flutter_weather_app_v2/colors.dart';

enum AppTheme {
  lightAppTheme,
  darkAppTheme,
}

final appThemeData = {
  AppTheme.darkAppTheme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.blueGrey).copyWith(secondary: AppColors.blueGrey700, onPrimary: Colors.black),
    textTheme: const TextTheme(bodyText2: TextStyle(color: AppColors.black)),
  ),
  AppTheme.lightAppTheme: ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(bodyText2: TextStyle(color: AppColors.white)),
  ),
};
