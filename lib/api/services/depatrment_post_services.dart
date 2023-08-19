import 'dart:convert';
import 'package:dtc_app/api/models/post_model.dart';
import '../helper.dart';

abstract class DepartmentPostServices with BaseApi {
  static Future<List<PostModel>> getDepartmentPost(String? token) async {
    final body = await BaseApi.getRequest(
        endpoint: 'post?type=department', token: token);

    return (jsonDecode(body)["data"] as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
  }

  static Future<PostModel> postDepartmentPost(
      String? token, dynamic body) async {
    final response =
        await BaseApi.postRequest(endpoint: 'post?type=department', body: body);
    return jsonDecode(response);
  }

  static Future<PostModel> putDepartmentPost(
      {String? token, dynamic body, required int id}) async {
    final response = await BaseApi.putRequest(
        endpoint: 'post?type=department', id: id, body: body);
    return jsonDecode(response);
  }

  static Future<PostModel> deleteDepartmentPost({required int id}) async {
    final response =
        await BaseApi.deleteRequest(endpoint: 'post?type=department', id: id);
    return jsonDecode(response);
  }
}
