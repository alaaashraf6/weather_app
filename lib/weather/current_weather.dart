import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CurrentWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dio Example')),
        body: Center(
          child: DataFetcher(),
        ),
      ),
    );
  }
}

class DataFetcher extends StatefulWidget {
  @override
  _DataFetcherState createState() => _DataFetcherState();
}

class _DataFetcherState extends State<DataFetcher> {
  String data = "Fetching data...";
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('https://api.weatherstack.com/current?access_key=36b483a50a243ad2fffd122eab6d0050&query=New%20York');
      setState(() {
        data = response.data['request'].toString();
      });
      log('hereeee ${response.data.toString()}');
    } catch (e) {
      setState(() {
        data = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}