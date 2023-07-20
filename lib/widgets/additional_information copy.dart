import 'package:flutter/material.dart';
import '../widgets/constants.dart';

Widget additionalInformation(
    String wind, String humidity, String pressure, String feelsLike) {
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'wind',
                  style: CustomTextStyle.titleFont,
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Pressure',
                  style: CustomTextStyle.titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$wind m/s',
                  style: CustomTextStyle.infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  '$pressure hPa',
                  style: CustomTextStyle.infoFont,
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Humidity',
                  style: CustomTextStyle.titleFont,
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Feels Like',
                  style: CustomTextStyle.titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$humidity %',
                  style: CustomTextStyle.infoFont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  '$feelsLike °C',
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
