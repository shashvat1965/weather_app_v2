import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_v2/Resources/constants.dart';

import '../Model/location2.dart';
part 'location2_retrofit.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/direct?limit=1&appid=$apiKey")
  Future<Location2> getCoordinates(@Query('&q') String cityName);
}
