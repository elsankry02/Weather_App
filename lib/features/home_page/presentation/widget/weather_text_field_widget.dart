import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home_page/data/weather_provider/weather_provider.dart';

class WeatherTextFieldWidget extends ConsumerWidget {
  const WeatherTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onSubmitted: (value) {
        ref.read(searchProvider.notifier).state = value;
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff262428),
        enabledBorder: buildOutlineInputBordar(),
        focusedBorder: buildOutlineInputBordar(),
        hintText: 'Search',
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 30, right: 15),
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBordar() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    );
  }
}
