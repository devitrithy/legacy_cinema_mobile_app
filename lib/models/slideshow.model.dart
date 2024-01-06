class SlideshowModel {
  String? id;
  String? title;
  String? description;
  String? poster;
  bool? active;
  int? order;
  DateTime? createAt;
  DateTime? updateAt;

  SlideshowModel(
      {this.id,
      this.title,
      this.description,
      this.poster,
      this.active,
      this.order,
      this.createAt,
      this.updateAt});

  SlideshowModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    poster = json['poster'];
    active = json['active'];
    order = json['order'];
    createAt = DateTime.parse(json["createAt"]);
    updateAt = DateTime.parse(json["updateAt"]);
  }
}
