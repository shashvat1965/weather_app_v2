import 'package:json_annotation/json_annotation.dart';
part 'location2.g.dart';


@JsonSerializable()
class Location2 {
  double lat;
  double lon;

  Location2({required this.lat, required this.lon});

  factory Location2.fromJson(Map<String, dynamic> json) =>
      _$Location2FromJson(json);
  Map<String, dynamic> toJson() => _$Location2ToJson(this);
}
