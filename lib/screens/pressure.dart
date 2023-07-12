import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../widgets/constants.dart';
import '../widgets/current_pressure.dart';

class PressurePage extends StatelessWidget {
  final String? location;
  final int? pressure;

  const PressurePage({super.key, this.location, this.pressure});

  // Icon
  final Icon pressureIcon = const Icon(
    WeatherIcons.barometer,
    color: Colors.blue,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pressure", style: CustomTextStyle.appBarFont),
      ),
      body: Column(
        children: [
          currentPressure(pressureIcon, '$pressure', '$location'),
        ],
      ),
    );
  }
}
