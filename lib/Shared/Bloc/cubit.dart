import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/Bloc/states.dart';
import 'package:weather_app/models/weather_model.dart';
import '../../network/remote/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);
  final WeatherService _weatherService = WeatherService();
  String city = '';
  String weatherInfo = '';
  List<Weather> weatherOfWeekInfo =[];

//  <----------------fetchWeather ------------>
  void fetchWeather() async {
    emit(WeatherLoadingState());

    try {
      final weatherData = await _weatherService.getWeather(city);
      weatherInfo = 'Temperature: ${weatherData['main']['temp']}°\n'
          'Feels like: ${weatherData['main']['feels_like']}°\n'
          'Condition: ${weatherData['weather'][0]['description']}';
      emit(WeatherSuccessState(weatherInfo)); // Emit the success state with weather info
    } catch (e) {
      weatherInfo = 'Error fetching weather data';
      emit(WeatherErrorState(weatherInfo)); 
    }
  }
//  <----------------fetchWeeklyWeather ------------>

   Future<void> fetchWeeklyWeather(String city) async {
    try {
      emit(WeatherLoadingState());
      final weather = await _weatherService.fetchWeeklyWeather(city);
      log(weather.toString());
      log('weather.toString()');
      // emit(WeatherSuccessState(weather));
    } catch (e) {
      emit(WeatherErrorState('Failed to fetch weather data'));
    }
  }

//  <----------------change city-------------->
  void changeCity(String newCity) {
    city = newCity; // Update the instance variable
    emit(WeatherChangeCityState());
  }
}
