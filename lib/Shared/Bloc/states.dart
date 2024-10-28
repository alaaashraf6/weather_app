import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}


class  WeatherInitialState extends WeatherState{}
class  WeatherLoadingState extends WeatherState{}
class  WeatherChangeCityState extends WeatherState{}


class WeatherSuccessState extends WeatherState {
  final String weatherInfo;

  WeatherSuccessState(this.weatherInfo);
}

class WeatherErrorState extends WeatherState {
  final String error;

  WeatherErrorState(this.error);
}
class WeatherOfWeekSuccessState extends WeatherState {
  final List<dynamic> weatherData;

  WeatherOfWeekSuccessState(this.weatherData);
}
