import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/Widgets/search.dart';

import '../Resources/constants.dart';

class NameAndSearch extends StatelessWidget {
  const NameAndSearch({Key? key, required this.cityName}) : super(key: key);

  final String? cityName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  CupertinoIcons.location_solid,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  cityName!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: montserrat,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


