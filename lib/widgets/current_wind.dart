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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: SizedBox(
            height: 60,
            child: windIcon,
          ),
        ),
        SizedBox(
          height: 80,
          child: Text(
            '$windSpeed m/s',
            style: CustomTextStyle.addInfoMainFont,
          ),
        ),
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
                style: CustomTextStyle.addInfoTitleFont,
              ),
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

