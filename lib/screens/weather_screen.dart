import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../widgets/weather_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final cityCtrl = TextEditingController();
  final weatherService = WeatherService();
  var weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: cityCtrl,
              decoration: const InputDecoration(
                labelText: "Enter City",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            child: const Text("Get Weather"),
            onPressed: () async {
              final result =
                  await weatherService.fetchWeather(cityCtrl.text);
              setState(() => weather = result);
            },
          ),
          if (weather != null) WeatherCard(weather: weather),
        ],
      ),
    );
  }
}
