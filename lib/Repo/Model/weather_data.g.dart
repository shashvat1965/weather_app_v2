// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
  temp: (json['current']['temp'].toInt()-273).toString() ,
  humidity: json['current']['humidity'].toString(),
  windSpeed: json['current']['wind_speed'].toString(),
);

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
    };