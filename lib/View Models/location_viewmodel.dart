import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_v2/Repo/Model/geolocator.dart';
import 'package:weather_app_v2/Repo/Model/location.dart';

import '../Repo/Retrofit/location_retrofit.dart';

class LocationViewModel {

  getCurrentLocation() async {
    Position position = await geolocator().determinePosition();
    Location location =
        Location(lat: position.latitude, lon: position.longitude);
    return location;
  }

  getLatLonFromCityName(String? cityName) async {
    Location location;
    final dio = Dio();
    final client = RestClient(dio);
    location= await client.getCoordinates(cityName!);
  }
}
