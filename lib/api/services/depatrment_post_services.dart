import 'dart:convert';
import 'dart:io';
import 'package:dtc_app/api/models/post_model.dart';
import '../helper.dart';

abstract class DepartmentPostServices with BaseApi {
  static Future<List<PostModel>> getDepartmentPost() async {
    final body = await BaseApi.getRequest(endpoint: 'post?type=department');

    return (jsonDecode(body)["data"] as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
  }

  static void postDepartmentPost(
      {required String content, required File attachment}) async {
    final response = await BaseApi.postWithFiles(endpoint: 'post', files: {
      'attachment': attachment,
    }, body: {
      'content': content,
    });
    print('${jsonDecode(response.body)} ${response.statusCode}');
  }

  static Future<PostModel> putDepartmentPost({
    String? token,
    String? content,
    String? attachment,
    required int id,
  }) async {
    final response = await BaseApi.putRequest(
        endpoint: 'post?type=department',
        id: id,
        body: {
          'content': content,
          'attachment': attachment,
        });
    return PostModel.fromJson(jsonDecode(response.body));
  }

  static Future<PostModel> deleteDepartmentPost({required int id}) async {
    final response =
        await BaseApi.deleteRequest(endpoint: 'post?type=department', id: id);
    return jsonDecode(response.body);
  }
}
