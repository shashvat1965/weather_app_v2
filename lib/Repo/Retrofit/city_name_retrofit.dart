import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_v2/Repo/Model/city_name.dart';
import '../../Resources/constants.dart';
part 'city_name_retrofit.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/weather?appid=$apiKey')
  Future<CityName> getCityName(@Query('&lat') String lat, @Query('&lon') String lon);
}