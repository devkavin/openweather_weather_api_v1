// class to store constant icons for the app
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomColors {
  // dark mode color pallette
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color grey = Color.fromARGB(255, 196, 196, 196);
  static const Color lightGrey = Color.fromARGB(255, 136, 136, 136);
  static const Color darkGrey = Color.fromARGB(255, 73, 73, 73);
  // ash grey
  static const Color ashGrey = Color.fromARGB(255, 233, 248, 255);
}

class CustomAppColors {
  static const Color appBarColor = CustomColors.black;
  static const Color smallIconColor = CustomColors.black;
  static const Color drawerTitleColor = CustomColors.black;
  static const Color drawerTextColor = CustomColors.white;
  static const Color locationColor = CustomColors.white;
  static const Color impTextColor = CustomColors.black;
  static const Color textColor = CustomColors.black;
  static const Color infoTextColor = CustomColors.darkGrey;
  static const Color metricTextColor = CustomColors.white;
  static const Color weatherDescColor = CustomColors.white;
  static const Color biggerTitleColor = CustomColors.darkGrey;
  static const Color detailsTitleColor = CustomColors.darkGrey;
  static const Color backgroundColor = CustomColors.ashGrey;
  // static const Color appBarColor = CustomColors.white;
  // static const Color biggerTitleColor = CustomColors.lightGrey;
  // static const Color textColor = CustomColors.lightGrey;
  // static const Color infoTextColor = CustomColors.darkGrey;
  // static const Color locationColor = CustomColors.black;
  // static const Color impTextColor = CustomColors.darkGrey;
  // static const Color textColor = CustomColors.lightGrey;
}

class CustomTextStyle {
  static const TextStyle tempMainFont = TextStyle(
      color: CustomAppColors.textColor,
      fontWeight: FontWeight.w100,
      fontSize: 80.0);
  static const TextStyle addInfoMainFont = TextStyle(
      color: CustomAppColors.locationColor,
      fontFamily: 'Comfortaa-Bold',
      fontWeight: FontWeight.bold,
      fontSize: 60.0);
  static const TextStyle addInfoTitleFont = TextStyle(
      color: CustomAppColors.textColor,
      fontFamily: 'Comfortaa-Bold',
      fontWeight: FontWeight.bold,
      fontSize: 24.0);

  static const TextStyle appBarFont = TextStyle(
    // if text overflows, go to next line
    color: CustomAppColors.appBarColor,
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
  );
  static const TextStyle drawerTitleFont = TextStyle(
    // if text overflows, go to next line
    overflow: TextOverflow.ellipsis,
    color: CustomAppColors.drawerTitleColor,
    fontWeight: FontWeight.w800,
    fontSize: 36.0,
  );
  static const TextStyle drawerFont = TextStyle(
      // if text overflows, go to next line
      overflow: TextOverflow.ellipsis,
      color: CustomAppColors.drawerTextColor,
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
      letterSpacing: 2.0);
  static const TextStyle locationfont = TextStyle(
      // if text overflows, go to next line
      overflow: TextOverflow.ellipsis,
      color: CustomAppColors.locationColor,
      fontFamily: 'Comfortaa-Bold',
      fontWeight: FontWeight.w900,
      fontSize: 24.0,
      letterSpacing: 4.0);
  static const TextStyle weatherDescFont = TextStyle(
      // if text overflows, go to next line
      overflow: TextOverflow.ellipsis,
      color: CustomAppColors.weatherDescColor,
      fontFamily: 'Comfortaa-Bold',
      fontWeight: FontWeight.w400,
      fontSize: 20.0,
      letterSpacing: 2.0);
  static const TextStyle titleFont = TextStyle(
    color: CustomAppColors.impTextColor,
    fontFamily: 'Comfortaa-Bold',
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );
  static const TextStyle biggerTitleFont = TextStyle(
      color: CustomAppColors.biggerTitleColor,
      fontWeight: FontWeight.bold,
      fontSize: 24.0);
  static const TextStyle detailsTitleFont = TextStyle(
      color: CustomAppColors.detailsTitleColor,
      fontWeight: FontWeight.w600,
      fontSize: 24.0);
  static const TextStyle infoFont = TextStyle(
      color: CustomAppColors.metricTextColor,
      fontFamily: 'Comfortaa-Bold',
      fontWeight: FontWeight.bold,
      fontSize: 18.0);
  static const TextStyle searchFont =
      TextStyle(color: CustomAppColors.textColor, fontSize: 18.0, height: 1.4);
  static const TextStyle cardTempFont = TextStyle(
    color: CustomAppColors.metricTextColor,
    fontFamily: 'Comfortaa-Bold',
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
  );
}

// class CustomAppIcons {
//   static const IconData feelsLikeWIcon = WeatherIcons.thermometer;
//   static const IconData humiditywIcon = WeatherIcons.humidity;
//   static const IconData pressureWIcon = WeatherIcons.barometer;
//   static const IconData windWIcon = WeatherIcons.cloudy_gusts;
// }

class CustomFAIcons {
  static IconData feelsLikeFAIcon = FontAwesomeIcons.thermometer;
  static IconData humidityFAIcon = FontAwesomeIcons.droplet;
  static IconData pressureFAIcon = FontAwesomeIcons.gauge;
  static IconData windFAIcon = FontAwesomeIcons.wind;
  static IconData locationFAIcon = FontAwesomeIcons.locationDot;
  static IconData windDirectionFAIcon = FontAwesomeIcons.locationArrow;
}

class CustomImages {
  Image openWeatherLogo = Image.network(
    logoImageUrl,
    // size related to the parent widget
    // width: 100.0,
    // height: 100.0,
    // fit: BoxFit.cover,
    filterQuality: FilterQuality.high,
    // remove the white backgroun
  );

  static String get logoImageUrl =>
      // 'https://openweathermap.org/themes/openweathermap/assets/img/mobile_app/android-app-top-banner.png';
      'https://brands.home-assistant.io/_/openweathermap/logo.png';
}

class Urls {
  static const String openWeatherMapApiIconUrl =
      'http://openweathermap.org/img/wn/';
}
