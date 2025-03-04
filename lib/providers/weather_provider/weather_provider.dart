import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/providers/provider.dart';

final searchProvider = StateProvider<String>((ref) {
  return "";
});

final weatherProvider = FutureProvider<WeatherModel>((ref) async {
  //
  final service = ref.read(weatherServiceProvider);
  //
  final cityName = ref.watch(searchProvider);
  //
  return await service.weatherServiceFunc(cityName: cityName);
});
