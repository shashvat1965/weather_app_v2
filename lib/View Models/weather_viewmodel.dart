import 'package:weather_app_v2/Repo/Retrofit/retrofit.dart';
import 'package:weather_app_v2/Repo/Model/location.dart';

import '../Repo/Model/weather_data.dart';
import 'package:dio/dio.dart';

class WeatherViewModel {

  WeatherViewModel({required this.location});
  Location location;


  Future<WeatherData> getWeatherData() async {
    final dio = Dio();
    final client = RestClient(dio);
    WeatherData weatherData;
    weatherData = await client.getWeather(location.lat.toString(), location.lon.toString());
    return weatherData;
  }
}
