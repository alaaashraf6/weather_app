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
  String city = 'Cairo';
  String weatherInfo = '';
  List<Weather> weatherOfWeekInfoList =[];

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

  //  Future<void> fetchWeeklyWeather() async {
  //   try {
  //     emit(WeatherLoadingState());
  //     final weatherList = await _weatherService.fetchWeeklyWeather(city);
  //     weatherOfWeekInfoList =weatherList;
  //     emit(WeatherOfWeekSuccessState(weatherList));
      

  //   } catch (e) {
  //     emit(WeatherErrorState('Failed to fetch weather data'));
  //   }
  // }

  Future<void> fetchWeeklyWeather(String city) async {
  try {
    emit(WeatherLoadingState());

    // Ensure city is not null or empty
    if (city.isEmpty) {
      emit(WeatherErrorState('City name cannot be empty.'));
      return;
    }

    final weatherList = await _weatherService.fetchWeeklyWeather(city);
    
    // Update the list with the fetched data
    weatherOfWeekInfoList = weatherList;

    // Emit success state with the fetched data
    emit(WeatherOfWeekSuccessState(weatherOfWeekInfoList));

  } catch (e) {
    // Handle specific exceptions if needed
    emit(WeatherErrorState('Failed to fetch weather data: ${e.toString()}'));
  }
}


//  <----------------change city-------------->
  void changeCity(String newCity) {
    city = newCity; // Update the instance variable
    emit(WeatherChangeCityState());
  }
}
