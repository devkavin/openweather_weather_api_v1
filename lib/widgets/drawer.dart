import 'package:flutter/material.dart';
import '../widgets/constants.dart';

import '../model/weather_model.dart';
import '../screens/feels_like.dart';
import '../screens/humidity.dart';
import '../screens/pressure.dart';
import '../screens/wind.dart';
import 'package:weather_icons/weather_icons.dart';

class DrawerWidget extends StatefulWidget {
  final String selectedCity;
  final Weather? data;
  const DrawerWidget({
    Key? key,
    required this.selectedCity,
    this.data,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Weather? data;

  @override
  void initState() {
    super.initState();
  }

  get location => widget.selectedCity;
  get windSpeed => widget.data!.windSpeed;
  get windDeg => widget.data!.windDeg;
  get windGust => widget.data!.windGust;
  get humidity => widget.data!.humidity;
  get feelsLike => widget.data!.feelsLike;
  get pressure => widget.data!.pressure;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              // transparent background
              color: Colors.transparent,
              // no divider line
              border: Border(
                bottom: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    // height: 200,
                    child: Column(
                      children: [
                        // image from url
                        // Image.network(
                        //   'https://www.flaticon.com/svg/static/icons/svg/3523/3523063.svg',
                        //   height: 100,
                        //   width: 100,
                        // ),
                        SizedBox(
                            height: 65, child: CustomImages().openWeatherLogo),
                        Text('Weather Api',
                            style: CustomTextStyle.drawerTitleFont),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  // transparent background
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
              child: ListView(
                children: [
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(CustomAppIcons.windWIcon),
                        SizedBox(
                          width: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Wind',
                            style: CustomTextStyle.drawerFont,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      // create a scaffold and pass data to it
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WindPage(
                            location: location,
                            windSpeed: windSpeed,
                            windDeg: windDeg,
                            windGust: windGust,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(CustomAppIcons.humiditywIcon),
                        SizedBox(
                          width: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Humidity',
                            style: CustomTextStyle.drawerFont,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      // create a scaffold and pass data to it
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HumidityPage(
                            location: location,
                            humidity: humidity,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(CustomAppIcons.pressureWIcon),
                        SizedBox(
                          width: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Pressure',
                            style: CustomTextStyle.drawerFont,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      // create a scaffold and pass data to it
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PressurePage(
                            location: location,
                            pressure: pressure,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(CustomAppIcons.feelsLikeWIcon),
                        SizedBox(
                          width: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text('Feels Like',
                              style: CustomTextStyle.drawerFont),
                        ),
                      ],
                    ),
                    onTap: () async {
                      // create a scaffold and pass data to it
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeelsLikePage(
                            location: location,
                            feelsLike: feelsLike,
                          ),
                        ),
                      );
                    },
                  ),
                  const ListTile(
                    title: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Divider(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
