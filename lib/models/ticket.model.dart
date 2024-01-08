class TicketModel {
  String? genre;
  String? origin;
  int? day;
  String? uid;
  String? mid;
  String? seats;
  String? sid;
  String? id;
  String? title;
  int? qty;
  String? price;

  TicketModel(
      {this.genre,
      this.origin,
      this.day,
      this.uid,
      this.mid,
      this.seats,
      this.sid,
      this.id,
      this.title,
      this.qty,
      this.price});

  TicketModel.fromJson(Map<String, dynamic> json) {
    genre = json['genre'];
    origin = json['origin'];
    day = json['day'];
    uid = json['uid'];
    mid = json['mid'];
    seats = json['seats'];
    sid = json['sid'];
    id = json['id'];
    title = json['title'];
    qty = json['qty'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['genre'] = genre;
    data['origin'] = origin;
    data['day'] = day;
    data['uid'] = uid;
    data['mid'] = mid;
    data['seats'] = seats;
    data['sid'] = sid;
    data['id'] = id;
    data['title'] = title;
    data['qty'] = qty;
    data['price'] = price;
    return data;
  }
}
