import 'package:flutter/material.dart';
import 'package:openweather_weather_api_v1/widgets/constants.dart';
import 'package:weather_icons/weather_icons.dart';
import '../widgets/current_humidity.dart';

class HumidityPage extends StatelessWidget {
  final String? location;
  final int? humidity;

  const HumidityPage({super.key, this.location, this.humidity});
  final Icon humidityIcon = const Icon(
    WeatherIcons.humidity,
    color: Colors.blue,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Humidity", style: CustomTextStyle.appBarFont),
      ),
      body: Column(
        children: [
          currentHumidity(humidityIcon, '$humidity', '$location'),
        ],
      ),
    );
  }
}
