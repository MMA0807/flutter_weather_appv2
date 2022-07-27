import 'dart:async';

import 'package:flutter_weather_app_v2/weather_api_client/models/weather.dart' hide Weather;
import 'package:flutter_weather_app_v2/weather_api_client/weather_api_client.dart';
import 'package:flutter_weather_app_v2/weather_repository/models/weather.dart';


class WeatherFailure implements Exception {}

class WeatherRepository {
  WeatherRepository({WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? WeatherApiClient();

  final WeatherApiClient _weatherApiClient;

  Future<Weather> getWeather(String city) async {

    final location = await _weatherApiClient.locationSearch(city);
    final currentWeather = await _weatherApiClient.getCurrentWeather(city);

    return Weather(
      temperature: currentWeather.tempC,
      location: location.name,
      condition: currentWeather.condition.text.toCondition,
    );
  }
}

extension on WeatherState {
  WeatherCondition get toCondition {
    switch (this) {
      case WeatherState.clear:
        return WeatherCondition.clear;
      case WeatherState.snow:
      case WeatherState.sleet:
      case WeatherState.hail:
        return WeatherCondition.snowy;
      case WeatherState.thunderstorm:
      case WeatherState.heavyRain:
      case WeatherState.lightRain:
      case WeatherState.showers:
        return WeatherCondition.rainy;
      case WeatherState.heavyCloud:
      case WeatherState.lightCloud:
        return WeatherCondition.cloudy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
