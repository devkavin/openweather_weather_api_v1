import 'package:flutter/material.dart';
import '../model/location_model.dart';

import 'dart:math' as math;

import 'constants.dart';

Widget currentWind(Transform windIcon, int? windDegree, String windGust,
    String windSpeed, String location) {
  LocationInfo? locationInfo;
  locationInfo?.cityName = location;

  var windDirectionIconLargeWidget;

  // getWindDirectionIcon(degrees) {
  //   windDirectionIconLargeWidget = Transform.rotate(
  //     angle: degrees! * math.pi,
  //     child: Icon(
  //       CustomFAIcons.windDirectionFAIcon,
  //       size: 64.0,
  //     ),
  //   );
  //   return windDirectionIconLargeWidget;
  // }

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

