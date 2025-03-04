import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home/widget/min_max_temp_widget.dart';

class TempWeatherWidget extends StatelessWidget {
  const TempWeatherWidget({
    super.key,
    required this.day,
    required this.weatherModel,
  });

  final Forecastday day;
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MinMaxTempWidget(
                weather: 'Max', number: day.day!.maxtempC!.toInt()),
            MinMaxTempWidget(
                weather: 'Min', number: day.day!.mintempC!.toInt()),
            Text(
              '${weatherModel.forecast!.forecastday![1].day!.condition!.text}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Image.network(
          'https:${weatherModel.forecast!.forecastday![1].day!.condition!.icon}',
          height: 100,
          width: 100,
        ),
      ],
    );
  }
}
