import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
 const WeatherCard({super.key, required this.weatherInfo, }); 
      
        final Weather weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        gradient:  const LinearGradient(
          colors: [Color.fromRGBO(75,63,175,1), Color.fromRGBO(75,63,175, 0.3) ,Color.fromRGBO(75,63,175, 1),],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can customize the display of weatherInfo here
              Text(
                weatherInfo.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
