import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String apiKey = '5df29ed69ccbdf08969d54a11f9f911a';
  final Dio _dio = Dio();
  final String city = '';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';
  final Map<dynamic, dynamic> weatherData = {
    'temp': 0.0,
    'description': '',
    'date': ''
  };

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

  Future<List<dynamic>> fetchWeeklyWeather(String city) async {
    try {
      final response =
          await _dio.get('$baseUrl?q=$city&appid=$apiKey&units=metric');
      List<dynamic> weatherList = (response.data['list']).map((item) {
        return {
          'temp': item['main']['temp'],
          'description': item['weather'][0]['description'],
          'date': item['dt_txt'],
          'dateTime': item['dt'],
          'windSpeed': item['wind']['speed'],
          'visibility': item['visibility'],
          'pressure': item['main']['pressure'],
          'humidity': item['main']['humidity'],
        };
      }).toList();

      return weatherList;
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
