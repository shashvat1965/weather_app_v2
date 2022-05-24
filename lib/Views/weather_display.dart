import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/Repo/Model/location.dart';
import 'package:weather_app_v2/Repo/Model/weather_data.dart';
import 'package:weather_app_v2/Resources/constants.dart';
import 'package:weather_app_v2/View%20Models/location_viewmodel.dart';
import 'package:weather_app_v2/View%20Models/weather_viewmodel.dart';
import '../Widgets/middle_weather_details.dart';
import '../Widgets/name_and_search.dart';
import '../Widgets/weather_card.dart';

class WeatherDisplay extends StatefulWidget {
  const WeatherDisplay({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WeatherDisplayState();
  }
}

enum Day { yesterday, today, tommorow }

class WeatherDisplayState extends State<WeatherDisplay> {
  Day selectedDay = Day.today;
  late WeatherData weatherData;
  late Location location;

  @override
  void initState() {
    loadingEverything();
    super.initState();
  }

  Future<WeatherData> loadingEverything() async {
    location = await LocationViewModel().getCurrentLocation();
    weatherData = await WeatherViewModel(location: location).getWeatherData();
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData()
          .copyWith(scaffoldBackgroundColor: const Color(0xFF232535)),
      home: Scaffold(
          body: FutureBuilder(
              future: loadingEverything(),
              builder:
                  (BuildContext context, AsyncSnapshot<WeatherData> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Text(
                        "Error",
                        style: TextStyle(color: Colors.white),
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
                        const NameAndSearch(
                          cityName: 'City Name',
                        ),
                        WeatherDetails(
                            weatherName: "Cloudy",
                            temp: "${weatherData.temp}°",
                            image: thunder,
                            windSpeed: "${weatherData.windSpeed} km/h",
                            humidity: "${weatherData.humidity}%"),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedDay = Day.yesterday;
                                    });
                                  },
                                  child: Text("Yesterday",
                                      style: TextStyle(
                                          color: (selectedDay == Day.yesterday)
                                              ? Colors.white
                                              : Colors.grey,
                                          fontSize: 20,
                                          fontFamily: montserrat,
                                          fontWeight: FontWeight.w500)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedDay = Day.today;
                                    });
                                  },
                                  child: Text("Today",
                                      style: TextStyle(
                                          color: selectedDay == Day.today
                                              ? Colors.white
                                              : Colors.grey,
                                          fontSize: 20,
                                          fontFamily: montserrat,
                                          fontWeight: FontWeight.w500)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedDay = Day.tommorow;
                                    });
                                  },
                                  child: Text("Tomorrow",
                                      style: TextStyle(
                                          color: (selectedDay == Day.tommorow)
                                              ? Colors.white
                                              : Colors.grey,
                                          fontSize: 20,
                                          fontFamily: montserrat,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                WeatherCard(
                                  temp: "10",
                                  icon: CupertinoIcons.cloud_sun,
                                  time: '10:00',
                                ),
                                WeatherCard(
                                  temp: "10",
                                  icon: CupertinoIcons.cloud_sun,
                                  time: '10:00',
                                ),
                                WeatherCard(
                                  temp: "10",
                                  icon: CupertinoIcons.cloud_sun,
                                  time: '10:00',
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
