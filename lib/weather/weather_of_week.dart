import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/Bloc/cubit.dart';
import 'package:weather_app/Shared/Bloc/states.dart';
import 'package:weather_app/weather/weatherCard/weather_card.dart';
import '../network/remote/weather_service.dart';

class WeatherOfWeek extends StatelessWidget {
  // final WeatherService _weatherService = WeatherService();
  final TextEditingController cityController = TextEditingController();

  // String _city = 'Cairo';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          WeatherCubit()..fetchWeeklyWeather('Cairo'),
      child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (BuildContext context, WeatherState states) {},
          builder: (BuildContext context, WeatherState states) {
            return Scaffold(
              appBar: AppBar(title: const Text('Weather App')),
              body:Column(
                children: [
                   CarouselSlider(
                options: CarouselOptions(
                  height: 310,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  autoPlay: true,
                  viewportFraction: 0.6,
                  initialPage: 0,
                ),
                // items: WeatherCubit.get(context).weatherOfWeekInfo
                //     .map((item) => WeatherCard()
                //     .toList()),
                items: [const Text("alaa")],
              ),
              WeatherCard(WeatherCubit.get().weatherOfWeekInfo)
                ],
              )
            );
          }),
    );
  }
}
