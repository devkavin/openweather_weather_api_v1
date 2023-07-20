import 'package:flutter/material.dart';
import 'package:openweather_weather_api_v1/model/one_call_weather_model.dart';

import '../controller/one_call_weather_api.dart';
import '../widgets/constants.dart';

import '../controller/current_weather_api.dart';
import '../model/location_model.dart';

import '../widgets/additional_information.dart';
import '../widgets/current_weather.dart';
import '../widgets/daily_weather.dart';
import '../widgets/drawer.dart';
import '../widgets/search.dart';

import 'dart:math' as math;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  LocationApiClient weatherClient = LocationApiClient();
  OneCallApiClient oneCallApiClient = OneCallApiClient();

  LocationInfo? data;
  OneCallWeather? oneCallData;
  final TextEditingController _searchController = TextEditingController();

  String currentCity = "Colombo";
  double lat = 6.9319;
  double lon = 79.8478;

  bool isLoading = false;
  Icon windDirectionIcon = Icon(CustomFAIcons.windDirectionFAIcon, size: 20);
  Transform windDirectionRotatedIcon = Transform.rotate(
    angle: 0.0,
    child: Icon(
      CustomFAIcons.windDirectionFAIcon,
      size: 64.0,
    ),
  );

  // windDirectionIcon rotation
  Future<void> _rotateWindDirectionIcon() async {
    // get wind direction for windDirectionIcon
    final windDegree = oneCallData!.current!.windDeg;

    windDirectionRotatedIcon = Transform.rotate(
      angle: windDegree! * math.pi / 180,
      child: Icon(
        CustomFAIcons.windDirectionFAIcon,
        size: 64.0,
      ),
    );
  }

  void _searchCityFunction(String city) {
    if (city.isEmpty) {
      return;
    }
    Future.delayed(Duration.zero, () {
      setState(() {
        currentCity = city;
        getOneCallData();
      });
    });
  }

  Future<void> getCurrentWeather() async {
    data = await weatherClient.getCurrentWeather(currentCity);
    lat = data!.lat!;
    lon = data!.lon!;
  }

  // get wind direction for windDirectionIcon

  Future<void> getOneCallData() async {
    final data = await oneCallApiClient.getOneCallWeather(lat, lon);
    // setState(() {
    // isLoading = false;
    oneCallData = data;
    _rotateWindDirectionIcon();
    // });
  }

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
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
            'Weather',
            style: CustomTextStyle.appBarFont,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                // check if location data is sent to OneCallApi and print some data from it
                debugPrint(
                    'Lat: ${data!.lat}, Lon: ${data!.lon} in ${data!.cityName},${data!.country}, WindDegrees:${oneCallData!.current!.windDeg} Timezone: ${oneCallData!.timezone}, Current Temp: ${oneCallData!.current!.feelsLike}');
              },
              icon: const Icon(Icons.refresh),
            ),
          ],

          // menu for 4 buttons which leads to Wind, Humidity, Pressure, Feels Like
        ),
        drawer: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            return DrawerWidget(
                selectedCity: currentCity, oneCallData: oneCallData);
          },
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Search(
                controller: _searchController,
                onSubmitted: _searchCityFunction,
              ),
              // Expanded is used to make the child fill the available space
              Expanded(
                // SingleChildScrollView is used to make the screen scrollable
                child: SingleChildScrollView(
                  // FutureBuilder to get the data from the API and build the UI
                  child: FutureBuilder(
                    future: getOneCallData(),
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
                                    '${oneCallData!.current!.weather![0].icon}',
                                    '${oneCallData!.current!.weather![0].description}',
                                    '${oneCallData!.current!.temp}',
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
                                child: additionalInformation(
                                    '${oneCallData!.current!.windSpeed}',
                                    '${oneCallData!.current!.humidity}',
                                    '${oneCallData!.current!.pressure}',
                                    '${oneCallData!.current!.feelsLike}'),
                              ),
                            ),
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
                                child: dailyWeather(
                                  context: context,
                                  oneCallData: oneCallData,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: CustomAppColors.appBarColor,
                        ),
                      );
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
