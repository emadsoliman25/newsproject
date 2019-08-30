import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationApi {
  Future<bool> login(String email, String password) async {
    String authApi = baseApi + authenticationApi;
    Map<String, String> body = {
      "email": email,
      "password": password,
    };
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
    };
    var response = await http.post(authApi, headers: headers, body: body);
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data'];
        var token = data['token'];
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", token);
        return true;
      }
    } catch (Exception) {
      return false;
    }
    return false;
  }
}
