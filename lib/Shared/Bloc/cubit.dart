import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/Bloc/states.dart';
import '../../network/remote/weather_service.dart';

class WeatherCupit extends Cubit<WeatherState> {
  WeatherCupit() : super(WeatherInitialState());

  static WeatherCupit get(context) => BlocProvider.of(context);
  final WeatherService _weatherService = WeatherService();
  String city = 'Cairo';
  String weatherInfo = '';

 
  void fetchWeather() async {
    emit(WeatherLoadingState());

    try {
      final weatherData = await _weatherService.getWeather(city);
      weatherInfo = 'Temperature: ${weatherData['main']['temp']}°\n'
          'Feel like ${weatherData['main']['feels_like']}°\n'
          'Condition: ${weatherData['weather'][0]['description']}';
      emit(WeatherSuccessState());
    } catch (e) {
      weatherInfo = 'Error fetching weather data';
      emit(WeatherErrorState());
    }
  }
}
