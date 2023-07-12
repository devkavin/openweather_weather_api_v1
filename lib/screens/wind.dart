import 'package:flutter/material.dart';
import 'package:openweather_weather_api_v1/widgets/constants.dart';

import '../widgets/additional_wind_information.dart';
import '../widgets/current_wind.dart';

class WindPage extends StatelessWidget {
  final String? location;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;

  const WindPage(
      {super.key, this.windSpeed, this.windDeg, this.windGust, this.location});
  final Icon windIcon = const Icon(
    Icons.air,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Wind"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.lightBlueAccent,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  border: Border()),
              child: currentWind(
                  windIcon, '$windDeg', '$windGust', '$windSpeed', '$location'),
            ),
          ),
          const Divider(),
          const Text(
            "Details",
            style: CustomTextStyle.biggerTitleFont,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue,
                        Colors.lightBlueAccent,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    border: Border()),
                child: additionalWindInformation('$windDeg', '$windGust')),
          ),
        ],
      ),
    );
  }
}
