import 'package:dtc_app/api/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

abstract class LogoutService with BaseApi {
  static Future<void> postLogout() async {
    // final fcmToken = await FirebaseHelper.createToken();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await BaseApi.postRequest(endpoint: 'auth/logout');
    if (response.statusCode >= 200 || response.statusCode < 300) {
      await prefs.remove('token');
      // FirebaseHelper.deleteToken();
    }
  }
}
