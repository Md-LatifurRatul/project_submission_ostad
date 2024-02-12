import 'package:assignment_submission/weather.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final WeatherData data;

  const WeatherCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "City: ${data.city}",
              style: const TextStyle(fontSize: 16),
            ),
            Text('Temperature: ${data.temperature}°C'),
            Text('Condition: ${data.condition}'),
            Text('Humidity: ${data.humidity}%'),
            Text('Wind Speed: ${data.windSpeed} km/h'),
          ],
        ),
      ),
    );
  }
}