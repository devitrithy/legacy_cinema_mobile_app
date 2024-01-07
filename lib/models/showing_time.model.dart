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
}
