class ShortCourseRegistrationModel {
  final bool is_male;
  final String social_status;
  final String nationality;
  final String address;
  final String date_of_birth;
  final String student_type;
  final String work_type;
  final bool is_morning;
  final int course_id;

  ShortCourseRegistrationModel({
    required this.is_male,
    required this.social_status,
    required this.nationality,
    required this.address,
    required this.date_of_birth,
    required this.student_type,
    required this.work_type,
    required this.is_morning,
    required this.course_id,
  });

  factory ShortCourseRegistrationModel.fromJson(Map<String, dynamic> jsonData) {
    return ShortCourseRegistrationModel(
      is_male: jsonData['is_male'],
      social_status: jsonData['social_status'],
      nationality: jsonData['nationality'],
      address: jsonData['address'],
      date_of_birth: jsonData['date_of_birth'],
      student_type: jsonData['student_type'],
      work_type: jsonData['work_type'],
      is_morning: jsonData['is_morning'],
      course_id: jsonData['course_id'],
    );
  }
}
