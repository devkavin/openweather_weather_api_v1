import 'package:flutter/material.dart';
import 'package:openweather_weather_api_v1/widgets/constants.dart';

import '../model/weather_model.dart';

Widget currentPressure(Icon pressureIcon, String humidity, String location) {
  Weather? weather;
  weather?.cityName = location;

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pressureIcon,
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "$humidity hPa",
          style: CustomTextStyle.addInfoMainFont,
        ),
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

