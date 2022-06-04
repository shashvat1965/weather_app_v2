import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Resources/constants.dart';

class CityTag extends StatelessWidget {
  const CityTag({Key? key, required this.cityName, required this.refreshIndicatorKey}) : super(key: key);
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
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
                TextButton(
                  child: Text(cityName!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: montserrat,
                          fontWeight: FontWeight.w700,
                          fontSize: 25)),
                  onPressed: () {
                    refreshIndicatorKey.currentState?.show();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
