import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_v2/theme/switch_cubit/switch_cubit.dart';
import 'package:flutter_weather_app_v2/theme/switch_cubit/switch_state.dart';
import 'package:flutter_weather_app_v2/weather/weather.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route route(WeatherCubit weatherCubit, SwitchCubit switchCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: weatherCubit,
              // child: const SettingsPage(),
            ),
            BlocProvider.value(
              value: switchCubit,
            )
          ], child: const SettingsPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: <Widget>[
          BlocBuilder<WeatherCubit, WeatherState>(
            buildWhen: (previous, current) =>
            previous.temperatureUnits != current.temperatureUnits,
            builder: (context, state) {
              return ListTile(
                title: const Text('Temperature Units'),
                isThreeLine: true,
                subtitle: const Text(
                  'Use metric measurements for temperature units.',
                ),
                trailing: Switch(
                  value: state.temperatureUnits.isCelsius,
                  onChanged: (_) => context.read<WeatherCubit>().toggleUnits(),
                ),
              );
            },
          ),
          BlocBuilder<SwitchCubit, SwitchState>(
              buildWhen: (previous, current) =>
              previous.isDarkThemeOn != current.isDarkThemeOn,
              builder: (context, state) {
                final cubit = context.read<SwitchCubit>();
                return ListTile(
                  title: Text("${cubit.state.titleText} theme "),
                  subtitle: const Text('Use to change app theme'),
                  trailing: Switch(
                    value: state.isDarkThemeOn,
                    onChanged: (newValue) {
                      cubit.toggleSwitch(newValue);
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
