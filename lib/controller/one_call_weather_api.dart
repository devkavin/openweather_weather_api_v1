import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/current_model.dart';
import '../model/one_call_weather_model.dart';
import '../controller/api_key.dart';
import '../model/weather_list_model.dart';

String oneCallApiKey = ApiKey.oneCallApiKey;
String oneCallUrl = 'https://api.openweathermap.org/data/2.5/onecall';

class OneCallApiClient {
  Future<OneCallWeather>? getOneCallWeather(double lat, double lon) async {
    var endpoint = Uri.parse(
        '$oneCallUrl?lat=$lat&lon=$lon&units=metric&appid=$oneCallApiKey&units=metric');

    var response = await http.get(endpoint);

    if (response.statusCode == 429 || response.statusCode == 401) {
      debugPrint('Too many requests, switching to api key 2');
      oneCallApiKey = ApiKey.oneCallApiKey2;
      var endpoint = Uri.parse(
          '$oneCallUrl?lat=$lat&lon=$lon&units=metric&appid=$oneCallApiKey&units=metric');

      var response = await http.get(endpoint);

      if (response.statusCode == 429 || response.statusCode == 401) {
        debugPrint('Too many requests, switching to api key 3');
        oneCallApiKey = ApiKey.oneCallApiKey3;
        var endpoint = Uri.parse(
            '$oneCallUrl?lat=$lat&lon=$lon&units=metric&appid=$oneCallApiKey&units=metric');

        var response = await http.get(endpoint);

        var body = jsonDecode(response.body);

        if (response.statusCode == 404) {
          return OneCallWeather(
            timezone: 'Incorrect city name',
            timezoneOffset: 0,
            current: Current(
              dt: 0,
              sunrise: 0,
              sunset: 0,
              temp: 0,
              feelsLike: 0,
              pressure: 0,
              humidity: 0,
              dewPoint: 0,
              uvi: 0,
              clouds: 0,
              visibility: 0,
              windSpeed: 0,
              windDeg: 0,
              windGust: 0,
              weather: [
                Weather(
                  id: 0,
                  main: 'Null',
                  description: 'Null',
                  icon: '01d',
                )
              ],
            ),
            minutely: [],
            hourly: [],
            daily: [],
          );
        } else {
          debugPrint(
              OneCallWeather.fromJson(body).current?.feelsLike.toString());
          debugPrint('Using api key 3');
          return OneCallWeather.fromJson(body);
        }
      }

      var body = jsonDecode(response.body);

      if (response.statusCode == 404) {
        return OneCallWeather(
          timezone: 'Incorrect city name',
          timezoneOffset: 0,
          current: Current(
            dt: 0,
            sunrise: 0,
            sunset: 0,
            temp: 0,
            feelsLike: 0,
            pressure: 0,
            humidity: 0,
            dewPoint: 0,
            uvi: 0,
            clouds: 0,
            visibility: 0,
            windSpeed: 0,
            windDeg: 0,
            windGust: 0,
            weather: [
              Weather(
                id: 0,
                main: 'Null',
                description: 'Null',
                icon: '01d',
              )
            ],
          ),
          minutely: [],
          hourly: [],
          daily: [],
        );
      } else {
        debugPrint(OneCallWeather.fromJson(body).current?.feelsLike.toString());
        debugPrint('Using api key 2');
        return OneCallWeather.fromJson(body);
      }
    }
    var body = jsonDecode(response.body);

    if (response.statusCode == 404) {
      return OneCallWeather(
        timezone: 'Incorrect city name',
        timezoneOffset: 0,
        current: Current(
          dt: 0,
          sunrise: 0,
          sunset: 0,
          temp: 0,
          feelsLike: 0,
          pressure: 0,
          humidity: 0,
          dewPoint: 0,
          uvi: 0,
          clouds: 0,
          visibility: 0,
          windSpeed: 0,
          windDeg: 0,
          windGust: 0,
          weather: [
            Weather(
              id: 0,
              main: 'Null',
              description: 'Null',
              icon: '01d',
            )
          ],
        ),
        minutely: [],
        hourly: [],
        daily: [],
      );
    } else {
      debugPrint(OneCallWeather.fromJson(body).current?.feelsLike.toString());
      debugPrint('Using api key 1');
      return OneCallWeather.fromJson(body);
    }
  }
}
