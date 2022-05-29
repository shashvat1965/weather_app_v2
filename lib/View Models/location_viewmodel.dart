import 'package:geolocator/geolocator.dart';
import 'package:weather_app_v2/Repo/Model/city_name.dart';
import 'package:weather_app_v2/Repo/Model/geolocator.dart';
import 'package:weather_app_v2/Repo/Model/site.dart';
import '../Repo/Retrofit/site_retrofit.dart' as site_retrofit;
import 'package:dio/dio.dart';
import '../Repo/Retrofit/city_name_retrofit.dart';

class LocationViewModel {
  getCurrentLocation() async {
    Position position = await geolocator().determinePosition();
    Site site = Site(lat: position.latitude, lon: position.longitude);
    return site;
  }

  getCityName(Site site) async {
    final dio = Dio();
    final client = RestClient(dio);
    CityName cityName;
    cityName =
        await client.getCityName(site.lat.toString(), site.lon.toString());
    return cityName.cityName;
  }

  getLatLonFromCityName(String? cityName) async {
    final dio = Dio();
    final client = site_retrofit.RestClient(dio);
    Site site = await client.getCoordinates(cityName!);
    return site;
  }
}
