import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/helpers/get_theme_color.dart';
import 'package:weather_app/helpers/outline_input_border.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MaterialColor backGroundColor = getThemeColor(
        BlocProvider.of<GetWeatherCubit>(context)
                .weatherInfo
                ?.weatherCondition ??
            "");
    return Center(
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: TextField(
          onSubmitted: (searchResult) async {
            log(searchResult);
            BlocProvider.of<GetWeatherCubit>(context)
                .getWeather(cityName: searchResult);
            Navigator.pop(context);
          },
          keyboardType: TextInputType.streetAddress,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            hintText: "Enter City Name",
            labelText: "Search",
            labelStyle: TextStyle(color: backGroundColor),
            border: outlineInputBorder(backGroundColor),
            enabledBorder: outlineInputBorder(backGroundColor),
            focusedBorder: outlineInputBorder(backGroundColor),
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
