// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      temp: (json['current']['temp'].toInt() - 273).toString(),
      humidity: json['current']['humidity'].toString(),
      windSpeed: json['current']['wind_speed'].toString(),
      hour1: json['hourly'][1]['dt'].toString(),
      hour2: json['hourly'][7]['dt'].toString(),
      hour3: json['hourly'][14]['dt'].toString(),
      temp_hour1: (json['hourly'][1]['temp'].toInt() - 273).toString(),
      temp_hour2: (json['hourly'][7]['temp'].toInt() - 273).toString(),
      temp_hour3: (json['hourly'][14]['temp'].toInt() - 273).toString(),
      condition: json['current']['weather'][0]['main'].toString(),
      icon: json['current']['weather'][0]['icon'].toString(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'hour1': instance.hour1,
      'hour2': instance.hour2,
      'hour3': instance.hour3,
      'temp_hour1': instance.temp_hour1,
      'temp_hour2': instance.temp_hour2,
      'temp_hour3': instance.temp_hour3,
      'condition': instance.condition,
      'icon': instance.icon,
    };
