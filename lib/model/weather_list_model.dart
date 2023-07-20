class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  static List<Weather>? weatherList = [];

  static List<Weather> getWeatherList(List<dynamic> json) {
    weatherList = [];
    json.forEach((element) {
      weatherList!.add(Weather.fromJson(element));
    });
    return weatherList!;
  }
}
