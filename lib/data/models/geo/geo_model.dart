import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_model.freezed.dart';
part 'geo_model.g.dart';

@freezed
class Geo with _$Geo {
  factory Geo({
    required String lat,
    required String lng
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) =>
      _$GeoFromJson(json);
}