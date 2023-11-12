import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/modules/weather_module.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});
  Future<WeatherModule> getWetherInfo({required String cityName}) async {
    try {
      Uri url = Uri.http("api.weatherapi.com", "/v1/forecast.json", {
        "key": "eb25347622fb4a75ba140108231309",
        "q": cityName,
        "days": "1",
      });
      log(url.toString());
      Response response = await dio.get(url.toString());
      Map<String, dynamic> jsonData = response.data;

      return WeatherModule.fromJson(jsonData: jsonData, searchValue: cityName);
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data["error"]["message"].toString() ?? "Oops, Try later";
      return WeatherModule.error(errorInfo: errMessage, searchValue: cityName);
    } catch (e) {
      return WeatherModule.error(errorInfo: "", searchValue: cityName);
    }
  }
}
