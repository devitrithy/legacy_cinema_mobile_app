class HistoryTicketModel {
  String? ticketId;
  String? showingId;
  String? userId;
  String? createAt;
  String? updateAt;
  bool? isBooking;
  bool? isRecived;
  Showingtime? showingtime;
  List<TicketDetails>? ticketDetails;

  HistoryTicketModel(
      {this.ticketId,
      this.showingId,
      this.userId,
      this.createAt,
      this.updateAt,
      this.isBooking,
      this.isRecived,
      this.showingtime,
      this.ticketDetails});

  HistoryTicketModel.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    showingId = json['showing_id'];
    userId = json['user_id'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    isBooking = json['isBooking'];
    isRecived = json['isRecived'];
    showingtime = json['Showingtime'] != null
        ? Showingtime.fromJson(json['Showingtime'])
        : null;
    if (json['TicketDetails'] != null) {
      ticketDetails = <TicketDetails>[];
      json['TicketDetails'].forEach((v) {
        ticketDetails!.add(TicketDetails.fromJson(v));
      });
    }
  }
}

class Showingtime {
  String? showingId;
  String? showingDate;
  String? movieId;
  String? hallId;
  String? price;
  String? createAt;
  String? updateAt;
  Movie? movie;
  Hall? hall;

  Showingtime(
      {this.showingId,
      this.showingDate,
      this.movieId,
      this.hallId,
      this.price,
      this.createAt,
      this.updateAt,
      this.movie,
      this.hall});

  Showingtime.fromJson(Map<String, dynamic> json) {
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
}

class TicketDetails {
  String? ticketDetailId;
  String? ticketId;
  String? seat;
  bool? isBooking;
  bool? isRecived;

  TicketDetails(
      {this.ticketDetailId,
      this.ticketId,
      this.seat,
      this.isBooking,
      this.isRecived});

  TicketDetails.fromJson(Map<String, dynamic> json) {
    ticketDetailId = json['ticket_detail_id'];
    ticketId = json['ticket_id'];
    seat = json['seat'];
    isBooking = json['isBooking'];
    isRecived = json['isRecived'];
  }
}
