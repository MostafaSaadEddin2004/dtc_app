import 'dart:convert';

import 'package:dtc_app/api/firebase_helper.dart';
import 'package:dtc_app/api/helper.dart';

abstract class ForgetPasswordService with BaseApi {
  static void postEmail({required String email}) async {
    // ignore: unused_local_variable
    final response = await BaseApi.postRequest(
        endpoint: 'auth/tokenForResetPassword', body: {'email': email});
  }

  static Future<String?> postToken(
      {required String email, required String token}) async {
    final fcm_token = await FirebaseHelper.createToken();
    // ignore: unused_local_variable
    final response = await BaseApi.postRequest(
        endpoint: 'auth/checkForgetPassword',
        body: {'email': email, 'token': token, 'fcm_token': fcm_token});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return null;
    } else {
      return jsonDecode(response.body)['message'];
    }
  }
}
