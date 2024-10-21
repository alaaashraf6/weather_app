import 'dart:developer';

import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, this.weatherInfo =[]});
  final List<dynamic> weatherInfo ;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
    child: Text("test card") ,
    );
  }
}