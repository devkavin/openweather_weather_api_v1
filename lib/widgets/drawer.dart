import 'package:flutter/material.dart';
import 'package:openweather_weather_api_v1/model/one_call_weather_model.dart';
import '../model/current_model.dart';
import '../widgets/constants.dart';

import '../View/feels_like.dart';
import '../View/humidity.dart';
import '../View/pressure.dart';
import '../View/wind.dart';

class DrawerWidget extends StatefulWidget {
  final String selectedCity;
  final OneCallWeather? oneCallData;
  const DrawerWidget({
    Key? key,
    required this.selectedCity,
    this.oneCallData,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Current? data;

  // refresh drawer
  void refreshDrawer() {
    setState(() {
      data = widget.oneCallData!.current;
      debugPrint(
          'refreshDrawer() called, windDeg from OC: ${widget.oneCallData!.current!.windDeg} for ${widget.selectedCity}, windDeg from data: ${data!.windDeg}');
    });
  }

  @override
  void initState() {
    super.initState();
    refreshDrawer();
  }

  get location => widget.selectedCity;
  get windSpeed => widget.oneCallData!.current!.windSpeed;
  get windDeg => widget.oneCallData!.current!.windDeg;
  get windGust => widget.oneCallData!.current!.windGust;
  get humidity => widget.oneCallData!.current!.humidity;
  get feelsLike => widget.oneCallData!.current!.feelsLike;
  get pressure => widget.oneCallData!.current!.pressure;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
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
                        CustomImages().openWeatherLogo,
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ListView(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Icon(CustomFAIcons.windFAIcon),
                          const SizedBox(
                            width: 20.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                      title: Row(
                        children: [
                          Icon(CustomFAIcons.humidityFAIcon),
                          const SizedBox(
                            width: 20.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                      title: Row(
                        children: [
                          Icon(CustomFAIcons.pressureFAIcon),
                          const SizedBox(
                            width: 20.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                      title: Row(
                        children: [
                          Icon(CustomFAIcons.feelsLikeFAIcon),
                          const SizedBox(
                            width: 20.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                    // ListTile(
                    //   title: Row(
                    //     children: [
                    //       Icon(CustomFAIcons.windFAIcon),
                    //       const SizedBox(
                    //         width: 20.0,
                    //       ),
                    //       const Padding(
                    //         padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    //         child: Text(
                    //           'TEST',
                    //           style: CustomTextStyle.drawerFont,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //   onTap: () {
                    //     debugPrint(
                    //         '${widget.selectedCity},${widget.oneCallData!.current!.windSpeed}');
                    //   },
                    // ),
                    const ListTile(
                      title: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
