import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/services/weather_service.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService(dio: ref.read(dioProvider));
});
