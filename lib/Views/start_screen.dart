import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/Resources/constants.dart';
import 'package:weather_app_v2/Views/weather_display.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: montserrat,
        ),
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          onFinished: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WeatherDisplay(fromSearchScreen: false);
            }));
          },
          animatedTexts: [
            TypewriterAnimatedText("Weather App",
                speed: const Duration(milliseconds: 50), cursor: ""),
            TypewriterAnimatedText("By Shashvat Singh",
                speed: const Duration(milliseconds: 50), cursor: ""),
          ],
        ),
      ),
    ));
  }
}
