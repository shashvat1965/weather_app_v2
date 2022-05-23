import 'package:flutter/material.dart';
import 'package:weather_app_v2/weather_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(scaffoldBackgroundColor: Color(0xFF232535)),
      home: Scaffold(
        body: WeatherDisplay(),
      ),
    );
  }
}
