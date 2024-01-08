class SessionModel {
  String? url;
  String? session;

  SessionModel({this.url, this.session});

  SessionModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    session = json['session'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['url'] = url;
    data['session'] = session;
    return data;
  }
}
