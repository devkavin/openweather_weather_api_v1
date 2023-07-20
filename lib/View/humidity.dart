import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import '../widgets/current_humidity.dart';

class HumidityPage extends StatelessWidget {
  final String? location;
  final int? humidity;

  HumidityPage({super.key, this.location, this.humidity});
  final Icon humidityIcon = Icon(
    CustomFAIcons.humidityFAIcon,
    size: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: CustomAppColors.appBarColor,
        ),
        centerTitle: true,
        title: const Text("Humidity", style: CustomTextStyle.appBarFont),
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
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  border: Border()),
              child: currentHumidity(humidityIcon, '$humidity', '$location'),
            ),
          ),
        ],
      ),
    );
  }
}
