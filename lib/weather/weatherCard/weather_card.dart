import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weatherInfo,
  });

  final dynamic weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
           
          Stack(
            children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(75, 63, 175, 1),
                  Color.fromRGBO(75, 63, 175, 0.3),
                  Color.fromRGBO(75, 63, 175, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                    height: 20,
                    color: Colors.amber,
                  ),
                    Image.asset('images/sky.png' ,height: 150, width: 150,),
                    Text(
                      weatherInfo['temp'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      weatherInfo['description'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
              child: const Text(
                '6-2-1997',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
        ]),]
      ),
    );
  }
}
