import 'dart:html';

import 'package:weather_app_v2/Repo/Retrofit/retrofit.dart';
import 'package:weather_app_v2/Repo/Model/location.dart';

import '../Repo/Model/weather_data.dart';
import 'package:dio/dio.dart';

class WeatherViewModel {



  Future<WeatherData> getWeatherData(Location location) async {
    final dio = Dio();
    final client = RestClient(dio);
    WeatherData weatherData;
    weatherData = await client.getWeather(location.lat.toString(), location.lon.toString());
    return weatherData;
  }
}
