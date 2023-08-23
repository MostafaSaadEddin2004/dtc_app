import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class BaseApi {
  static const _url = 'http://localhost:8000/api/';

  static Future<String> getRequest(
      {required String endpoint, String? token}) async {
    http.Response response =
        await http.get(Uri.parse(_url + endpoint), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer 1|eggNXmXHjk7Be60IlXurReiNBVPOg36X98vIptCt',
    });

    return response.body;
  }

  static Future<http.Response> postRequest(
      {required String endpoint, required dynamic body, String? token}) async {
    final response =
        await http.post(Uri.parse(_url + endpoint), body: body, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer 1|eggNXmXHjk7Be60IlXurReiNBVPOg36X98vIptCt',
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

  static Future<http.Response?> putRequest(
      {required String endpoint,
      required dynamic body,
      String? token,
      int? id}) async {
    http.Response response =
        await http.put(Uri.parse('{$_url$endpoint}/$id'), body: body, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer 1|eggNXmXHjk7Be60IlXurReiNBVPOg36X98vIptCt',
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      print(response.body);
      return response;
    }
    // else {
    //   throw Exception(
    //       'There is a problem with the status code ${response.statusCode} and with the body ${response.body}');
    // }
  }

  static Future<dynamic> deleteRequest(
      {required String endpoint, String? token, int? id}) async {
    http.Response response =
        await http.delete(Uri.parse('{$_url$endpoint}/$id'), headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer 1|eggNXmXHjk7Be60IlXurReiNBVPOg36X98vIptCt',
    });
    if (response.statusCode >= 200 || response.statusCode < 300) {
      print(response.body);
      return response.body;
    }
    // else {
    //   throw Exception(
    //       'There is a problem with the status code ${response.statusCode} and with the body ${response.body}');
    // }
  }
}
