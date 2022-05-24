import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_v2/Resources/constants.dart';
part 'retrofit_geocoding.g.dart';


@RestApi(baseUrl: baseUrlReverseGeocoding)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/onecall?&appid=$apiKey&limit=1")
    Future<dynamic> getCityName(@Query("&lat") String lat, @Query("&lon") String lon)
