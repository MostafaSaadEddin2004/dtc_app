import 'dart:convert';
import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/department_model.dart';
import 'package:dtc_app/api/models/specialty_model.dart';

abstract class DepartmentServices with BaseApi {
  static Future<List<DepartmentModel>> getDepartment() async {
    final response = await BaseApi.getRequest(endpoint: 'sections');
    return (jsonDecode(response)["data"] as List)
        .map((e) => DepartmentModel.fromJson(e))
        .toList();
  }

  static Future<List<SpecialtyModel>> getSpecialty(
      {required int departmentId}) async {
    final response =
        await BaseApi.getRequest(endpoint: 'section/$departmentId/departments');
    return (jsonDecode(response)["data"] as List)
        .map((e) => SpecialtyModel.fromJson(e))
        .toList();
  }
}
