import 'dart:convert';

import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/move_request_model.dart';

abstract class MoreRequestService with BaseApi {
  static Future<MoveRequestModel> postMoveRequest(
      {required String text, required int department_id}) async {
    final response = await BaseApi.postRequest(
        endpoint: 'move', body: {'text': text, 'department_id': 2});
    return MoveRequestModel.fromJson(jsonDecode(response.body)['data']);
  }
}
