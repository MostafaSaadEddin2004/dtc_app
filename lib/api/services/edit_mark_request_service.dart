import 'dart:convert';
import 'package:dtc_app/api/helper.dart';
import '../models/edit_mark_request_model.dart';

abstract class EditMarkRequestService with BaseApi {
  static Future<EditMarkRequestModel> postEditMarkRequest({
    required String subject,
    required int mark,
    required String reason,
    required String teacher,
    required int user_id,
  }) async {
    final response = await BaseApi.postRequest(endpoint: 'editMark', body: {
      'subject': subject,
      'mark': mark,
      'reason': reason,
      'teacher': teacher,
      'user_id': user_id
    });
    return EditMarkRequestModel.fromJson(jsonDecode(response.body)['data']);
  }
}
