import 'dart:convert';
import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/registration_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_model.dart';

abstract class LoginService extends BaseApi {
  static Future<LoginModel> postRegistration({
    required String email,
    required String password,
    required String role,
  }) async {
    // final token = await FirebaseMessaging.instance.getToken();
    final response =
        await BaseApi.postRequest(endpoint: 'auth', body: {
      'email': email,
      'password': password,
      'role': role,
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      final String token = jsonDecode(response.body)['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return LoginModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('${response.statusCode}  ${response.body}');
    }
  }
}
