import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/Resources/constants.dart';

import '../Widgets/middle_weather_details.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData()
          .copyWith(scaffoldBackgroundColor: const Color(0xFF232535)),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "City Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: montserrat,
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                          )
                        ],
                      ),
                      const Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
              const WeatherDetails(weatherName: "Cloudy", temp: "10", image: thunder, windSpeed: "8 km/h", humidity: "47%"),
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
                      WeatherCard(temp: "10", icon: CupertinoIcons.cloud_sun, time: '10:00',),
                      WeatherCard(temp: "10", icon: CupertinoIcons.cloud_sun, time: '10:00',),
                      WeatherCard(temp: "10", icon: CupertinoIcons.cloud_sun, time: '10:00',)
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




