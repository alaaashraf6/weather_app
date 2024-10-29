import 'package:flutter/material.dart';
import 'package:weather_app/weather/weather_details.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weatherInfo,
  });

  final dynamic weatherInfo;

  void goToWeatherDetails (context){
    Navigator.push(context, MaterialPageRoute(builder: (condext)=>  WeatherDetails(weatherInfo: weatherInfo,)));
    
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToWeatherDetails(context),
       
      child: Stack(
        alignment: Alignment.topCenter,
        children: [     
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                  height: 20,
                ),
                  Image.asset('images/sky.png' ,height: 150, width: 150,),
                  Text(
                    '${weatherInfo['temp'].round()} °',
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
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
            child:  Text(
              weatherInfo['date'].toString(),
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),]
      ),
    );
  }
}
