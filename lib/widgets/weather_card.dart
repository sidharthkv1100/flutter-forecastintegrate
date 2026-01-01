import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(weather.city,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("${weather.temp} °C",
                style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            Text(weather.description,
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
