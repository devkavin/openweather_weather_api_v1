import 'package:flutter/material.dart';
import 'package:openweather_weather_api_v1/widgets/constants.dart';

import '../model/weather_model.dart';

import 'package:intl/intl.dart';

Widget currentWeather(String weatherIcon, String weatherDescription,
    String temp, String location, String country) {
  // Weather? weather;
  // weather?.cityName = location;
  String iconImageUrl = "https://openweathermap.org/img/wn/$weatherIcon@4x.png";
  String locationCaps = location.toUpperCase();

  Image weatherIconImage = Image.network(
    iconImageUrl,
    // size related to the parent widget
    width: 150.0,
    height: 150.0,
    fit: BoxFit.cover,
    filterQuality: FilterQuality.high,
  );

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100.0, child: weatherIconImage),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Text(
            '$locationCaps, $country',
            style: CustomTextStyle.locationfont,
          ),
        ),
        Text(
          "$temp°",
          style: CustomTextStyle.tempMainFont,
        ),
        Text(
          // cityName from Weather
          weatherDescription,
          style: CustomTextStyle.weatherDescFont,
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );
}

// get value from dropdownButton and set lat and lon

