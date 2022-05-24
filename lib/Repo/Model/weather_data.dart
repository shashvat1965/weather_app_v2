import 'package:json_annotation/json_annotation.dart';
part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData{
  String temp;
  String humidity;
  String windSpeed;


  WeatherData({required this.temp, required this.humidity, required this.windSpeed});
  factory WeatherData.fromJson(Map<String, dynamic> json){
   return  _$WeatherDataFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$WeatherDataToJson(this);
  }
}
