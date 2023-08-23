class RegistrationModel {
  final String arFirstName;
  final String arLastName;
  final String enFirstName;
  final String enLastName;
  final String email;
  final String password;
  final int phoneNumber;
  final String role;

  RegistrationModel({
    required this.arFirstName,
    required this.arLastName,
    required this.enFirstName,
    required this.enLastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> jsonData) {
    return RegistrationModel(
      arFirstName: jsonData['arFirstName'],
      arLastName: jsonData['arLastName'],
      enFirstName: jsonData['enFirstName'],
      enLastName: jsonData['enLastName'],
      email: jsonData['email'],
      password: jsonData['password'],
      phoneNumber: jsonData['phoneNumber'],
      role: jsonData['role'],
    );
  }
}
