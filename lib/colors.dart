import 'package:flutter/material.dart';

abstract class AppColors {
  static const primaryColor = Color(0xff6b9dfc);

  static const greyColor = Color(0xffd9dadb);

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