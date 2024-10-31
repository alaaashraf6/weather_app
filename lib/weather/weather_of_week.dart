import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/Bloc/weather_cupit.dart';
import 'package:weather_app/Shared/Bloc/weather_states.dart';
import 'package:weather_app/weather/weatherCard/weather_card.dart';
import 'package:weather_app/weather/weatherCard/weekly_weather_card.dart';

class WeatherOfWeek extends StatefulWidget {
  const WeatherOfWeek({super.key});
  @override
  State<WeatherOfWeek> createState() => _WeatherOfWeekState();
}

class _WeatherOfWeekState extends State<WeatherOfWeek> {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int weatherCardIndex = 0;

    return BlocProvider(
      create: (BuildContext context) =>
          WeatherCubit()..fetchWeeklyWeather('Cairo'),
      child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (BuildContext context, WeatherState states) {},
          builder: (BuildContext context, WeatherState states) {
            return Scaffold(
              backgroundColor: const Color.fromRGBO(214, 212, 238, 1),
              appBar: AppBar(
                title: const Text('Weather App'),
                backgroundColor: const Color.fromRGBO(214, 212, 238, 1),
              ),
              body: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 250,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      autoPlay: true,
                      viewportFraction: 0.6,
                      initialPage: weatherCardIndex,
                      onPageChanged: (index, reason) {
                        setState(() {
                          weatherCardIndex = index;
                        });
                      },
                    ),
                    items: WeatherCubit.get(context)
                        .weatherOfWeekInfoList
                        .map((item) => WeatherCard(
                              weatherInfo: item,
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 309,
                      enlargeCenterPage: false,
                      disableCenter: true,
                      autoPlay: true,
                      viewportFraction: 0.9,
                      initialPage: weatherCardIndex,
                    ),
                    items: WeatherCubit.get(context)
                        .weatherOfWeekInfoList
                        .map((item) => WeeklyWeatherCard(
                              weatherInfo: item,
                            ))
                        .toList(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
