import 'dart:convert';

import 'package:dtc_app/api/helper.dart';
import 'package:http/http.dart' as http;
import '../models/short_course_registration_model.dart';

abstract class ShortCourseRegistration extends BaseApi {
  static Future<ShortCourseRegistrationModel> postShortCourseRegistration({
    required bool is_male,
    required String social_status,
    required String nationality,
    required String address,
    required String date_of_birth,
    required String student_type,
    required String work_type,
    required bool is_morning,
    required int course_id,
  }) async {
    final response = await BaseApi.postRequest(
        endpoint: 'course/$course_id/register',
        body: {
          'is_male': is_male,
          'social_status': social_status,
          'nationality': nationality,
          'address': address,
          'date_of_birth': date_of_birth,
          'student_type': student_type,
          'work_type': work_type,
          'is_morning': is_morning,
          'course_id': course_id,
        });
    return ShortCourseRegistrationModel.fromJson(
        jsonDecode(response.body)['data']);
  }
}
