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
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: SizedBox(height: 60, child: humidityIcon),
        ),
        SizedBox(
            height: 80,
            child: Text("$humidity%", style: CustomTextStyle.addInfoMainFont)),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CustomFAIcons.locationFAIcon,
                color: CustomAppColors.smallIconColor,
                size: 20,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                  // cityName from Weather
                  location,
                  style: CustomTextStyle.addInfoTitleFont),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );
}

// get value from dropdownButton and set lat and lon

