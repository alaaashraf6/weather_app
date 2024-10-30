import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Shared/Bloc/cubit.dart';
import 'package:weather_app/Shared/Bloc/states.dart';

class WeatherDetails extends StatelessWidget {
  WeatherDetails({super.key, required this.weatherInfo});

  final dynamic weatherInfo;

  @override
  Widget build(BuildContext context) {

    void goBack(context) {
      Navigator.pop(
        context,
      );
    }

    return BlocProvider(
      create: (BuildContext context) =>
          WeatherCubit()..fetchWeeklyWeather('Cairo'),
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (BuildContext context, WeatherState state) {},
        builder: (BuildContext context, WeatherState state) {
          final weatherCubit = WeatherCubit.get(context);
          final List<dynamic> items = weatherCubit.weatherOfWeekInfoList;

          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(75, 63, 175, 1),
                    Color.fromRGBO(75, 63, 175, 0.3),
                    Color.fromRGBO(56, 40, 205, 1),
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
                    child:  Row(
                      children: [
                        IconButton(
                          onPressed: () => goBack(context), 
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(150, 141, 208, 0.9),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(70, 236, 235, 246),
                        width: 3,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/sky.png',
                          width: 150,
                          height: 150,
                        ),
                        Column(
                          children: [
                            Text(
                              '${weatherInfo['temp'].round()} °',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 50),
                            ),
                            Text(
                              weatherInfo['description'].toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Future Weathers',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 400,
                            width: 250,
                            child: ListView.separated(
                              itemCount:
                                  items.length, // Use the items from the cubit
                              separatorBuilder: (context, index) =>
                                  const Divider(height: 1),
                              itemBuilder: (context, index) {
                                dynamic weatherWeaklyInfo = items[index];

                                DateTime dateTimeDay =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weatherWeaklyInfo['dateTime'] * 1000);
                                String dayName =
                                    DateFormat('EEEE').format(dateTimeDay);
                                String dateFormat = DateFormat('dd MMM yyy')
                                    .format(dateTimeDay);

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'images/sky.png',
                                      height: 70,
                                      width: 70,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '${weatherWeaklyInfo['temp'].round()}°',
                                      style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          dayName,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          dateFormat,
                                          style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 12),
                                        ),
                                      ],
                                    )
                                  ], // Update based on your data structure
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
