import 'package:flutter/material.dart';
import 'package:weather_app/features/home_page/data/models/weather_model.dart';
import 'package:weather_app/features/home_page/presentation/widget/min_and_max_temp_widget.dart';

class TempInfoWidget extends StatelessWidget {
  const TempInfoWidget({
    super.key,
    required this.weatherModel,
    required this.index,
  });
  final int index;
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final dayForecast = weatherModel.forecast!.forecastday![index].day!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MinAndMaxTempWidget(
                weather: 'Max', number: dayForecast.maxtempC!.toInt()),
            MinAndMaxTempWidget(
                weather: 'Min', number: dayForecast.mintempC!.toInt()),
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
