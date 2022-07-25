import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app_v2/colors.dart';
import 'package:flutter_weather_app_v2/components/weather_item.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class DetailPage extends StatefulWidget {
  final List dailyForecastWeather;

  const DetailPage({Key? key, required this.dailyForecastWeather}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var weatherData = widget.dailyForecastWeather;

    //function to get weather
    Map getForecastWeather(int index) {
      int maxWindSpeed = weatherData[index]["day"]["maxwind_kph"].toInt();
      int avgHumidity = weatherData[index]["day"]["avghumidity"].toInt();
      int chanceOfRain =
          weatherData[index]["day"]["daily_chance_of_rain"].toInt();

      var parsedDate = DateTime.parse(weatherData[index]["date"]);
      var forecastDate = DateFormat('EEEE, d MMMM').format(parsedDate);

      String weatherName = weatherData[index]["day"]["condition"]["text"];
      String weatherIcon =
          weatherName.replaceAll(' ', '').toLowerCase() + ".png";

      int minTemperature = weatherData[index]["day"]["mintemp_c"].toInt();
      int maxTemperature = weatherData[index]["day"]["maxtemp_c"].toInt();

      var forecastData = {
        'maxWindSpeed': maxWindSpeed,
        'avgHumidity': avgHumidity,
        'chanceOfRain': chanceOfRain,
        'forecastDate': forecastDate,
        'weatherName': weatherName,
        'weatherIcon': weatherIcon,
        'minTemperature': minTemperature,
        'maxTemperature': maxTemperature
      };
      return forecastData;
    }

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
        final currentTheme = themeNotifier.currentTheme();
      return Scaffold(
        backgroundColor: currentTheme['backgroundColor'],
        appBar: AppBar(
          title: const Text('Forecasts'),
          centerTitle: true,
          backgroundColor: currentTheme['backgroundColor'],
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    themeNotifier.toggleTheme();
                  },
                  icon: const Icon(Icons.settings)),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: size.height * .75,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -50,
                      right: 20,
                      left: 20,
                      child: Container(
                        height: 300,
                        width: size.width * .7,
                        decoration: BoxDecoration(
                          gradient:  currentTheme['gradient'],
                          boxShadow: [
                            BoxShadow(
                              color:  currentTheme['shadowColor'],
                              offset: const Offset(0, 25),
                              blurRadius: 3,
                              spreadRadius: -10,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Image.asset("assets/" +
                                  getForecastWeather(0)["weatherIcon"]),
                              width: 150,
                            ),
                            Positioned(
                              top: 130,
                              left: 25,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  getForecastWeather(0)["weatherName"],
                                  style: const TextStyle(
                                      fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: Container(
                                width: size.width * .8,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    WeatherItem(
                                      value:
                                          getForecastWeather(0)["maxWindSpeed"],
                                      unit: "km/h",
                                      imageUrl: "assets/windspeed.png",
                                    ),
                                    WeatherItem(
                                      value:
                                          getForecastWeather(0)["avgHumidity"],
                                      unit: "%",
                                      imageUrl: "assets/humidity.png",
                                    ),
                                    WeatherItem(
                                      value:
                                          getForecastWeather(0)["chanceOfRain"],
                                      unit: "%",
                                      imageUrl: "assets/lightrain.png",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getForecastWeather(0)["maxTemperature"]
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'o',
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 320,
                              left: 0,
                              child: SizedBox(
                                height: 400,
                                width: size.width * .9,
                                child: ListView.builder(
                                    itemCount: weatherData.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, dynamic index) {
                                      return Card(
                                        elevation: 3.0,
                                        color: currentTheme['backgroundColor'],
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    getForecastWeather(
                                                        index)["forecastDate"],
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            getForecastWeather(
                                                                        index)[
                                                                    "minTemperature"]
                                                                .toString(),
                                                            style: const TextStyle(
                                                              color: AppColors
                                                                  .greyColor,
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          const Text(
                                                            '°',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .greyColor,
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFeatures: [
                                                                  FontFeature
                                                                      .enable(
                                                                          'sups'),
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            getForecastWeather(
                                                                        index)[
                                                                    "maxTemperature"]
                                                                .toString(),
                                                            style: const TextStyle(
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          const Text(
                                                            '°',
                                                            style: TextStyle(
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFeatures: [
                                                                  FontFeature
                                                                      .enable(
                                                                          'sups'),
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/' +
                                                            getForecastWeather(
                                                                    0)[
                                                                "weatherIcon"],
                                                        width: 30,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        getForecastWeather(
                                                            0)["weatherName"],
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          color: AppColors.greyColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        getForecastWeather(
                                                                        index)[
                                                                    "chanceOfRain"]
                                                                .toString() +
                                                            "%",
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          color: AppColors.greyColor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Image.asset(
                                                        'assets/lightrain.png',
                                                        width: 30,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
