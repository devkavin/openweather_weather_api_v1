import 'package:flutter/material.dart';

import '../model/weather_model.dart';
import 'constants.dart';

Widget currentWind(Icon windIcon, String windDegree, String windGust,
    String windSpeed, String location) {
  Weather? weather;
  weather?.cityName = location;

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        windIcon,
        Text(
          '$windSpeed m/s',
          style: CustomTextStyle.addInfoMainFont,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          // cityName from Weather
          location,
          style: CustomTextStyle.titleFont,
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );
}

// get value from dropdownButton and set lat and lon

