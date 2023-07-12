import 'package:flutter/material.dart';
import 'package:openweather_weather_api_v1/widgets/constants.dart';

Widget additionalWindInformation(String windDeg, String windGust) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wind Degree',
                  style: CustomTextStyle.titleFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Wind Gust',
                  style: CustomTextStyle.titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$windDeg°',
                  style: CustomTextStyle.infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  '$windGust m/s',
                  style: CustomTextStyle.infoFont,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
