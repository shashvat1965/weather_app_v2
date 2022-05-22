import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [Text("test text"), Text("test text")],
                ),
                const Icon(CupertinoIcons.search)
              ],
            ),
            const Text(
              "test temp",
              style: const TextStyle(fontSize: 40),
            ),
            const Expanded(
              child: Center(
                child: Text("placeholder text"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [Text("test text"), Text("test text")],
                ),
                Column(
                  children: [Text("test text"), Text("test text")],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
