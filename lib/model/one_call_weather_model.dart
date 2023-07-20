import 'current_model.dart';
import 'time_based_model.dart';

class OneCallWeather {
  final String? timezone;
  final int? timezoneOffset;
  final Current? current;
  final List<Minutely> minutely;
  final List<Hourly> hourly;
  final List<Daily> daily;

  OneCallWeather({
    this.timezone,
    this.timezoneOffset,
    this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
  });

  factory OneCallWeather.fromJson(Map<String, dynamic> json) {
    return OneCallWeather(
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: Current.fromJson(json['current']),
      minutely: Minutely.getMinutelyList(json['minutely']),
      hourly: Hourly.getHourlyList(json['hourly']),
      daily: Daily.getDailyList(json['daily']),
    );
  }

  static List<Minutely>? minutelyList = [];
  static List<Hourly>? hourlyList = [];
  static List<Daily>? dailyList = [];

  static List<Minutely> getMinutelyList(List<dynamic> json) {
    minutelyList = [];
    json.forEach((element) {
      minutelyList!.add(Minutely.fromJson(element));
    });
    return minutelyList!;
  }

  static List<Hourly> getHourlyList(List<dynamic> json) {
    hourlyList = [];
    json.forEach((element) {
      hourlyList!.add(Hourly.fromJson(element));
    });
    return hourlyList!;
  }

  static List<Daily> getDailyList(List<dynamic> json) {
    dailyList = [];
    json.forEach((element) {
      dailyList!.add(Daily.fromJson(element));
    });
    return dailyList!;
  }
}
