import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app_v2/weather_api_client/models/location.dart';
import 'package:flutter_weather_app_v2/weather_api_client/models/weather.dart';

class LocationIdRequestFailure implements Exception {}

class WeatherRequestFailure implements Exception {}

class WeatherApiClient {

  static const String _apiKey =
      '6c2b96fa31ae43b2b10121727222207';
  static const _baseUrl = 'api.weatherapi.com/v1';
  final Dio _dio = Dio();

  Future<Location> locationSearch(String query) async {
    const locationRequest = "https://$_baseUrl/forecast.json?key=" + _apiKey;

    try {
      final locationResponse = await _dio
          .get(locationRequest,
          queryParameters: {'days': '7', 'q': query});

      if (locationResponse.statusCode != 200) {
        throw LocationIdRequestFailure();
      }

      final weatherData = locationResponse.data;

      var locationData = weatherData["location"];

      return Location.fromJson(locationData);
    } on DioError catch (e) {
      debugPrint(e.response?.statusCode.toString());
      throw Exception("Failed to load weather");
    }
  }

  Future<Current> getCurrentWeather(String query) async {
    const currentWeatherRequest = "https://$_baseUrl/current.json?key=" +
        _apiKey;
    try {
      final currentWeatherResponse = await _dio
          .get(currentWeatherRequest, queryParameters: {'q': query});

      if (currentWeatherResponse.statusCode != 200) {
        throw WeatherRequestFailure();
      }

      final currentWeatherData = currentWeatherResponse.data;



      return Current.fromJson(currentWeatherData["current"]);

    } on DioError catch (e) {
      debugPrint(e.response?.statusCode.toString());
      throw Exception("Failed to load weather");
    }
  }

}
