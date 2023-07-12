// class to store constant icons for the app
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class CustomAppColors {
  static const Color drawerTitleColor = Color.fromARGB(255, 0, 0, 0);
  static const Color locationColor = Color.fromARGB(255, 255, 255, 255);
  static const Color impTextColor = Color.fromARGB(255, 196, 196, 196);
  // static const Color biggerTitleColor = Color.fromARGB(255, 196, 196, 196);
  // static const Color textColor = Color.fromARGB(255, 161, 161, 161);
  static const Color textColor = Color.fromARGB(255, 0, 0, 0);
  static const Color drawerTextColor = Color.fromARGB(255, 0, 0, 0);
  static const Color infoTextColor = Color.fromARGB(255, 44, 44, 44);
  static const Color weatherDescColor = Color.fromARGB(255, 59, 59, 59);
  static const Color backgroundColor = Color.fromARGB(255, 25, 25, 26);
  // static const Color locationColor = Color.fromARGB(255, 0, 0, 0);
  // static const Color impTextColor = Color.fromARGB(255, 73, 73, 73);
  // static const Color textColor = Color.fromARGB(255, 136, 136, 136);
  static const Color biggerTitleColor = Color.fromARGB(255, 59, 59, 59);
  // static const Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
}

class CustomTextStyle {
  static const TextStyle tempMainFont = TextStyle(
      color: CustomAppColors.textColor,
      fontWeight: FontWeight.w100,
      fontSize: 80.0);
  static const TextStyle addInfoMainFont = TextStyle(
      color: CustomAppColors.locationColor,
      fontWeight: FontWeight.w400,
      fontSize: 60.0);

  static const TextStyle drawerTitleFont = TextStyle(
    // if text overflows, go to next line
    overflow: TextOverflow.ellipsis,
    color: CustomAppColors.drawerTitleColor,
    fontWeight: FontWeight.w800,
    fontSize: 36.0,
  );
  static const TextStyle appBarFont = TextStyle(
    // if text overflows, go to next line
    overflow: TextOverflow.ellipsis,
    color: CustomAppColors.locationColor,
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
  );
  static const TextStyle locationfont = TextStyle(
      // if text overflows, go to next line
      overflow: TextOverflow.ellipsis,
      color: CustomAppColors.locationColor,
      fontWeight: FontWeight.w800,
      fontSize: 24.0,
      letterSpacing: 4.0);
  static const TextStyle drawerFont = TextStyle(
      // if text overflows, go to next line
      overflow: TextOverflow.ellipsis,
      color: CustomAppColors.drawerTextColor,
      fontWeight: FontWeight.w600,
      fontSize: 24.0,
      letterSpacing: 2.0);
  static const TextStyle weatherDescFont = TextStyle(
      // if text overflows, go to next line
      overflow: TextOverflow.ellipsis,
      color: CustomAppColors.weatherDescColor,
      fontWeight: FontWeight.w800,
      fontSize: 20.0,
      letterSpacing: 0);
  static const TextStyle titleFont = TextStyle(
    color: CustomAppColors.impTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );
  static const TextStyle biggerTitleFont = TextStyle(
      color: CustomAppColors.biggerTitleColor,
      fontWeight: FontWeight.w600,
      fontSize: 24.0);
  static const TextStyle infoFont = TextStyle(
      color: CustomAppColors.infoTextColor,
      fontWeight: FontWeight.w400,
      fontSize: 18.0);
  static const TextStyle searchFont =
      TextStyle(color: CustomAppColors.textColor, fontSize: 18.0);
}

class CustomAppIcons {
  static const IconData feelsLikeWIcon = WeatherIcons.thermometer;
  static const IconData humiditywIcon = WeatherIcons.humidity;
  static const IconData pressureWIcon = WeatherIcons.barometer;
  static const IconData windWIcon = WeatherIcons.cloudy_gusts;
}

class CustomImages {
  Image openWeatherLogo = Image.network(
    logoImageUrl,
    // size related to the parent widget
    width: 100.0,
    height: 100.0,
    // fit: BoxFit.cover,
    filterQuality: FilterQuality.high,
  );

  static String get logoImageUrl =>
      'https://openweathermap.org/themes/openweathermap/assets/img/mobile_app/android-app-top-banner.png';
}
