import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_state.dart';
import 'package:weather_app/modules/weather_module.dart';
import 'package:weather_app/service/dio_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());
  WeatherModule? weatherInfo;
  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadedState());
      weatherInfo =
          await WeatherService(dio: Dio()).getWetherInfo(cityName: cityName);
      if (weatherInfo!.weatherCountry != "Empty") {
        emit(WeatherSuccessState());
      } else if (weatherInfo!.weatherCountry == "Empty") {
        emit(WeatherFailureState());
      }
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
