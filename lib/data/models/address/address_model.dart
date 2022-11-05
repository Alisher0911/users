import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makit/data/models/geo/geo_model.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    required String? street,
    required String suite,
    required String city,
    required String zipcode,
    required Geo geo
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}