import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  static const String apiKey = "YOUR_API_KEY_HERE";

  Future<Weather> fetchWeather(String city) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey";

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    return Weather.fromJson(data);
  }
}
