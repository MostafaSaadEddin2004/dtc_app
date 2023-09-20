import 'dart:convert';

import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/notification_model.dart';

abstract class NotificationService with BaseApi {
  static Future<List<NotificationModel>> getNotifications() async {
    final response = await BaseApi.getRequest(endpoint: 'notification');

    return (jsonDecode(response)['data'] as List)
        .map((json) => NotificationModel.fromJson(json))
        .toList();
  }
}
