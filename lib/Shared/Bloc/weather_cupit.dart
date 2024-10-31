import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/Bloc/weather_states.dart';
import '../../network/remote/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);
  final WeatherService _weatherService = WeatherService();
  String city = 'Cairo';
  String weatherInfo = '';
  List<dynamic> weatherOfWeekInfoList = [];

//  <----------------fetchWeather ------------>
  void fetchWeather() async {
    emit(WeatherLoadingState());

    try {
      final weatherData = await _weatherService.getWeather(city);
      weatherInfo = 'Temperature: ${weatherData['main']['temp']}°\n'
          'Feels like: ${weatherData['main']['feels_like']}°\n'
          'Condition: ${weatherData['weather'][0]['description']}';
      emit(WeatherSuccessState(
          weatherInfo)); 
    } catch (e) {
      weatherInfo = 'Error fetching weather data';
      emit(WeatherErrorState(weatherInfo));
    }
  }
//  <----------------fetchWeeklyWeather ------------>

  Future<void> fetchWeeklyWeather(String city) async {
    try {
      emit(WeatherLoadingState());
      final weatherList = await _weatherService.fetchWeeklyWeather(city);
      weatherOfWeekInfoList = weatherList;

      emit(WeatherOfWeekSuccessState(weatherOfWeekInfoList));
    } catch (e) {
      emit(WeatherErrorState('Failed to fetch weather data: ${e.toString()}'));
    }
  }

//  <----------------change city-------------->
  void changeCity(String newCity) {
    city = newCity; 
    emit(WeatherChangeCityState());
  }
}
