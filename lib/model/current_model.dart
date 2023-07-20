import 'weather_list_model.dart';

class Current {
  final int? dt;
  final int? sunrise;
  final int? sunset;
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

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
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
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
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
      windGust: json['wind_gust'],
      weather: Weather.getWeatherList(json['weather']),
    );
  }
}
