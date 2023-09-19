import 'dart:convert';

import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/teacher_information_model.dart';

abstract class TeacherInformationServices with BaseApi {
  static Future<TeacherInformationModel?> postTeacherInformation({
    required String certificate,
    required String specialty,
    required String birth_date,
    required String current_location,
    required String permanent_location,
    required String nationality,
    required int department_id,
  }) async {
    final response = await BaseApi.postRequest(endpoint: 'auth/teacher', body: {
      'certificate': certificate,
      'specialty': specialty,
      'birth_date': birth_date,
      'current_location': current_location,
      'permanent_location': permanent_location,
      'nationality': nationality,
      'department_id': department_id,
    });
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return TeacherInformationModel.fromJson(
          jsonDecode(response.body)['data']);
    } else {
      throw Exception('$response ${response.statusCode}');
    }
  }
}
