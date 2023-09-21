import 'dart:convert';
import 'dart:io';
import 'package:dtc_app/api/firebase_helper.dart';
import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/auth_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthServices with BaseApi {
  static String? responseMessage;
  static void postRegistration({
    required String arFirstName,
    required String arLastName,
    required String enFirstName,
    required String enLastName,
    required String email,
    required String password,
    required String phoneNumber,
    required File image,
    required String role,
  }) async {
    final ftoken = await FirebaseHelper.createToken();
    final response =
        await BaseApi.postWithFiles(endpoint: 'auth/register', files: {
      'image,': image,
    }, body: {
      'first_name_ar': arFirstName,
      'last_name_ar': arLastName,
      'first_name_en': enFirstName,
      'last_name_en': enLastName,
      'email': email,
      'password': password,
      'phone': phoneNumber,
      'role': role,
      'fcm_token': ftoken
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

  static Future<String?> postLogin({
    required String email,
    required String password,
    required String role,
  }) async {
    final ftoken = await FirebaseHelper.createToken();
    final response = await BaseApi.postRequest(endpoint: 'auth', body: {
      'email': email,
      'password': password,
      'role': role,
      'fcm_token': ftoken,
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      responseMessage = jsonDecode(response.body)['errors'];
      final String token = jsonDecode(response.body)['token'] as String;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('role', role);
      return null;
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  static void postLogout() async {
    final ftoken = await FirebaseHelper.createToken();
    final prefs = await SharedPreferences.getInstance();
    final response = await BaseApi.postRequest(endpoint: 'auth/logout', body: {
      'fcm_token': ftoken,
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      await prefs.remove('token');
      await prefs.remove('role');
      FirebaseHelper.deleteToken();
    }
  }

  static void postChangePassword(
      {String? email,
      String? phone,
      String? address,
      String? current_password,
      String? new_password}) {
    // ignore: unused_local_variable
    final response = BaseApi.postRequest(endpoint: 'auth/profile', body: {
      'email': email,
      'phone': phone,
      'address': address,
      'current_password': current_password,
      'new_password': new_password,
    });
  }

  static Future<RegistrationInformationModel> getUserInformation() async {
    final response = await BaseApi.getRequest(endpoint: 'auth/profile');
    print(response);
    return RegistrationInformationModel.fromJson(jsonDecode(response)['data']);
  }

  static Future<List<RoleModel>> getUserRole() async {
    final response = await BaseApi.getRequest(endpoint: 'auth/role');

    return (jsonDecode(response)['data'] as List)
        .map((json) => RoleModel.fromJson(json))
        .toList();
  }
}
