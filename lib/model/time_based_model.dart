import 'weather_list_model.dart';

class Minutely {
  final int? dt;
  final int? precipitation;

  Minutely({
    this.dt,
    this.precipitation,
  });

  factory Minutely.fromJson(Map<String, dynamic> json) {
    return Minutely(
      dt: json['dt'],
      precipitation: json['precipitation'].round(),
    );
  }

  static getMinutelyList(json) {
    List<Minutely> minutelyList = [];
    if (json != null) {
      json.forEach(
        (element) {
          minutelyList.add(Minutely.fromJson(element));
        },
      );
    } else {
      for (int i = 0; i < 60; i++) {
        minutelyList.add(Minutely(dt: 0, precipitation: 0));
      }
    }
    return minutelyList;
  }
}

class Hourly {
  final int? dt;
  final int? temp;
  final int? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? uvi;
  final int? clouds;
  final int? visibility;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<Weather>? weather;
  final double? pop;

  Hourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      dt: json['dt'],
      temp: json['temp'].round(),
      feelsLike: json['feels_like'].round(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'] + 0.0,
      uvi: json['uvi'] + 0.0,
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'] + 0.0,
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'] + 0.0,
      weather: weatherList,
      pop: json['pop'] + 0.0,
    );
  }

  static List<Weather>? weatherList = [];

  static getHourlyList(json) {
    List<Hourly> hourlyList = [];
    json.forEach((element) {
      weatherList = Weather.getWeatherList(element['weather']);
      hourlyList.add(Hourly.fromJson(element));
    });
    return hourlyList;
  }
}

class Daily {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final double? moonPhase;
  final Temp? temp;
  final FeelsLike? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<Weather>? weather;
  final int? clouds;
  final double? pop;
  final double? uvi;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'] + 0.0,
      temp: Temp.fromJson(json['temp']),
      feelsLike: FeelsLike.fromJson(json['feels_like']),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'] + 0.0,
      windSpeed: json['wind_speed'] + 0.0,
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'] + 0.0,
      weather: weatherList,
      clouds: json['clouds'],
      pop: json['pop'] + 0.0,
      uvi: json['uvi'] + 0.0,
    );
  }

  static List<Weather>? weatherList = [];

  static getDailyList(json) {
    List<Daily> dailyList = [];
    json.forEach((element) {
      weatherList = Weather.getWeatherList(element['weather']);
      dailyList.add(Daily.fromJson(element));
    });
    return dailyList;
  }
}

class Temp {
  final int? day;
  final int? min;
  final int? max;
  final int? night;
  final int? eve;
  final int? morn;

  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
      day: json['day'].round(),
      min: json['min'].round(),
      max: json['max'].round(),
      night: json['night'].round(),
      eve: json['eve'].round(),
      morn: json['morn'].round(),
    );
  }
}

class FeelsLike {
  final int? day;
  final int? night;
  final int? eve;
  final int? morn;

  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    return FeelsLike(
      day: json['day'].round(),
      night: json['night'].round(),
      eve: json['eve'].round(),
      morn: json['morn'].round(),
    );
  }
}
