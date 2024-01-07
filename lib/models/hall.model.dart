import 'package:legacy_cinema/models/showingTime.model.dart';

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
}
