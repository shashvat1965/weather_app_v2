import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_v2/Repo/Model/location.dart';
import 'package:weather_app_v2/Repo/Model/weather_data.dart';
import 'package:weather_app_v2/Resources/constants.dart';
part 'location_retrofit.g.dart';

@RestApi(baseUrl: geocodingBaseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/direct?limit=1&appid=$apiKey")
  Future<Location> getCoordinates(
      @Query("&q") String cityName);
}

