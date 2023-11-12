import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_state.dart';
import 'package:weather_app/helpers/get_theme_color.dart';
import 'package:weather_app/modules/weather_module.dart';
import 'package:weather_app/widgets/error_weather_body.dart';
import 'package:weather_app/widgets/default_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        WeatherModule? weatherInfo =
            BlocProvider.of<GetWeatherCubit>(context).weatherInfo;
        if (state is InitialState) {
          return const DefaultWeatherBody();
        } else if (state is WeatherFailureState) {
          return ErrorWeatherBody(
            cityName: weatherInfo!.searchValue,
            errMessage: weatherInfo.weatherErrorInfo ?? "",
          );
        } else if (state is WeatherLoadedState) {
          return Center(
            child: CircularProgressIndicator(
              color: getThemeColor(
                weatherInfo?.weatherCondition ?? "",
              ),
            ),
          );
        } else if (state is WeatherSuccessState) {
          return WeatherInfoBody(
            weatherInfo: weatherInfo!,
          );
        } else {
          return const Center(
            child: Text("No"),
          );
        }
      },
    );
  }
}
