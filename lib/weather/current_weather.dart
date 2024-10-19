import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/Bloc/cubit.dart';
import 'package:weather_app/Shared/Bloc/states.dart';
import '../network/remote/weather_service.dart';

class CurrentWeatherPage extends StatefulWidget {
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final WeatherService _weatherService = WeatherService();
  // String _city = 'Cairo';
  // String _weatherInfo = '';

  // void _fetchWeather() async {
  //   try {
  //     final weatherData = await _weatherService.getWeather(_city);
  //     setState(() {
  //       _weatherInfo = 'Temperature: ${weatherData['main']['temp']}°\n'
  //           'Feel like ${weatherData['main']['feels_like']}°\n'
  //           'Condition: ${weatherData['weather'][0]['description']}';
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _weatherInfo = 'Error fetching weather data';
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchWeather();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCupit()..fetchWeather(),
      child: BlocConsumer<WeatherCupit, WeatherState>(
          listener: (BuildContext context, WeatherState states) {},
          builder: (BuildContext context, WeatherState states) {
            return Scaffold(
              appBar: AppBar(title: const Text('Weather App')),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 5, // Elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                        ),
                        child: const Text(
                          'Get Weather at Cairo',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      WeatherCupit.get(context).weatherInfo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
