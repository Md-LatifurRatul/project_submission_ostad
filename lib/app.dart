import 'package:assignment_submission/weather_info.dart';
import 'package:flutter/material.dart';

class WeatherInfoApp extends StatelessWidget {
  const WeatherInfoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),

        ),
      ),
     home: const WeatherInfo(),

    );
  }
}