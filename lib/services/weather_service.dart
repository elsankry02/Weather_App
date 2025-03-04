import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final apiKey = '187e4fc885d4436a8c1215046250403';
  final paseUrl = 'http://api.weatherapi.com/v1';
  WeatherService({required this.dio});

  Future<WeatherModel> weatherServiceFunc({required String cityName}) async {
    final response =
        await dio.get('$paseUrl/forecast.json?key=$apiKey&q=$cityName&days=3');
    final data = response.data as Map<String, dynamic>;

    return WeatherModel.fromJson(data);
  }
}
