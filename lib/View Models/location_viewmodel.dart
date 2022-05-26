import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_v2/Repo/Model/geolocator.dart';
import 'package:weather_app_v2/Repo/Model/site.dart';
import 'package:http/http.dart' as http;
import '../Repo/Retrofit/site_retrofit.dart';
import '../Resources/constants.dart';
import 'package:dio/dio.dart';

class LocationViewModel {
  getCurrentLocation() async {
    Position position = await geolocator().determinePosition();
    Site site =
        Site(lat: position.latitude, lon: position.longitude);
    return site;
  }

  getCityName(Site site) async {
    Uri uri = Uri.parse(
        "http://api.openweathermap.org/geo/1.0/reverse?lat=${site.lat.toString()}&lon=${site.lon.toString()}&limit=1&appid=$apiKey");
    http.Response response = await http.get(uri);
    String data = response.body;
    var x = jsonDecode(data);
    return x[0]['name'];
  }

  getLatLonFromCityName(String? cityName) async {
    final dio = Dio();
    final client = RestClient(dio);
    Site site = await client.getCityName(cityName!);
    return site;
  }

}
