import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Shared/Bloc/cubit.dart';
import 'package:weather_app/Shared/Bloc/states.dart';
import 'package:weather_app/weather/weatherCard/weather_card.dart';
import 'package:weather_app/weather/weatherCard/weekly_weather_card.dart';
import '../network/remote/weather_service.dart';

class WeatherOfWeek extends StatefulWidget {
  @override
  State<WeatherOfWeek> createState() => _WeatherOfWeekState();
}

class _WeatherOfWeekState extends State<WeatherOfWeek> {
  // final WeatherService _weatherService = WeatherService();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int weatherCardIndex = 0;
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd h:00:00').format(today);



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
                          print('index $formattedDate ');
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
                          .toList()),
                  const SizedBox(
                    height: 100,
                  ),
                  CarouselSlider(
                      options: CarouselOptions(
                        height: 309,
                        enlargeCenterPage: false,
                        disableCenter: true,
                        autoPlay: false,
                        viewportFraction: 0.9,
                        initialPage: weatherCardIndex,
                      ),
                      items: WeatherCubit.get(context)
                          .weatherOfWeekInfoList
                          .map((item) => WeeklyWeatherCard(
                                weatherInfo: item,
                              ))
                          .toList())
                ],
              ),
            );
          }),
    );
  }
}
