import 'package:json_annotation/json_annotation.dart';
part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  String temp;
  String humidity;
  String windSpeed;
  String hour1;
  String hour2;
  String hour3;
  String temp_hour1;
  String temp_hour2;
  String temp_hour3;

  WeatherData(
      {required this.temp,
      required this.humidity,
      required this.windSpeed,
      required this.hour1,
      required this.hour2,
      required this.hour3,
      required this.temp_hour1,
      required this.temp_hour2,
      required this.temp_hour3});
  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
