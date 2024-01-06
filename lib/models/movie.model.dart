class MovieModel {
  String? movieId;
  String? title;
  String? description;
  String? time;
  String? poster;
  String? trailer;
  String? genre;
  DateTime? releaseDate;
  String? importCost;
  DateTime? createAt;
  DateTime? updateAt;
  String? priceId;

  MovieModel(
      {this.movieId,
      this.title,
      this.description,
      this.time,
      this.poster,
      this.trailer,
      this.genre,
      this.releaseDate,
      this.importCost,
      this.createAt,
      this.updateAt,
      this.priceId});

  MovieModel.fromJson(Map<String, dynamic> json) {
    movieId = json['movie_id'];
    title = json['title'];
    description = json['description'];
    time = json['time'];
    poster = json['poster'];
    trailer = json['trailer'];
    genre = json['genre'];
    releaseDate = DateTime.parse(json['releaseDate']);
    importCost = json['import_cost'];
    createAt = DateTime.parse(json['create_at']);
    updateAt = DateTime.parse(json['update_at']);
    priceId = json['price_id'];
  }
}
