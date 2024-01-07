import 'dart:convert';

import 'package:legacy_cinema/models/hall.model.dart';

List<LocationModel> locationFromJson(String str) => List<LocationModel>.from(
    json.decode(str).map((x) => LocationModel.fromJson(x)));

class LocationModel {
  String? locationId;
  String? locationName;
  String? address;
  String? picture;
  DateTime? createAt;
  DateTime? updateAt;
  String? map;
  List<Hall>? halls;

  LocationModel({
    this.locationId,
    this.locationName,
    this.address,
    this.picture,
    this.createAt,
    this.updateAt,
    this.map,
    this.halls,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        locationId: json["location_id"],
        locationName: json["location_name"],
        address: json["address"],
        picture: json["picture"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
        map: json["map"],
        halls: List<Hall>.from(json["Halls"].map((x) => Hall.fromJson(x))),
      );
}
