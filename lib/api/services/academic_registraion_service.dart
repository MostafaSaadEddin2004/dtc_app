import 'dart:convert';
import 'dart:io';

import 'package:dtc_app/api/helper.dart';

abstract class AcademicRegistrationService with BaseApi {
  static void postAcademicRegistration({
    required String father_name,
    required String mother_name,
    required String date_of_birth,
    required String place_of_birth,
    required String military,
    required String current_address,
    required String address,
    required String name_of_parent,
    required String job_of_parent,
    required String phone_of_parent,
    required String phone_of_mother,
    required String avg_mark,
    required String certificate_year,
    required File id_image,
    required File certificate_image,
    required File personal_image,
    required File un_image,
    required List<int> department_ids,
  }) async {
    // ignore: unused_local_variable
    final response =
        await BaseApi.postWithFiles(endpoint: 'academic-registration', files: {
      'id_image': id_image,
      'certificate_image': certificate_image,
      'personal_image': personal_image,
      'un_image': un_image,
    }, body: {
      'father_name': father_name,
      'mother_name': mother_name,
      'date_of_birth': date_of_birth,
      'place_of_birth': place_of_birth,
      'military': military,
      'current_address': current_address,
      'address': address,
      'name_of_parent': name_of_parent,
      'job_of_parent': job_of_parent,
      'phone_of_parent': phone_of_parent,
      'phone_of_mother': phone_of_mother,
      'avg_mark': avg_mark,
      'certificate_year': certificate_year,
      'department_ids': jsonEncode(department_ids),
    });
    print(jsonDecode(response.body));
  }
}
