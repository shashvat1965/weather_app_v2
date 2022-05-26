import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../Resources/constants.dart';
import '../Model/site.dart';
part 'site_retrofit.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/weather?appid=$apiKey')
  Future<Site> getCityName(@Query('&q') String cityName);

}