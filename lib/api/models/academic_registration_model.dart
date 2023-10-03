import 'dart:io';

class AcademicRegistrationModel {
  final String father_name;
  final String mother_name;
  final String date_of_birth;
  final String place_of_birth;
  final String military;
  final String current_address;
  final String address;
  final String name_of_parent;
  final String job_of_parent;
  final String phone_of_parent;
  final String phone_of_mother;
  final String avg_mark;
  final String certificate_year;
  final File id_image;
  final File certificate_image;
  final File personal_image;
  final File un_image;
  final List<int> department_ids;

  AcademicRegistrationModel(
      {required this.father_name,
      required this.mother_name,
      required this.date_of_birth,
      required this.place_of_birth,
      required this.military,
      required this.current_address,
      required this.address,
      required this.name_of_parent,
      required this.job_of_parent,
      required this.phone_of_parent,
      required this.phone_of_mother,
      required this.avg_mark,
      required this.certificate_year,
      required this.id_image,
      required this.certificate_image,
      required this.personal_image,
      required this.un_image,
      required this.department_ids});

  factory AcademicRegistrationModel.fromJson(Map<String, dynamic> jsonData) {
    return AcademicRegistrationModel(
        father_name: jsonData['father_name'],
        mother_name: jsonData['mother_name'],
        date_of_birth: jsonData['date_of_birth'],
        place_of_birth: jsonData['place_of_birth'],
        military: jsonData['military'],
        current_address: jsonData['current_address'],
        address: jsonData['address'],
        name_of_parent: jsonData['name_of_parent'],
        job_of_parent: jsonData['job_of_parent'],
        phone_of_parent: jsonData['phone_of_parent'],
        phone_of_mother: jsonData['phone_of_mother'],
        avg_mark: jsonData['avg_mark'],
        certificate_year: jsonData['certificate_year'],
        id_image: jsonData['id_image'],
        certificate_image: jsonData['certificate_image'],
        personal_image: jsonData['personal_image'],
        un_image: jsonData['un_image'],
        department_ids: jsonData['department_ids']);
  }
}


