import 'dart:convert';
import 'dart:io';
import 'package:dtc_app/api/models/post_model.dart';
import '../helper.dart';
import 'package:http/retry.dart' as http;

abstract class PublicPostServices with BaseApi {
  static Future<List<PostModel>> getPublicPost() async {
    final response = await BaseApi.getRequest(endpoint: 'post?type=public');

    return (jsonDecode(response)["data"] as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
  }

  static void likePost({String? token, required String id}) async {
    final response =
        await BaseApi.postRequest(endpoint: 'post?type=public/$id/like');
  }

  static void savePost({required String id}) async {
    final response =
        await BaseApi.postRequest(endpoint: 'post?type=public/$id/save');
  }
}
