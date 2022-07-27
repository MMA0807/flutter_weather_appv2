import 'package:flutter_weather_app_v2/theme/switch_cubit/switch_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchState(isDarkThemeOn: true));

  void toggleSwitch(bool value) => emit(state.copyWith(changeState: value));
}