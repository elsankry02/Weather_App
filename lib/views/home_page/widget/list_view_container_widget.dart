import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/home_page/widget/temp_weather_widget.dart';

class ListViewContainerWidget extends StatelessWidget {
  const ListViewContainerWidget({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        itemCount: weatherModel.forecast!.forecastday!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final day = weatherModel.forecast!.forecastday![index];

          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              width: 320,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('image/background.jpg'),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        DateFormat("E, d MMM").format(
                          DateTime.parse(day.date!),
                        ),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TempWeatherWidget(day: day, weatherModel: weatherModel),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.amber,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        '${weatherModel.location!.name}, ${weatherModel.location!.region}, ${weatherModel.location!.country}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
