import 'dart:convert';
import 'package:mobile_app/contants/general_constans.dart';
import 'package:mobile_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = GeneralConstants.baseUrl;

  Future<UserModel> register(
      {String? name, String? username, String? email, String? password}) async {
    var url = Uri.parse("$baseUrl/register");
    var headers = {"Content-Type": "application/json"};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password
    });

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["data"];
      UserModel user = UserModel.fromJson(data["user"]);
      user.token = "Bearer " + data["access_token"];

      return user;
    } else {
      throw Exception("Gagal Register");
    }
  }

  Future<UserModel> login({String? email, String? password}) async {
    var url = Uri.parse("$baseUrl/login");
    var headers = {"Content-Type": "application/json"};
    var body = jsonEncode({'email': email, 'password': password});

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["data"];
      UserModel user = UserModel.fromJson(data["user"]);
      user.token = "Bearer " + data["access_token"];

      return user;
    } else {
      throw Exception("Gagal Login");
    }
  }
}
