import 'package:flutter/material.dart';
import 'package:flutter_weather_app_v2/theme/theme.dart';
import 'package:flutter_weather_app_v2/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
              home: const HomePage(),
              debugShowCheckedModeBanner: false,
            );
          },
        ),
    );

  }
}

