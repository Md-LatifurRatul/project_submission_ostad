import 'dart:convert';
import 'package:assignment_submission/weather_card.dart';
import 'package:flutter/material.dart';
import 'weather.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  final String jsonString = '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    final List<WeatherData> weatherData = parseWeatherData(jsonString);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Info App"),
      ),
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          final WeatherData data = weatherData[index];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: WeatherCard(data: data),
          );
        },
      ),
    );
  }

  List<WeatherData> parseWeatherData(String jsonString) {
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((data) => WeatherData.fromJson(data)).toList();
  }
}
