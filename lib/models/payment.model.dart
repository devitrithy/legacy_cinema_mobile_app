class PaymentModel {
  String? sid;
  String? uid;
  bool? isBooking;
  List<ArrayDatas>? arrayDatas;

  PaymentModel({this.sid, this.uid, this.isBooking, this.arrayDatas});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
    uid = json['uid'];
    isBooking = json['isBooking'];
    if (json['arrayDatas'] != null) {
      arrayDatas = <ArrayDatas>[];
      json['arrayDatas'].forEach((v) {
        arrayDatas!.add(ArrayDatas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sid'] = sid;
    data['uid'] = uid;
    data['isBooking'] = isBooking;
    if (arrayDatas != null) {
      data['arrayDatas'] = arrayDatas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArrayDatas {
  String? seat;

  ArrayDatas({this.seat});

  ArrayDatas.fromJson(Map<String, dynamic> json) {
    seat = json['seat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['seat'] = seat;
    return data;
  }
}
