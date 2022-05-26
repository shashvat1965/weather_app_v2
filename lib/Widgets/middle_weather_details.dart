import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Resources/constants.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails(
      {Key? key,
      required this.weatherName,
      required this.temp,
      required this.imageUrl,
      required this.windSpeed,
      required this.humidity})
      : super(key: key);

  final String weatherName;
  final String temp;
  final String windSpeed;
  final String humidity;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: NetworkImage(imageUrl),
          color: Colors.white,
          height: 150,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(weatherName,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: montserrat,
                fontWeight: FontWeight.w700)),
        Text(temp,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 100,
                fontFamily: montserrat,
                fontWeight: FontWeight.w700)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  CupertinoIcons.wind,
                  color: Colors.white,
                  size: 20,
                ),
                Text(windSpeed,
                    style: const TextStyle(
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
              children: [
                const Icon(
                  CupertinoIcons.drop_fill,
                  color: Colors.white,
                  size: 20,
                ),
                Text(humidity,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: montserrat,
                        fontWeight: FontWeight.w500))
              ],
            )
          ],
        )
      ],
    );
  }
}
