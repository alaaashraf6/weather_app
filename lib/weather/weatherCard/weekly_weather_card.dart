import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather/weather_details.dart';

class WeeklyWeatherCard extends StatelessWidget {
  const WeeklyWeatherCard({
    super.key,
    required this.weatherInfo,
  });

  final dynamic weatherInfo;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(weatherInfo['dateTime'] * 1000);
    String formattedDate = DateFormat('h:00:00').format(dateTime);

    DateTime today = DateTime.now();
    return Stack(alignment: Alignment.topCenter, children: [
      Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          height: 412,
          color: const Color.fromRGBO(207, 203, 238, 1),
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Next 7 Days',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => Card(
                      child: Center(
                        child: Column(
                          children: [
                            Text('$formattedDate AM'),
                            Image.asset(
                              'images/sky.png',
                              height: 90,
                              width: 90,
                            ),
                            Text(
                              '${weatherInfo['temp'].round()} °',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Container(
        width: 300,
        height: 100,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.water_drop_outlined),
                      Text(weatherInfo['humidity'].toString()),
                      const Text('Humidity'),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.air),
                      Text('${weatherInfo['windSpeed']} km'),
                      const Text('Wind'),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.alarm),
                      Text(weatherInfo['pressure'].toString()),
                      const Text('Air Pressure'),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.remove_red_eye_outlined),
                      Text(weatherInfo['visibility'].toString()),
                      const Text('Visibility'),
                    ],
                  ),
                ]),
          ),
        ),
      )
    ]);
  }
}
