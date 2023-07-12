import 'package:flutter/material.dart';
import 'package:openweather_weather_api_v1/widgets/constants.dart';

import '../model/weather_model.dart';

Widget currentHumidity(Icon humidityIcon, String humidity, String location) {
  Weather? weather;
  weather?.cityName = location;

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: humidityIcon,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text("$humidity %", style: CustomTextStyle.addInfoMainFont),
        const SizedBox(
          height: 10.0,
        ),
        Text(
            // cityName from Weather
            location,
            style: CustomTextStyle.titleFont),
      ],
    ),
  );
}

// get value from dropdownButton and set lat and lon

