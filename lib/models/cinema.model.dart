class CinemaModel {
  String? locationId;
  String? locationName;
  String? address;
  String? picture;
  String? createAt;
  String? updateAt;
  String? map;

  CinemaModel(
      {this.locationId,
      this.locationName,
      this.address,
      this.picture,
      this.createAt,
      this.updateAt,
      this.map});

  CinemaModel.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    locationName = json['location_name'];
    address = json['address'];
    picture = json['picture'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    map = json['map'];
  }
}
