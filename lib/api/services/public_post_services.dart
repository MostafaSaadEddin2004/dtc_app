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
  
  

  static void likePost({required String id}) async {
    // ignore: unused_local_variable
    final response =
        await BaseApi.postRequest(endpoint: 'post/$id/like');
  }

  static void savePost({required String id}) async {
    // ignore: unused_local_variable
    final response =
        await BaseApi.postRequest(endpoint: 'post/$id/save');
  }

  static void disLikePost({required String id}) async {
    // ignore: unused_local_variable
    final response =
        await BaseApi.postRequest(endpoint: 'post/$id/dislike');
  }

  static void unSavePost({required String id}) async {
    // ignore: unused_local_variable
    final response =
        await BaseApi.postRequest(endpoint: 'post/$id/unsave');
  }
}
