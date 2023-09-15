import 'dart:convert';
import 'package:dtc_app/api/helper.dart';
import '../models/edit_mark_request_model.dart';

abstract class EditMarkRequestService with BaseApi {
  static Future<EditMarkRequestModel> postEditMarkRequest({
    required String subject,
    required String mark,
    required String reason,
    required String teacher,
  }) async {
    final response = await BaseApi.postRequest(endpoint: 'editMark', body: {
      'subject': subject,
      'mark': mark,
      'reason': reason,
      'teacher': teacher,
    });
    return EditMarkRequestModel.fromJson(jsonDecode(response.body)['data']);
  }
}
