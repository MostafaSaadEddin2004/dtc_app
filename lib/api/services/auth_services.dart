import 'dart:convert';
import 'package:dtc_app/api/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthServices with BaseApi {
  static void postRegistration({
    required String arFirstName,
    required String arLastName,
    required String enFirstName,
    required String enLastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  }) async {
    // final token = await FirebaseMessaging.instance.getToken();
    final response =
        await BaseApi.postRequest(endpoint: 'auth/register', body: {
      'first_name_ar': arFirstName,
      'last_name_ar': arLastName,
      'first_name_en': enFirstName,
      'last_name_en': enLastName,
      'email': email,
      'password': password,
      'phone': phoneNumber,
      'role': role,
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      final String token = jsonDecode(response.body)['token'] as String;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('role', role);
    } else {
      throw Exception('${response.statusCode}  ${response.body}');
    }
  }

  static void postLogin({
    required String email,
    required String password,
    required String role,
  }) async {
    // final token = await FirebaseMessaging.instance.getToken();
    final response = await BaseApi.postRequest(endpoint: 'auth', body: {
      'email': email,
      'password': password,
      'role': role,
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      final String token = jsonDecode(response.body)['token'] as String;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('role', role);
    } else {
      throw Exception('${response.statusCode}  ${response.body}');
    }
  }

  static void postLogout() async {
    // final fcmToken = await FirebaseHelper.createToken();
    final prefs = await SharedPreferences.getInstance();
    final response = await BaseApi.postRequest(endpoint: 'auth/logout');
    if (response.statusCode >= 200 || response.statusCode < 300) {
      await prefs.remove('token');
      await prefs.remove('role');
      // FirebaseHelper.deleteToken();
    }
  }
}
