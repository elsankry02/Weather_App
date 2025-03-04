import 'package:dio/dio.dart';
import 'package:weather_app/data/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final apiKey = '933b8e9ec7d54634b16100839241903';
  final paseUrl = 'http://api.weatherapi.com/v1';
  WeatherService({required this.dio});

  Future<List<WeatherModel>> weatherServiceFunc(
      {required String cityName}) async {
    final response =
        await dio.get('$paseUrl/forecast.json?key=$apiKey&q=$cityName&days=3');
    final data = response.data;
    final List<WeatherModel> weatherDay = [];
    for (var setWeather in data) {
      weatherDay.add(WeatherModel.fromJson(setWeather));
    }
    return weatherDay;
  }
}
