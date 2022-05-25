import 'dart:io';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_v2/Resources/constants.dart';

import '../Model/location2.dart';
part 'location2_retrofit.g.dart';

@RestApi(baseUrl: geocodingBaseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/direct?limit=10&appid=$apiKey")
  Future<Location2> getCoordinates(@Query('&q') String cityName);
}
