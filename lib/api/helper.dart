import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseApi {
  static const _url = 'http://localhost:8000/api/';

  static Future<String> getRequest({required String endpoint}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    http.Response response =
        await http.get(Uri.parse(_url + endpoint), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    return response.body;
  }

  static Future<http.Response> postRequest(
      {required String endpoint, Map? body}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // body =
    //     body?.map((key, value) => MapEntry(key.toString(), value.toString()));
    final response = await http
        .post(Uri.parse(_url + endpoint), body: jsonEncode(body), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      print(response.body);
      return response;
    }
    // else {
    throw Exception(
        'There is a problem with the status code ${response.statusCode} and with the body ${response.body}');
    // }
  }

  static Future<http.Response> putRequest(
      {required String endpoint, required dynamic body, int? id}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http
        .put(Uri.parse('${_url + endpoint}/$id'), body: body, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      print(response.body);
      return response;
    }
    // else {
    throw Exception(
        'There is a problem with the status code ${response.statusCode} and with the body ${response.body}');
    // }
  }

  static Future<http.Response> deleteRequest(
      {required String endpoint, int? id}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response =
        await http.delete(Uri.parse('$_url$endpoint/$id'), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      return response;
    }
    // else {
    throw Exception(
        'There is a problem with the status code ${response.statusCode} and with the body ${response.body}');
    // }
  }
}
