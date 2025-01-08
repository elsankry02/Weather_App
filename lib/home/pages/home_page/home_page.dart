import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/components/api_service.dart';
import 'package:weather_app/core/components/image_manger.dart';
import 'package:weather_app/home/data/manger/weather_service_api/weather_service_cubit.dart';
import 'package:weather_app/home/pages/home_page/widget/list_view_container_widget.dart';
import 'package:weather_app/home/pages/home_page/widget/text_field_widget.dart';
import 'package:weather_app/home/pages/home_page/widget/text_search_details_widget.dart';
import 'package:weather_app/home/pages/home_page/widget/today_weather_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherServiceCubit(ApiService(Dio())),
      child: Scaffold(
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
                Expanded(child:
                    BlocBuilder<WeatherServiceCubit, WeatherServiceState>(
                  builder: (context, state) {
                    if (state is WeatherServiceSuccess) {
                      return ListView(
                        children: [
                          TodeyWeatherWidget(
                            weatherModel: state.weatherModel,
                          ),
                          const SizedBox(height: 135),
                          TextSearchDetailsWidget(
                            weatherModel: state.weatherModel,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ListViewContainerWidget(
                            weatherModel: state.weatherModel,
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    }
                    if (state is WeatherServiceLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is WeatherServiceFailuer) {
                      return Text(
                        state.errorMassage,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      );
                    }
                    return const Center(
                      child: Text(
                        'Start Search For City',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
