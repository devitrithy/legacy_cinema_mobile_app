class UserJwtModel {
  String? userId;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  String? profile;

  UserJwtModel(
      {this.userId,
      this.username,
      this.firstname,
      this.lastname,
      this.email,
      this.profile});

  UserJwtModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user_id'] = userId;
    data['username'] = username;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['profile'] = profile;
    return data;
  }
}
