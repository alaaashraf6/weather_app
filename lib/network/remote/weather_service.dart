import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String apiKey = '5df29ed69ccbdf08969d54a11f9f911a';
  final Dio _dio = Dio();
  final String city ='' ;
final String baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';


  Future<Map<String, dynamic>> getWeather(String city) async {
    final String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
  Future<List<Weather>> fetchWeeklyWeather(String city) async {
    try {
      final response = await _dio.get('$baseUrl?q=$city&appid=$apiKey&units=metric');
      List<Weather> weatherList = (response.data['list'] as List)
          .map((item) => Weather.fromJson(item))
          .toList();
      return weatherList;
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }


 
}



