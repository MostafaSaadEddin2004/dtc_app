import 'dart:convert';

import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/post_model.dart';

abstract class SavedPostService with BaseApi {
  static Future<List<PostModel>> getSavedPost() async {
    final response = await BaseApi.getRequest(endpoint: 'saved-posts');
    print(response);
    return (jsonDecode(response)["data"] as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
  }
}
