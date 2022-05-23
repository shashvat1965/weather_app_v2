import 'package:flutter/material.dart';

import '../Resources/constants.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
    required this.time,
    required this.icon,
    required this.temp,
  }) : super(key: key);

  final String time;
  final String temp;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: const Color(0xFF2e3341),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(time,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: montserrat,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(temp,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: montserrat,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
        ),
      ),
    );
  }
}