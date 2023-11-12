class WeatherModule {
  final String weatherCountry;
  final String searchValue;
  // final String weatherRegion;
  final String weatherCity;
  final String weatherTime;
  final double weatherMaxTemp;
  final double weatherMinTemp;
  final double weatherAvgTemp;
  final String weatherCondition;
  final String weatherIcon;
  final String? weatherErrorInfo;

  WeatherModule({
    required this.searchValue,
    this.weatherErrorInfo,
    required this.weatherCountry,
    // required this.weatherRegion,
    required this.weatherCity,
    required this.weatherTime,
    required this.weatherMaxTemp,
    required this.weatherMinTemp,
    required this.weatherAvgTemp,
    required this.weatherCondition,
    required this.weatherIcon,
  });
  factory WeatherModule.error(
      {required String? errorInfo, required String searchValue}) {
    return WeatherModule(
      weatherErrorInfo: errorInfo,
      weatherCountry: "Empty",
      // weatherRegion: "0",
      weatherCity: "",
      weatherTime: "",
      weatherMaxTemp: 0,
      weatherMinTemp: 0,
      weatherAvgTemp: 0,
      weatherCondition: "error",
      weatherIcon: "",
      searchValue: searchValue,
    );
  }
  factory WeatherModule.fromJson(
      {required Map<String, dynamic> jsonData, required String searchValue}) {
    Map<String, dynamic> locationInfo = jsonData["location"];
    Map<String, dynamic> forecastInfo = jsonData["forecast"];
    Map<String, dynamic> currentInfo = jsonData["current"];
    Map<String, dynamic> dayInfo = forecastInfo["forecastday"][0]["day"];
    Map<String, dynamic> conditionInfo =
        forecastInfo["forecastday"][0]["day"]["condition"];
    return WeatherModule(
      weatherCountry: locationInfo["country"],
      // weatherRegion: locationInfo["region"],
      weatherCity: locationInfo["name"],
      weatherTime:
          currentInfo["last_updated"].toString().replaceRange(0, 11, ""),
      weatherMaxTemp: dayInfo["maxtemp_c"],
      weatherMinTemp: dayInfo["mintemp_c"],
      weatherAvgTemp: dayInfo["avgtemp_c"],
      weatherCondition: conditionInfo["text"],
      weatherIcon: conditionInfo["icon"],
      searchValue: searchValue,
    );
  }
}
