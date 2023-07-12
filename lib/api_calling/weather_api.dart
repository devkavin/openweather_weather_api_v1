import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_calling/api_key.dart';
import '../model/weather_model.dart';

String myApiKey = ApiKey.myApiKey;
String url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse('$url?q=$location&appid=$myApiKey&units=metric');

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    if (response.statusCode == 404) {
      return Weather(
          cityName: "City not found",
          temp: 0,
          weatherLike: 'Weather not found',
          weatherDesc: 'Weather not found',
          weatherIcon: '01d',
          windSpeed: 0.0,
          windDeg: 0,
          windGust: 0.0,
          humidity: 0,
          feelsLike: 0,
          pressure: 0,
          dtDateTime: 0,
          country: 'Country not found');
    } else {
      debugPrint(Weather.fromJson(body).cityName);
      return Weather.fromJson(body);
    }
  }
}
