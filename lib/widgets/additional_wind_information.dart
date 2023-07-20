import 'package:flutter/material.dart';
import '../widgets/constants.dart';

Widget additionalWindInformation(String windDeg, String windGust) {
  // Diplay FA Icon based on wind direction

  Transform windDirectionIconSmallWidget;

  // rotate windDirection Icon based on wind degree
  windDirectionIconSmallWidget = Transform.rotate(
    angle: double.parse(windDeg) * 3.14,
    child: Icon(
      CustomFAIcons.windDirectionFAIcon,
      size: 20.0,
    ),
  );

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
                  'Wind Degree',
                  style: CustomTextStyle.titleFont,
                ),
                SizedBox(
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
                Row(
                  children: [
                    Text(
                      '$windDeg°',
                      style: CustomTextStyle.infoFont,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    windDirectionIconSmallWidget,
                  ],
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
