import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/Repo/Model/site.dart';
import 'package:weather_app_v2/Repo/Model/weather_data.dart';
import 'package:weather_app_v2/View%20Models/location_viewmodel.dart';
import 'package:weather_app_v2/View%20Models/weather_viewmodel.dart';
import 'package:weather_app_v2/util_functions.dart';
import '../Repo/Model/site.dart';
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
  late Site site;

  Future<WeatherData> loadingEverythingFromStartScreen() async {
    site = await LocationViewModel().getCurrentLocation();
    widget.cityName = await LocationViewModel().getCityName(site);
    weatherData = await WeatherViewModel().getWeatherData(site);
    return weatherData;
  }

  Future<WeatherData> loadingEverythingFromSearchScreen() async {
    site = await LocationViewModel().getLatLonFromCityName(widget.cityName);
    weatherData = await WeatherViewModel().getWeatherData(site);
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData()
          .copyWith(scaffoldBackgroundColor: const Color(0xFF232535)),
      home: Scaffold(
          body: FutureBuilder(
              future: widget.fromSearchScreen
                  ? loadingEverythingFromSearchScreen()
                  : loadingEverythingFromStartScreen(),
              builder:
                  (BuildContext context, AsyncSnapshot<WeatherData> snapshot) {
                if (snapshot.hasError) {
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
                            CityName(
                              cityName: widget.cityName?.toTitleCase(),
                            ),
                            Search()
                          ],
                        ),
                        WeatherDetails(
                            weatherName: weatherData.condition,
                            temp: "${weatherData.temp}°",
                            imageUrl:
                                "http://openweathermap.org/img/wn/${weatherData.icon}@2x.png",
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
                                  date: UtilFunction.getDateInCorrectFormat(
                                      weatherData.hour1),
                                  temp: weatherData.temp_hour1,
                                  icon: CupertinoIcons.cloud_sun,
                                  time: UtilFunction.getTimeInCorrectFormat(
                                      weatherData.hour1),
                                ),
                                WeatherCard(
                                  date: UtilFunction.getDateInCorrectFormat(
                                      weatherData.hour2),
                                  temp: weatherData.temp_hour2,
                                  icon: CupertinoIcons.cloud_sun,
                                  time: UtilFunction.getTimeInCorrectFormat(
                                      weatherData.hour2),
                                ),
                                WeatherCard(
                                  date: UtilFunction.getDateInCorrectFormat(
                                      weatherData.hour3),
                                  temp: weatherData.temp_hour3,
                                  icon: CupertinoIcons.cloud_sun,
                                  time: UtilFunction.getTimeInCorrectFormat(
                                      weatherData.hour3),
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
