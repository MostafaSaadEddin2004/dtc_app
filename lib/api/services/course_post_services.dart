import 'dart:convert';
import 'package:dtc_app/api/models/post_model.dart';
import '../helper.dart';

abstract class CoursePostServices with BaseApi {
  static Future<List<PostModel>> getCoursePost() async {
    final body = await BaseApi.getRequest(endpoint: 'post?type=course');

    return (jsonDecode(body)["data"] as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
  }
}
