import 'package:flutter/material.dart';
import '../model/one_call_weather_model.dart';
import '../widgets/constants.dart';

Widget dailyWeather(
    {required BuildContext context, OneCallWeather? oneCallData}) {
  String iconUrl = Urls.openWeatherMapApiIconUrl;

  // convert unix time to date
  DateTime findDate(OneCallWeather? oneCallData, int index) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        oneCallData!.daily[index].dt! * 1000,
        isUtc: false);
    // calculate time difference between UTC and location time
    int timeDifference = oneCallData.timezoneOffset!;
    // convert time difference to hours
    int timeDifferenceInHours = timeDifference ~/ 3600;
    // add time difference to date
    date = date.add(Duration(hours: timeDifferenceInHours));
    return date;
  }

  // if day is today return today, if tomorrow return tomorrow else return the weekday name

  // // weekday switch case
  String getWeekday(int day) {
    if (day == DateTime.now().weekday) {
      return "Today";
    } else if (day == DateTime.now().weekday + 1) {
      return "Tomorrow";
    } else {
      switch (day) {
        case 1:
          return "Monday";
        case 2:
          return "Tuesday";
        case 3:
          return "Wednessday";
        case 4:
          return "Thursday";
        case 5:
          return "Friday";
        case 6:
          return "Saturday";
        default:
          return "Sunday";
      }
    }
  }

  // A Carousal of Daily Weather for 7 days
  return Container(
    alignment: Alignment.center,
    height: 250,
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (context, index) {
        // day in the form of today tomorrow etc
        DateTime date = findDate(oneCallData, index);
        var weekday = getWeekday(date.weekday);

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.2),
            ),
            child: SizedBox(
              width: 210,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        oneCallData!.daily![index].temp!.day!
                                .round()
                                .toString() +
                            "°C",
                        style: CustomTextStyle.cardTempFont),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      oneCallData!.daily![index].weather![0].description
                          .toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 80,
                      child: Container(
                        child: Image.network(
                          iconUrl +
                              oneCallData!.daily![index].weather![0].icon
                                  .toString() +
                              "@2x.png",
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      weekday,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

DateTime findDate(OneCallWeather? oneCallData, int index) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(
      oneCallData!.daily[index].dt! * 1000,
      isUtc: false);
  // calculate time difference between UTC and location time
  int timeDifference = oneCallData.timezoneOffset!;
  // convert time difference to hours
  int timeDifferenceInHours = timeDifference ~/ 3600;
  // add time difference to date
  date = date.add(Duration(hours: timeDifferenceInHours));
  return date;
}
