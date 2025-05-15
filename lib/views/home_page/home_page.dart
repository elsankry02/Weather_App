import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/components/image_manger.dart';
import 'package:weather_app/providers/weather_provider/weather_provider.dart';
import 'package:weather_app/views/home_page/widget/list_view_container_widget.dart';
import 'package:weather_app/views/home_page/widget/text_field_widget.dart';
import 'package:weather_app/views/home_page/widget/text_search_details_widget.dart';
import 'package:weather_app/views/home_page/widget/today_weather_widget.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getWeatherProvider = ref.watch(weatherModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageManger.kBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              const TextFieldWidget(),
              const SizedBox(height: 25),
              ref.watch(searchProvider).isNotEmpty
                  ? getWeatherProvider.when(
                      data: (data) {
                        return Expanded(
                          child: ListView(
                            children: [
                              TodeyWeatherWidget(
                                weatherModel: data,
                              ),
                              const SizedBox(height: 135),
                              TextSearchDetailsWidget(
                                weatherModel: data,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              ListViewContainerWidget(
                                weatherModel: data,
                              ),
                              const SizedBox(height: 30),
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
                  : const Text(
                      'Start Search For City',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
