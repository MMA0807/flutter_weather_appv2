import 'package:flutter/material.dart';

abstract class AppColors {
  static const primaryColor = Color(0xff6b9dfc);

  static const blueGrey700 = Color(0xFF455A64);
  static const blueGrey = Colors.blueGrey;
  static const black = Colors.black;
  static const blackOpacity = Color(0x80000000);
  static const white = Colors.white;

  static const linearGradientGreyBlue =  LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xffd4dae0), blueGrey700],
      stops: [0.0,1.0]
  );

  static const linearGradientBlue =  LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xff6b9dfc), Color(0xff205cf1)],
      stops: [0.0,1.0]
  );
  static const linearGradientWhite =  LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xfffafafc), Color(0xffd4dae0)],
      stops: [0.0,1.0]
  );
  final linearGradientPurple =  const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xff51087E), Color(0xff6C0BA9)],
      stops: [0.0,1.0]
  );
}

// Card(
// elevation: 3.0,
// margin: const EdgeInsets.only(bottom: 20),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.spaceAround,
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment.center,
// children: [
// Text(
// getForecastWeather(
// 1)["forecastDate"],
// style: const TextStyle(
// color: Color(0xff6696f5),
// fontWeight: FontWeight.w600,
// ),
// ),
// Row(
// children: [
// Row(
// children: [
// Text(
// getForecastWeather(1)[
// "minTemperature"]
// .toString(),
// style: TextStyle(
// color: _constants
//     .greyColor,
// fontSize: 30,
// fontWeight:
// FontWeight.w600,
// ),
// ),
// Text(
// '°',
// style: TextStyle(
// color: _constants
//     .greyColor,
// fontSize: 30,
// fontWeight:
// FontWeight.w600,
// fontFeatures: const [
// FontFeature
//     .enable(
// 'sups'),
// ]),
// ),
// ],
// ),
// Row(
// children: [
// Text(
// getForecastWeather(1)[
// "maxTemperature"]
//     .toString(),
// style: TextStyle(
// color: _constants
//     .blackColor,
// fontSize: 30,
// fontWeight:
// FontWeight.w600,
// ),
// ),
// Text(
// '°',
// style: TextStyle(
// color: _constants
//     .blackColor,
// fontSize: 30,
// fontWeight:
// FontWeight.w600,
// fontFeatures: const [
// FontFeature
//     .enable(
// 'sups'),
// ]),
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// const SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Image.asset(
// 'assets/' +
// getForecastWeather(
// 1)["weatherIcon"],
// width: 30,
// ),
// const SizedBox(
// width: 5,
// ),
// Text(
// getForecastWeather(
// 0)["weatherName"],
// style: const TextStyle(
// fontSize: 16,
// color: Colors.grey,
// ),
// ),
// ],
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Text(
// getForecastWeather(1)[
// "chanceOfRain"]
//     .toString() +
// "%",
// style: const TextStyle(
// fontSize: 18,
// color: Colors.grey,
// ),
// ),
// const SizedBox(
// width: 5,
// ),
// Image.asset(
// 'assets/lightrain.png',
// width: 30,
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// Card(
// elevation: 3.0,
// margin: const EdgeInsets.only(bottom: 20),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.spaceAround,
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment.center,
// children: [
// Text(
// getForecastWeather(
// 2)["forecastDate"],
// style: const TextStyle(
// color: Color(0xff6696f5),
// fontWeight: FontWeight.w600,
// ),
// ),
// Row(
// children: [
// Row(
// children: [
// Text(
// getForecastWeather(2)[
// "minTemperature"]
//     .toString(),
// style: TextStyle(
// color: _constants
//     .greyColor,
// fontSize: 30,
// fontWeight:
// FontWeight.w600,
// ),
// ),
// Text(
// '°',
// style: TextStyle(
// color: _constants
//     .greyColor,
// fontSize: 30,
// fontWeight:
// FontWeight.w600,
// fontFeatures: const [
// FontFeature
//     .enable(
// 'sups'),
// ]),
// ),
// ],
// ),
// Row(
// children: [
// Text(
// getForecastWeather(2)[
// "maxTemperature"]
//     .toString(),
// style: TextStyle(
// color: _constants
//     .blackColor,
// fontSize: 30,
// fontWeight:
// FontWeight.w600,
// ),
// ),
// Text(
// '°',
// style: TextStyle(
// color: _constants
//     .blackColor,
// fontSize: 30,
// fontWeight:
// FontWeight.w600,
// fontFeatures: const [
// FontFeature
//     .enable(
// 'sups'),
// ]),
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// const SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Image.asset(
// 'assets/' +
// getForecastWeather(
// 2)["weatherIcon"],
// width: 30,
// ),
// const SizedBox(
// width: 5,
// ),
// Text(
// getForecastWeather(
// 2)["weatherName"],
// style: const TextStyle(
// fontSize: 16,
// color: Colors.grey,
// ),
// ),
// ],
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// Text(
// getForecastWeather(2)[
// "chanceOfRain"]
//     .toString() +
// "%",
// style: const TextStyle(
// fontSize: 18,
// color: Colors.grey,
// ),
// ),
// const SizedBox(
// width: 5,
// ),
// Image.asset(
// 'assets/lightrain.png',
// width: 30,
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// ),
// ),