import 'package:json_annotation/json_annotation.dart';
part 'site.g.dart';

@JsonSerializable()
class Site {
  Site({required this.lat, required this.lon});
  double lat;
  double lon;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
  Map<String, dynamic> toJson() => _$SiteToJson(this);
}
