import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/provider.dart';

final searchProvider = StateProvider<String>((ref) {
  return "";
});

final weatherModelProvider = FutureProvider<WeatherModel>((ref) async {
  //
  final service = ref.read(weatherServiceProvider);
  //
  final cityName = ref.watch(searchProvider);
  //
  return await service.weatherServiceFunc(cityName: cityName);
});
