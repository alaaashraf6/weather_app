import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



class DioHelper  {
  // Dio dio = Dio();
  static late Dio dio;

   static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.weatherstack.com/current?access_key=36b483a50a243ad2fffd122eab6d0050&query=New%20York', receiveDataWhenStatusError: true));
  }



  static Future<void> fetchData() async {
    try {
      Response response = await dio.get('https://api.weatherstack.com/current?access_key=36b483a50a243ad2fffd122eab6d0050&query=New%20York');
     log(response.toString());
    } catch (e) {
     log('Error : $e');
    }
  }

  
}
