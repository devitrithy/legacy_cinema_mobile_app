import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class PublicUsed {
  static const local = "http://26.204.37.36:3000";
  static const localNetwork = "http://192.168.0.114:3000";
  static const global = "https://cinemaapi.serveo.net";
  static const ngrokGlobal = "https://6bb2-175-100-56-227.ngrok-free.app";
  static const apiEndPoint = localNetwork;

  static final storage = GetStorage();
  static const token = "c56509ca-a859-41ed-8d37-82765233a875";

  static String changeTheme() {
    return storage.read("darkMode") == "dark" ? "light" : "dark";
  }

  static String changeLanguage() {
    return storage.read("lang") == "kh" ? "en" : "kh";
  }

  static bool isDark() {
    return storage.read('darkMode') == "dark" ? true : false;
  }

  static bool isKhmer() {
    return storage.read('lang') == "kh" ? true : false;
  }

  static bool checkToken() {
    return storage.read(token) != null ? true : false;
  }

  static String? getToken() {
    return storage.read(token);
  }

  static String getUserId() {
    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(getToken().toString());
    return decodedToken['user_id'];
  }

  static Map<String, dynamic> getUser() {
    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(getToken().toString());
    return decodedToken;
  }
}
