import 'package:geolocator/geolocator.dart';
import 'package:weather_app_v2/Repo/Model/geolocator.dart';
import 'package:weather_app_v2/Repo/Model/location.dart';

class LocationViewModel {

  getCurrentLocation() async {
    Position position = await geolocator().determinePosition();
    Location location =
        Location(lat: position.latitude, lon: position.longitude);
    return location;
  }
}
