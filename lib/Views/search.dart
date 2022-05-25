import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/Views/weather_display.dart';

import '../Resources/constants.dart';

class Search extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.search),
          color: Colors.white,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    elevation: 10,
                    backgroundColor: const Color(0xFF232535),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 100,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextField(
                              controller: textEditingController,
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: montserrat),
                              decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF2e3341))),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF2e3341))),
                                  hintText: "Location",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[600],
                                    fontFamily: montserrat,
                                  )),
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return WeatherDisplay(fromSearchScreen: true, cityName: textEditingController.text,);
                                  }));
                                },
                                child: const Text(
                                  "Search",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: montserrat,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ],
    );
  }
}
