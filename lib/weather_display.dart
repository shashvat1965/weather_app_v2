import 'package:flutter/cupertino.dart';
import 'package:weather_app_v2/Resources/images.dart';

class WeatherDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
            style: TextStyle(fontSize: 40),
          ),
          Center(
            child: Image.network("https://picsum.photos/200/300")
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [Text("test text"), Text("test text")],
              ),
              Column(
                children: [const Text("test text"), const Text("test text")],
              ),
            ],
          )
        ],
      ),
    );
  }
}
