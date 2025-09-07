import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constant/image_manger.dart';
import 'package:weather_app/features/data/provider/weather_provider/weather_provider.dart';
import 'package:weather_app/features/home_page/widget/today_weather_widget.dart';
import 'package:weather_app/features/home_page/widget/weather_list_view_widget.dart';
import 'package:weather_app/features/home_page/widget/weather_search_detail_widget.dart';
import 'package:weather_app/features/home_page/widget/weather_text_field_widget.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherProvider = ref.watch(weatherModelProvider);
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageManger.kBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              //! WeatherTextFieldWidget
              const WeatherTextFieldWidget(),
              //
              SizedBox(
                height: h * 0.050,
              ),
              //
              ref.watch(searchProvider).isNotEmpty
                  ? weatherProvider.when(
                      data: (data) {
                        return Expanded(
                          child: ListView(
                            children: [
                              TodayWeatherWidget(
                                weatherModel: data,
                              ),
                              //
                              SizedBox(height: h * 0.15),
                              //! Weather Search Detail Widget
                              WeatherSearchDetailWidget(
                                weatherModel: data,
                              ),

                              SizedBox(
                                height: h * 0.050,
                              ),
                              //! Weather List View Widget
                              WeatherListViewWidget(
                                weatherModel: data,
                              ),
                            ],
                          ),
                        );
                      },
                      error: (error, _) {
                        return Center(
                          child: Text(
                            '$error',
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
                  : const Expanded(
                      child: Center(
                        child: Text(
                          'Start Search For City',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
