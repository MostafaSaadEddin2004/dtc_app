import 'dart:convert';
import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/registration_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RegistrationService extends BaseApi {
  static Future<RegistrationModel> postRegistration({
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
      'arFirstName': arFirstName,
      'arLastName': arLastName,
      'enFirstName': enFirstName,
      'enLastName': enLastName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'role': role,
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      final String token = jsonDecode(response.body)['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return RegistrationModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('${response.statusCode}  ${response.body}');
    }
  }
}
