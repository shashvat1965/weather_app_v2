// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Site _$SiteFromJson(Map<String, dynamic> json) => Site(
      lat: json['coord']['lat'],
      lon: json['coord']['lon'],
    );

Map<String, dynamic> _$SiteToJson(Site instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
