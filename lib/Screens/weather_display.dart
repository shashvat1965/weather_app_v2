import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/Resources/constants.dart';

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
              Column(
                children: [
                  const Image(
                    image: AssetImage(thunder),
                    height: 150,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Cloudy",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: montserrat,
                          fontWeight: FontWeight.w700)),
                  const Text("10°",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontFamily: montserrat,
                          fontWeight: FontWeight.w700)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            CupertinoIcons.wind,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(" 8 km/h",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: montserrat,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: const [
                          Icon(
                            CupertinoIcons.drop_fill,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text("47%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: montserrat,
                                  fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  )
                ],
              ),
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
                      WeatherCard(),
                      WeatherCard(),
                      WeatherCard()
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

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: const Color(0xFF2e3341),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("10:00 AM",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: montserrat,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Icon(
                color: Colors.white,
                CupertinoIcons.cloud_sun,
                size: 40,
              ),
              SizedBox(
                height: 5,
              ),
              Text("10°",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: montserrat,
                      fontWeight: FontWeight.w700))
            ],
          ),
        ),
      ),
    );
  }
}
