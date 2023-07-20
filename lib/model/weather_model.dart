// class CurrentWeather {
//   String? cityName;
//   int? temp;
//   String? weatherLike;
//   String? weatherDesc;
//   String? weatherIcon;
//   double? windSpeed;
//   int? windDeg;
//   double? windGust;
//   int? humidity;
//   double? feelsLike;
//   int? pressure;
//   int? dtDateTime;
//   String? country;
//   double? lat;
//   double? lon;

//   CurrentWeather({
//     this.cityName,
//     required this.temp,
//     required this.weatherLike,
//     this.weatherDesc,
//     this.weatherIcon,
//     this.windSpeed,
//     this.windDeg,
//     this.windGust,
//     this.humidity,
//     this.feelsLike,
//     this.pressure,
//     this.dtDateTime,
//     this.country,
//     this.lat,
//     this.lon,
//   });

//   CurrentWeather.fromJson(Map<String, dynamic> json) {
//     cityName = json['name'];
//     temp = json['main']['temp'];
//     weatherLike = json['weather'][0]['main'];
//     weatherDesc = json['weather'][0]['description'];
//     weatherIcon = json['weather'][0]['icon'];
//     windSpeed = json['wind']['speed'] + 0.0;
//     if (json['wind']['deg'] == null) {
//       windDeg = 0;
//     } else {
//       windDeg = json['wind']['deg'];
//     }
//     if (json['wind']['gust'] == null) {
//       windGust = 0.0;
//     } else {
//       windGust = json['wind']['gust'] + 0.0;
//     }
//     humidity = json['main']['humidity'];
//     feelsLike = json['main']['feels_like'];
//     pressure = json['main']['pressure'];
//     dtDateTime = json['dt'];
//     country = json['sys']['country'];
//     lat = json['coord']['lat'];
//     lon = json['coord']['lon'];
//   }
// }
