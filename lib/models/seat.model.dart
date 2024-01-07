class SeatModel {
  int? id;
  int? row;
  int? number;
  bool? selected;
  String? seatNumber;

  SeatModel({this.id, this.row, this.number, this.selected, this.seatNumber});

  SeatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    row = json['row'];
    number = json['number'];
    selected = bool.parse(json['selected']);
    seatNumber = json['seatNumber'];
  }
}
