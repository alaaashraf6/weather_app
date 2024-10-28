import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String apiKey = '5df29ed69ccbdf08969d54a11f9f911a';
  final Dio _dio = Dio();
  final String city = '';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';
  final Map<dynamic, dynamic> weatherData = {'temp': 0.0, 'description': ''};

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
     int unixTimestamp = 1730073600;

  DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    // String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(date);
    try {

      final response =
          await _dio.get('$baseUrl?q=$city&appid=$apiKey&units=metric');
      // List<dynamic> weatherList = (response.data['list'])
      //     .map((item ,index) => {
      //           weatherData['temp'] = item['main']['temp'],
      //           weatherData['description'] = item['weather'][0]['description'],
      //         })
      //     .toList();

      List<dynamic> weatherList = (response.data['list'] )
      .map((item) {
        // print(item['dt_txt']);
        return {
          'temp': item['main']['temp'],
          'description': item['weather'][0]['description'], 
          // 'date': item['dt_txt'], 
        };
      }).toList();
      print('afterafter');

      print('alaaWather$weatherData');
      return weatherList;
    } catch (e) {

      print('Failed to load weather data: $e');
      throw Exception('Failed to load weather data: $e');
    }
  }
}
