import 'dart:convert';
import 'package:dtc_app/api/models/post_model.dart';
import '../helper.dart';

abstract class PublicPostServices with BaseApi {
  static Future<List<PostModel>> getPublicPost() async {
    final response = await BaseApi.getRequest(endpoint: 'post?type=public');

    return (jsonDecode(response)["data"] as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
  }
}
