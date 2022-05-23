import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/Resources/constants.dart';
import 'package:weather_app_v2/Resources/images.dart';

class WeatherDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                image: AssetImage(Images.thunder2),
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
              Container(
                child: const Text("10°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontFamily: montserrat,
                        fontWeight: FontWeight.w900)),
              ),
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
                children: const [
                  Text("Yesterday",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: montserrat,
                          fontWeight: FontWeight.w500)),
                  Text("Today",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: montserrat,
                          fontWeight: FontWeight.w500)),
                  Text("Tomorrow",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: montserrat,
                          fontWeight: FontWeight.w500))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [WeatherCard(), WeatherCard(), WeatherCard()],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ],
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
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: const Color(0xFF2e3341),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10),
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
    );
  }
}
