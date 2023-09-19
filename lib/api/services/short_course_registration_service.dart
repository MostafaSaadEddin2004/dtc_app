import 'package:dtc_app/api/helper.dart';

abstract class ShortCourseRegistration extends BaseApi {
  static Future<void> postShortCourseRegistration({
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
    // ignore: unused_local_variable
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
  }
}
