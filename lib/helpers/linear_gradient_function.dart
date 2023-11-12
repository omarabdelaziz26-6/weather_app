import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/helpers/get_theme_color.dart';

LinearGradient linearGradientFunction(context) {
     MaterialColor backGroundColor = getThemeColor(
        BlocProvider.of<GetWeatherCubit>(context)
                .weatherInfo
                ?.weatherCondition ??
            "");
    return LinearGradient(
        colors: [
          backGroundColor,
          backGroundColor[400]!,
          backGroundColor[300]!,
          backGroundColor[200]!,
          backGroundColor[100]!,
          backGroundColor[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
      );
  }
