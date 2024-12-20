import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/Bloc/weather_cupit.dart';
import 'package:weather_app/Shared/Bloc/weather_states.dart';

class CurrentWeatherPage extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();
  CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit(),
      child: BlocConsumer<WeatherCubit, WeatherState>(
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
                    TextField(
                      controller: cityController,
                      decoration: const InputDecoration(
                          labelText: 'Enter city to get weather'),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          WeatherCubit.get(context)
                              .changeCity(cityController.text);
                          WeatherCubit.get(context).fetchWeather();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                        ),
                        child: Text(
                          'Get Weather  ${WeatherCubit.get(context).city}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      WeatherCubit.get(context).weatherInfo,
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
