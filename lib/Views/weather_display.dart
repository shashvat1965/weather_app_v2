import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather_app_v2/Repo/Model/location.dart';
import 'package:weather_app_v2/Repo/Model/weather_data.dart';
import 'package:weather_app_v2/Resources/constants.dart';
import 'package:weather_app_v2/View%20Models/location_viewmodel.dart';
import 'package:weather_app_v2/View%20Models/weather_viewmodel.dart';
import '../Repo/Model/location2.dart';
import '../Widgets/city_name.dart';
import '../Widgets/middle_weather_details.dart';
import 'search.dart';
import '../Widgets/weather_card.dart';

class WeatherDisplay extends StatefulWidget {
  bool fromSearchScreen;
  String? cityName;
  WeatherDisplay({Key? key, required this.fromSearchScreen, this.cityName})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WeatherDisplayState();
  }
}

class WeatherDisplayState extends State<WeatherDisplay> {
  late WeatherData weatherData;
  late Location location;
  late Location2 location2;

  Future<WeatherData> loadingEverythingFromStartScreen() async {
    location = await LocationViewModel().getCurrentLocation();
    widget.cityName = await LocationViewModel().getCityName(location);
    weatherData = await WeatherViewModel().getWeatherData(location);
    return weatherData;
  }

  getTimeInCorrectFormat(String x){
    int k = int.parse(x);
    k=k*1000;
    var y = DateTime.fromMillisecondsSinceEpoch(k);
    var z = y.add(const Duration(hours: 5, minutes: 30));
    var temp = Jiffy(z).format('hh:mm');
    return temp;
  }
  getDateInCorrectFormat(String x){
    int k = int.parse(x);
    k=k*1000;
    var y = DateTime.fromMillisecondsSinceEpoch(k);
    var z = y.add(const Duration(hours: 5, minutes: 30));
    var date = Jiffy(z).format('dd/MM');
    return date;
  }

  Future<WeatherData> loadingEverythingFromSearchScreen() async {
    print(widget.cityName);
    location2 =
        await LocationViewModel().getLatLonFromCityName(widget.cityName);
    print("test 2");
    weatherData = await WeatherViewModel().getWeatherData(location);
    print("test 3");
    return weatherData;
  }

  @override
  initState() {
    if (widget.fromSearchScreen) {
      loadingEverythingFromSearchScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData()
          .copyWith(scaffoldBackgroundColor: const Color(0xFF232535)),
      home: Scaffold(
          body: FutureBuilder(
              future: widget.fromSearchScreen
                  ? null
                  : loadingEverythingFromStartScreen(),
              builder:
                  (BuildContext context, AsyncSnapshot<WeatherData> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Text(
                          "Error",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CityName(cityName: widget.cityName),
                            Search()
                          ],
                        ),
                        WeatherDetails(
                            weatherName: "Cloudy",
                            temp: "${weatherData.temp}°",
                            image: thunder,
                            windSpeed: "${weatherData.windSpeed}km/h",
                            humidity: "${weatherData.humidity}%"),
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                WeatherCard(
                                  date: getDateInCorrectFormat(weatherData.hour1),
                                  temp: weatherData.temp_hour1,
                                  icon: CupertinoIcons.cloud_sun,
                                  time: getTimeInCorrectFormat(weatherData.hour1),
                                ),
                                WeatherCard(
                                  date: getDateInCorrectFormat(weatherData.hour2),
                                  temp: weatherData.temp_hour2,
                                  icon: CupertinoIcons.cloud_sun,
                                  time: getTimeInCorrectFormat(weatherData.hour2),
                                ),
                                WeatherCard(
                                  date: getDateInCorrectFormat(weatherData.hour3),
                                  temp: weatherData.temp_hour3,
                                  icon: CupertinoIcons.cloud_sun,
                                  time: getTimeInCorrectFormat(weatherData.hour3),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              })),
    );
  }
}
