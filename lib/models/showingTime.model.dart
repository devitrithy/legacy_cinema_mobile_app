import 'dart:convert';

List<LocationModel> locationFromJson(String str) => List<LocationModel>.from(
    json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationToJson(List<LocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  Map<String, dynamic> toJson() => {
        "location_id": locationId,
        "location_name": locationName,
        "address": address,
        "picture": picture,
        "create_at": createAt!.toIso8601String(),
        "update_at": updateAt!.toIso8601String(),
        "map": map,
        "Halls": List<dynamic>.from(halls!.map((x) => x.toJson())),
      };
}

class Hall {
  String? hallId;
  String? hallName;
  String? locationId;
  DateTime? createAt;
  DateTime? updateAt;
  List<Showing>? showing;

  Hall({
    this.hallId,
    this.hallName,
    this.locationId,
    this.createAt,
    this.updateAt,
    this.showing,
  });

  factory Hall.fromJson(Map<String, dynamic> json) => Hall(
        hallId: json["hall_id"],
        hallName: json["hall_name"],
        locationId: json["location_id"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
        showing:
            List<Showing>.from(json["showing"].map((x) => Showing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hall_id": hallId,
        "hall_name": hallName,
        "location_id": locationId,
        "create_at": createAt!.toIso8601String(),
        "update_at": updateAt!.toIso8601String(),
        "showing": List<dynamic>.from(showing!.map((x) => x.toJson())),
      };
}

class Showing {
  String? showingId;
  DateTime? showingDate;
  String? movieId;
  String? hallId;
  String? price;
  DateTime? createAt;
  DateTime? updateAt;

  Showing({
    this.showingId,
    this.showingDate,
    this.movieId,
    this.hallId,
    this.price,
    this.createAt,
    this.updateAt,
  });

  factory Showing.fromJson(Map<String, dynamic> json) => Showing(
        showingId: json["showing_id"],
        showingDate: DateTime.parse(json["showing_date"]),
        movieId: json["movie_id"],
        hallId: json["hall_id"],
        price: json["price"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "showing_id": showingId,
        "showing_date": showingDate!.toIso8601String(),
        "movie_id": movieId,
        "hall_id": hallId,
        "price": price,
        "create_at": createAt!.toIso8601String(),
        "update_at": updateAt!.toIso8601String(),
      };
}
