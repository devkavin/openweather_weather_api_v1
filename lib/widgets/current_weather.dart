import 'package:flutter/material.dart';
import '../widgets/constants.dart';

Widget currentWeather(String weatherIcon, String weatherDescription,
    String temp, String location, String country) {
  // Weather? weather;
  // weather?.cityName = location;
  String iconImageUrl = "https://openweathermap.org/img/wn/$weatherIcon@4x.png";
  String locationCaps = location.toUpperCase();
  String weatherDescCaps = weatherDescription.toUpperCase();

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
        SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CustomFAIcons.locationFAIcon,
                // color: CustomAppColors.smallIconColor,
                size: 20,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                '$locationCaps, $country',
                style: CustomTextStyle.locationfont,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25.0,
          child: Text(
            // cityName from Weather
            weatherDescCaps,
            style: CustomTextStyle.weatherDescFont,
          ),
        ),
        // const SizedBox(
        //   height: 10.0,
        // ),
        Text(
          "$temp°",
          style: CustomTextStyle.tempMainFont,
        ),
      ],
    ),
  );
}

// get value from dropdownButton and set lat and lon

