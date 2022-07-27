// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      isDay: json['is_day'] as int,
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windKph: (json['wind_kph'] as num).toDouble(),
      windDir: $enumDecode(_$WindDirectionCompassEnumMap, json['wind_dir'],
          unknownValue: WindDirectionCompass.unknown),
      pressureIn: (json['pressure_in'] as num).toDouble(),
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'windDir': _$WindDirectionCompassEnumMap[instance.windDir]!,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_kph': instance.windKph,
      'pressure_in': instance.pressureIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
    };

const _$WindDirectionCompassEnumMap = {
  WindDirectionCompass.north: 'N',
  WindDirectionCompass.northEast: 'NE',
  WindDirectionCompass.east: 'E',
  WindDirectionCompass.southEast: 'SE',
  WindDirectionCompass.south: 'S',
  WindDirectionCompass.southWest: 'SW',
  WindDirectionCompass.west: 'W',
  WindDirectionCompass.northWest: 'NW',
  WindDirectionCompass.unknown: 'unknown',
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      text: $enumDecode(_$WeatherStateEnumMap, json['text'],
          unknownValue: WeatherState.unknown),
      icon: json['icon'] as String,
      code: json['code'] as int,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'icon': instance.icon,
      'code': instance.code,
      'text': _$WeatherStateEnumMap[instance.text]!,
    };

const _$WeatherStateEnumMap = {
  WeatherState.snow: 'Snow',
  WeatherState.sleet: 'Sleet',
  WeatherState.hail: 'Hail',
  WeatherState.thunderstorm: 'Thunderstorm',
  WeatherState.heavyRain: 'Moderate or heavy rain with thunder',
  WeatherState.lightRain: 'Patchy rain possible',
  WeatherState.showers: 'Showers',
  WeatherState.heavyCloud: 'Overcast',
  WeatherState.lightCloud: 'Partly cloudy',
  WeatherState.clear: 'Sunny',
  WeatherState.unknown: 'unknown',
};
