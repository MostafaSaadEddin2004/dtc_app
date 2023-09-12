import 'dart:convert';

import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/move_request_model.dart';

abstract class MoreRequestService with BaseApi {
  static Future<MoveRequestModel> postMoveRequest(
      {required String text,
      required int user_id,
      required int department_id}) async {
    final response = await BaseApi.postRequest(endpoint: 'move', body: {
      'text': text,
      'user_id': user_id,
      'department_id': department_id
    });
    return MoveRequestModel.fromJson(jsonDecode(response.body)['data']);
  }
}
