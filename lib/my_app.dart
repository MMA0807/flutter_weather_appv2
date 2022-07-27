import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_v2/theme/cubit/theme_cubit.dart';
import 'package:flutter_weather_app_v2/theme/switch_cubit/switch_cubit.dart';
import 'package:flutter_weather_app_v2/theme/switch_cubit/switch_state.dart';
import 'package:flutter_weather_app_v2/weather/view/weather_page.dart';
import 'package:flutter_weather_app_v2/weather_repository/weather_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(key: key);

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit(),
          ),
          BlocProvider<SwitchCubit>(
            create: (context) => SwitchCubit(),
          ),
        ],
        child: const WeatherAppView(),
      ),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, color) {
        return BlocBuilder<SwitchCubit, SwitchState>(builder: (context, state) {
          return MaterialApp(
            theme: state.theme.copyWith(scaffoldBackgroundColor: color),
            home: const WeatherPage(),
            debugShowCheckedModeBanner: false,
          );
        });
      },
    );
  }
}
