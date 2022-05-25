import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:weather_app_v2/Repo/Model/geolocator.dart';
import 'package:weather_app_v2/Repo/Model/location.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../Repo/Model/location2.dart';
import '../Repo/Retrofit/location2_retrofit.dart';
import '../Resources/constants.dart';

class LocationViewModel {

  getCurrentLocation() async {
    Position position = await geolocator().determinePosition();
    Location location =
        Location(lat: position.latitude, lon: position.longitude);
    return location;
  }

  getLatLonFromCityName(String? cityName) async {
    Location2 location;
    final dio = Dio();
    final client = RestClient(dio);
    location= await client.getCoordinates(cityName!);
  }

    getCityName(Location location) async {
      Uri uri = Uri.parse(
          "http://api.openweathermap.org/geo/1.0/reverse?lat=${location.lat.toString()}&lon=${location.lon.toString()}&limit=1&appid=$apiKey");
      http.Response response = await http.get(uri);
      String data = response.body;
      var x = jsonDecode(data);
      return x[0]['name'];
  }
}
