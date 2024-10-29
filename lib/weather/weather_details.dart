import 'package:flutter/material.dart';
import 'package:weather_app/Shared/Bloc/cubit.dart';

class WeatherDetails extends StatelessWidget {
  WeatherDetails({super.key , this.weatherInfo});
  final dynamic weatherInfo ;

  @override
  Widget build(BuildContext context) {
  // final List<dynamic> items = WeatherCubit.get(context).weatherOfWeekInfoList;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(75, 63, 175, 1),
              Color.fromRGBO(75, 63, 175, 0.3),
              Color.fromRGBO(75, 63, 175, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            Container(
              padding: const EdgeInsets.all(20),
              height: 70,
              child: const Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(150, 141, 208, 0.3),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: const Color.fromRGBO(166, 160, 215, 0.5), width: 4),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'images/sky.png',
                    height: 100,
                    width: 100,
                  ),
                   Column(
                    children: [
                      Text(weatherInfo['temp'].toString()),
                      Text(weatherInfo['description'].toString()),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: ListView.separated(
            //     itemCount: items.length,
            //     separatorBuilder: (context, index) => const Divider(
            //         height: 1, color: Colors.grey ,), // Separator widget
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(items[index]['temp']),
            //         onTap: () {
            //           // Handle tap
            //           ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBar(content: Text('Tapped on ${items[index]}')),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
