import 'dart:convert';
import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/teacher_information_model.dart';

abstract class TeacherInformationServices with BaseApi {
  static void postTeacherInformation({
    required String certificate,
    required String specialty,
    required String birth_date,
    required String current_location,
    required String permanent_location,
    required String nationality,
    required int section_id,
  }) async {
    final response = await BaseApi.postRequest(endpoint: 'auth/teacher', body: {
      'certificate': certificate,
      'specialty': specialty,
      'birth_date': birth_date,
      'current_location': current_location,
      'permanent_location': permanent_location,
      'nationality': nationality,
      'section_id': section_id,
    });
    print(response.statusCode);
  }

  static Future<List<TeacherModel>> getTeaches() async {
    final response = await BaseApi.getRequest(endpoint: 'teachers');
    return (jsonDecode(response)['data'] as List)
        .map((json) => TeacherModel.fromJson(json))
        .toList();
  }
}
