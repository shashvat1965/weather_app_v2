import 'dart:convert';
import 'package:weather_app_v2/Repo/Model/location.dart';
import 'package:http/http.dart' as http;
import '../Resources/constants.dart';

class CityNameViewModel {
  getCityNameFromLatLon(Location _location) async {
    Uri uri = Uri.parse(
        "http://api.openweathermap.org/geo/1.0/reverse?lat=${_location.lat.toString()}&lon=${_location.lon.toString()}&limit=1&appid=$apiKey");
    http.Response response = await http.get(uri);
    String data = response.body;
    var x = jsonDecode(data);
    String cityName = x[0]['name'];
    return cityName;
  }
}
