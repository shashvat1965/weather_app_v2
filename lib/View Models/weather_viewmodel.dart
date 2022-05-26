import 'dart:html';

import 'package:weather_app_v2/Repo/Retrofit/retrofit.dart';
import 'package:weather_app_v2/Repo/Model/site.dart';

import '../Repo/Model/weather_data.dart';
import 'package:dio/dio.dart';

class WeatherViewModel {
  Future<WeatherData> getWeatherData(Site site) async {
    final dio = Dio();
    final client = RestClient(dio);
    WeatherData weatherData;
    weatherData =
        await client.getWeather(site.lat.toString(), site.lon.toString());
    return weatherData;
  }
}
