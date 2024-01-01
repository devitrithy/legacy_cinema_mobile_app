class UserModel {
  String? username;
  String? password;

  UserModel({this.username, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
