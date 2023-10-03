import 'dart:convert';

import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/subject_model.dart';

abstract class SubjectService with BaseApi {
  static Future<List<SubjectModel>> getSubjects() async {
    final response = await BaseApi.getRequest(endpoint: 'subjects');

    return (jsonDecode(response)['data'] as List)
        .map((json) => SubjectModel.fromJson(json))
        .toList();
  }
}
