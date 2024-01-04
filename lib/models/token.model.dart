class TokenModel {
  String? message;
  String? token;

  TokenModel({this.message, this.token});

  TokenModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}
