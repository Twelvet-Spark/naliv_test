import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var URL_API = 'naliv.kz';

Future<List> fetchCategories() async {
  String? token = await getToken();
  if (token.isEmpty) {
    return [];
  }
  print("YES");
  var url = Uri.https(URL_API, 'api/category/get.php');
  var result = await http
      .post(url, headers: {"Content-Type": "application/json", "AUTH": token});
  print(result.body);
  List data = json.decode(utf8.decode(result.bodyBytes));
  // List data = json.decode(result.body);
  print(data);
  return data;
}

void setToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
}

Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("token") ?? "";
}

void clearToken() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("token");
}
