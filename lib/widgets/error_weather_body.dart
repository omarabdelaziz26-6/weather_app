import 'package:flutter/material.dart';

class ErrorWeatherBody extends StatelessWidget {
  final String cityName;
  final String errMessage;

  const ErrorWeatherBody(
      {Key? key, required this.cityName, required this.errMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Oops There is an Error,",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
          Text(
            errMessage,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
          Text(
            "The city name you entered : $cityName",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
