import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'weather.g.dart';

enum WeatherState {
  @JsonValue('Snow')
  snow,
  @JsonValue('Sleet')
  sleet,
  @JsonValue('Hail')
  hail,
  @JsonValue('Thunderstorm')
  thunderstorm,
  @JsonValue('Moderate or heavy rain with thunder')
  heavyRain,
  @JsonValue('Patchy rain possible')
  lightRain,
  @JsonValue('Showers')
  showers,
  @JsonValue('Overcast')
  heavyCloud,
  @JsonValue('Partly cloudy')
  lightCloud,
  @JsonValue('Sunny')
  clear,
  unknown
}

extension WeatherStateX on WeatherState {
  String? get abbr => _$WeatherStateEnumMap[this];
}

enum WindDirectionCompass {
  @JsonValue('N')
  north,
  @JsonValue('NE')
  northEast,
  @JsonValue('E')
  east,
  @JsonValue('SE')
  southEast,
  @JsonValue('S')
  south,
  @JsonValue('SW')
  southWest,
  @JsonValue('W')
  west,
  @JsonValue('NW')
  northWest,
  unknown,
}

@JsonSerializable()
class Weather {
  Weather({
    required this.location,
    required this.current,

  });

  final Location location;
  final Current current;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

}

@JsonSerializable()
class Current {
  Current({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.windDir,
    required this.pressureIn,
    required this.humidity,
    required this.cloud,
  });


  @JsonKey(unknownEnumValue: WindDirectionCompass.unknown)
  final WindDirectionCompass windDir;
  @JsonKey(name: 'temp_c')
  final double tempC;
  @JsonKey(name: 'temp_f')
  final double tempF;
  @JsonKey(name: 'is_day')
  final int isDay;
  final Condition condition;
  @JsonKey(name: 'wind_kph')
  final double windKph;
  // String windDir;
  @JsonKey(name: 'pressure_in')
  final double pressureIn;
  final int humidity;
  final int cloud;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);

}

@JsonSerializable()
class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String icon;
  final int code;
  @JsonKey(unknownEnumValue: WeatherState.unknown)
  final WeatherState text;


  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

}
