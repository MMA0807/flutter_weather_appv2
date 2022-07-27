import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_v2/settings/view/settings_page.dart';
import 'package:flutter_weather_app_v2/theme/cubit/theme_cubit.dart';
import 'package:flutter_weather_app_v2/theme/switch_cubit/switch_cubit.dart';
import 'package:flutter_weather_app_v2/weather_repository/weather_repository.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  late final Timer? debounce;

  WeatherView({Key? key, this.debounce}) : super(key: key);



  void dispose() {
    debounce?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push<void>(SettingsPage.route(
                  context.read<WeatherCubit>(), context.read<SwitchCubit>()));
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.read<ThemeCubit>().updateTheme(state.weather);
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case WeatherStatus.initial:
                return const WeatherEmpty();
              case WeatherStatus.loading:
                return const WeatherLoading();
              case WeatherStatus.success:
                return WeatherPopulated(
                  weather: state.weather,
                  units: state.temperatureUnits,
                  onRefresh: () {
                    return context.read<WeatherCubit>().refreshWeather();
                  },
                );
              case WeatherStatus.failure:
              default:
                return const WeatherError();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          final weatherCubit = context.read<WeatherCubit>();
          _textController.clear();

          _onSearchChanged(String query) {
            if (debounce?.isActive ?? false) debounce?.cancel();
            debounce = Timer(const Duration(milliseconds: 500), () async {
              await weatherCubit.fetchWeather(query);

              // do something with query
            });
          }

          showMaterialModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                    controller: ModalScrollController.of(context),
                    child: Container(
                      height: size.height * .2,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            width: 70,
                            child: Divider(
                              thickness: 3.5,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (searchText) {
                              _onSearchChanged(searchText);
                            },
                            controller: _textController,
                            autofocus: true,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () => _textController.clear(),
                                  child: const Icon(
                                    Icons.close,
                                  ),
                                ),
                                hintText: 'Search city London',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      // color: _constants
                                      //     .primaryColor,
                                      ),
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}
