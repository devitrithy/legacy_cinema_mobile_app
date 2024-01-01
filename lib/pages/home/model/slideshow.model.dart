class SlideshowModel {
  List<Slideshows>? slideshows;

  SlideshowModel({this.slideshows});

  SlideshowModel.fromJson(Map<String, dynamic> json) {
    if (json['slideshows'] != null) {
      slideshows = <Slideshows>[];
      json['slideshows'].forEach((v) {
        slideshows!.add(Slideshows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (slideshows != null) {
      data['slideshows'] = slideshows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slideshows {
  String? id;
  String? title;
  String? description;
  String? poster;
  bool? active;
  int? order;
  String? createAt;
  String? updateAt;

  Slideshows(
      {this.id,
      this.title,
      this.description,
      this.poster,
      this.active,
      this.order,
      this.createAt,
      this.updateAt});

  Slideshows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    poster = json['poster'];
    active = json['active'];
    order = json['order'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['poster'] = poster;
    data['active'] = active;
    data['order'] = order;
    data['createAt'] = createAt;
    data['updateAt'] = updateAt;
    return data;
  }
}
