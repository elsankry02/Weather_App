import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/constant/image_manger.dart';
import 'package:weather_app/features/home_page/data/models/weather_model.dart';

class TodayWeatherWidget extends StatelessWidget {
  const TodayWeatherWidget({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final currentWeatherCondition = weatherModel.current!.condition!;
    final weatherLocation = weatherModel.location!;
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage(ImageManger.kBackground),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                DateFormat("d MMM, yyyy")
                    .format(DateTime.parse(weatherModel.current!.lastUpdated!)),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      //!
                      Text(
                        '${weatherModel.current!.tempC!.toInt()}',
                        style: const TextStyle(fontSize: 38),
                      ),
                      const Text(
                        ' °C ',
                        style: TextStyle(color: Colors.amber, fontSize: 25),
                      ),
                    ],
                  ),
                  //!
                  Text(
                    '${currentWeatherCondition.text}',
                    style: const TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                ],
              ),
              //!
              Image.network(
                fit: BoxFit.cover,
                "https:${currentWeatherCondition.icon}",
                height: 100,
                width: 100,
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.amber,
              ),
              //!
              Expanded(
                child: Text(
                  '${weatherLocation.name}, ${weatherLocation.region}, ${weatherLocation.country}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
