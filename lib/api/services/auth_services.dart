// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:dtc_app/api/firebase_helper.dart';
import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/auth_models.dart';

abstract class AuthServices with BaseApi {
  static Future<String?> postRegistration({
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
      'image': image,
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
      return null;
    } else {
      return jsonDecode(response.body)['errors']['email'][0];
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

  static Future<String?> postEditProfile(
      {String? email,
      String? phone,
      String? address,
      String? current_password,
      String? new_password,
      String? new_password_confirmation}) async {
    final response = await BaseApi.postRequest(endpoint: 'auth/profile', body: {
      'email': email,
      'phone': phone,
      'address': address,
      'current_password': current_password,
      'new_password': new_password,
      'new_password_confirmation': new_password_confirmation,
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return 'Password changed successfully';
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  static Future<RegistrationInformationModel> getUserInformation() async {
    final response = await BaseApi.getRequest(endpoint: 'auth/profile');
    print(response);
    return RegistrationInformationModel.fromJson(jsonDecode(response)['data']);
  }

  static Future<Role> getUserRole() async {
    final response = await BaseApi.getRequest(endpoint: 'auth/role');
    final role = Role.fromJson(response);
    return role;
  }
}

class Role {
  final String name;
  final bool isRegistrationFinished;

  Role({required this.name, required this.isRegistrationFinished});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'isRegistrationFinished': isRegistrationFinished,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      name: map['role'] as String,
      isRegistrationFinished: map['is_registration_finished'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) =>
      Role.fromMap(json.decode(source) as Map<String, dynamic>);
}
