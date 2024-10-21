class Weather {
  final String date;
  final String description;
  final double temperature;

  Weather({required this.date, required this.description, required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date: json['dt_txt'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
    );
  }
}
