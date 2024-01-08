class ShowingTimeTicketModel {
  String? showingId;
  String? showingDate;
  String? movieId;
  String? hallId;
  String? price;
  String? createAt;
  String? updateAt;
  Movie? movie;
  Hall? hall;

  ShowingTimeTicketModel(
      {this.showingId,
      this.showingDate,
      this.movieId,
      this.hallId,
      this.price,
      this.createAt,
      this.updateAt,
      this.movie,
      this.hall});

  ShowingTimeTicketModel.fromJson(Map<String, dynamic> json) {
    showingId = json['showing_id'];
    showingDate = json['showing_date'];
    movieId = json['movie_id'];
    hallId = json['hall_id'];
    price = json['price'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    movie = json['movie'] != null ? Movie.fromJson(json['movie']) : null;
    hall = json['hall'] != null ? Hall.fromJson(json['hall']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['showing_id'] = showingId;
    data['showing_date'] = showingDate;
    data['movie_id'] = movieId;
    data['hall_id'] = hallId;
    data['price'] = price;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    if (movie != null) {
      data['movie'] = movie!.toJson();
    }
    if (hall != null) {
      data['hall'] = hall!.toJson();
    }
    return data;
  }
}

class Movie {
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

  Movie(
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

  Movie.fromJson(Map<String, dynamic> json) {
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

class Hall {
  String? hallId;
  String? hallName;
  String? locationId;
  String? createAt;
  String? updateAt;
  Location? location;

  Hall(
      {this.hallId,
      this.hallName,
      this.locationId,
      this.createAt,
      this.updateAt,
      this.location});

  Hall.fromJson(Map<String, dynamic> json) {
    hallId = json['hall_id'];
    hallName = json['hall_name'];
    locationId = json['location_id'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['hall_id'] = hallId;
    data['hall_name'] = hallName;
    data['location_id'] = locationId;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Location {
  String? locationId;
  String? locationName;
  String? address;
  String? picture;
  String? createAt;
  String? updateAt;
  String? map;

  Location(
      {this.locationId,
      this.locationName,
      this.address,
      this.picture,
      this.createAt,
      this.updateAt,
      this.map});

  Location.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    locationName = json['location_name'];
    address = json['address'];
    picture = json['picture'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    map = json['map'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['location_id'] = locationId;
    data['location_name'] = locationName;
    data['address'] = address;
    data['picture'] = picture;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    data['map'] = map;
    return data;
  }
}
