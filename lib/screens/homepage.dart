import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:openweather_weather_api_v1/widgets/constants.dart';

import '../api_calling/weather_api.dart';
import '../model/weather_model.dart';

import '../widgets/additional_information.dart';
import '../widgets/current_weather.dart';
import '../widgets/drawer.dart';
import '../widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();

  Weather? data;
  final TextEditingController _searchController = TextEditingController();

  String selectedCity = "Colombo";

  void _searchCity(String city) {
    if (city.isEmpty) {
      return;
    }
    Future.delayed(Duration.zero, () {
      setState(() {
        selectedCity = city;
      });
    });
  }

  Future<void> getData() async {
    data = await client.getCurrentWeather(selectedCity);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: CustomAppColors.appBarColor,
          ),
          title: const Text(
            'Weather Api',
            style: CustomTextStyle.appBarFont,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                debugPrint('${data!.weatherDesc}');
              },
              icon: const Icon(Icons.refresh),
            ),
          ],

          // menu for 4 buttons which leads to Wind, Humidity, Pressure, Feels Like
        ),
        drawer: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return DrawerWidget(selectedCity: selectedCity, data: data);
            }),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Search(
                controller: _searchController,
                onSubmitted: _searchCity,
              ),
              //add image from network here
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: getData(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                child: currentWeather(
                                    '${data!.weatherIcon}',
                                    '${data!.weatherDesc}',
                                    '${data!.temp}',
                                    '${data!.cityName}',
                                    '${data!.country}'),
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
                                child: Container(
                                  child: additionalInformation(
                                      '${data!.windSpeed}',
                                      '${data!.humidity}',
                                      '${data!.pressure}',
                                      '${data!.feelsLike}'),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
