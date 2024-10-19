import 'package:dio/dio.dart';

class WeatherService {
  final String apiKey = '5df29ed69ccbdf08969d54a11f9f911a';
  final Dio _dio = Dio();

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
}
