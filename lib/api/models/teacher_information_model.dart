class TeacherInformationModel {
  final String certificate;
  final String specialty;
  final String birth_date;
  final String current_location;
  final String permanent_location;
  final String nationality;
  final String department_id;

  TeacherInformationModel(
      {required this.certificate,
      required this.specialty,
      required this.birth_date,
      required this.current_location,
      required this.permanent_location,
      required this.nationality,
      required this.department_id});

  factory TeacherInformationModel.fromJson(Map<String, dynamic> jsonData) {
    return TeacherInformationModel(
        certificate: jsonData['certificate'],
        specialty: jsonData['specialty'],
        current_location: jsonData['current_location'],
        permanent_location: jsonData['permanent_location'],
        department_id: jsonData['department_id'],
        birth_date: jsonData['birth_date'],
        nationality: jsonData['nationality']);
  }
}
