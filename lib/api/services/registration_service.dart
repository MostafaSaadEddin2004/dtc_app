import 'dart:convert';

import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/registration_model.dart';
import 'package:http/http.dart';

abstract class RegistrationService extends BaseApi {
  static Future<RegistrationModel> postRegistration({
    required String arFirstName,
    required String arLastName,
    required String enFirstName,
    required String enLastName,
    required String email,
    required String password,
    required int phoneNumber,
    required String role,
  }) async {
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
    return RegistrationModel.fromJson(jsonDecode(response.body)['data']);
  }
}
