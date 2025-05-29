import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home_page/data/service/weather_service.dart';

// Dio
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
// WeatherService
final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService(
    dio: ref.read(dioProvider),
  );
});
