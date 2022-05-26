import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_v2/Repo/Model/weather_data.dart';
import 'package:weather_app_v2/Resources/constants.dart';
part 'retrofit.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/onecall?&appid=$apiKey")
  Future<WeatherData> getWeather(
      @Query("&lat") String lat, @Query("&lon") String lon);
}

