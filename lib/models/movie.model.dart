class MovieModel {
  List<Movies>? movies;

  MovieModel({this.movies});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (movies != null) {
      data['movies'] = movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  String? movieId;
  String? title;
  String? description;
  String? time;
  String? poster;
  String? trailer;
  String? genre;
  String? releaseDate;
  String? importCost;
  String? createAt;
  String? updateAt;
  String? priceId;

  Movies(
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

  Movies.fromJson(Map<String, dynamic> json) {
    movieId = json['movie_id'];
    title = json['title'];
    description = json['description'];
    time = json['time'];
    poster = json['poster'];
    trailer = json['trailer'];
    genre = json['genre'];
    releaseDate = json['releaseDate'];
    importCost = json['import_cost'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    priceId = json['price_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['movie_id'] = movieId;
    data['title'] = title;
    data['description'] = description;
    data['time'] = time;
    data['poster'] = poster;
    data['trailer'] = trailer;
    data['genre'] = genre;
    data['releaseDate'] = releaseDate;
    data['import_cost'] = importCost;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    data['price_id'] = priceId;
    return data;
  }
}
