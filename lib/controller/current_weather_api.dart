import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../controller/api_key.dart';
import '../model/location_model.dart';

String currentWeatherApiKey = ApiKey.currentWeatherApiKey;
String url = 'https://api.openweathermap.org/data/2.5/weather';

class LocationApiClient {
  Future<LocationInfo>? getCurrentWeather(String? location) async {
    var endpoint =
        Uri.parse('$url?q=$location&appid=$currentWeatherApiKey&units=metric');

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    if (response.statusCode == 404) {
      return LocationInfo(
          cityName: "Incorrect city name",
          // temp: 0,
          // weatherLike: 'Null',
          // weatherDesc: 'Null',
          // weatherIcon: '01d',
          // windSpeed: 0.0,
          // windDeg: 0,
          // windGust: 0.0,
          // humidity: 0,
          // feelsLike: 0,
          // pressure: 0,
          // dtDateTime: 0,
          country: 'Incorrect city name',
          lat: 0.0,
          lon: 0.0);
    } else {
      debugPrint(LocationInfo.fromJson(body).cityName);
      return LocationInfo.fromJson(body);
    }
  }
}
