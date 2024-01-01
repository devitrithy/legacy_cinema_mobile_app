class UserInfoModel {
  String? id;
  String? firstname;
  String? lastname;
  String? username;
  String? password;
  String? profilePicture;
  String? email;

  UserInfoModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.username,
      this.password,
      this.profilePicture,
      this.email});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    password = json['password'];
    profilePicture = json['profile_picture'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['username'] = username;
    data['password'] = password;
    data['profile_picture'] = profilePicture;
    data['email'] = email;
    return data;
  }
}
