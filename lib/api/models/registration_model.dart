class RegistrationModel {
  final String first_name_en;
  final String last_name_en;
  final String first_name_ar;
  final String last_name_ar;
  final String email;
  final String password;
  final String phone;
  final String role;

  RegistrationModel({
    required this.first_name_en,
    required this.last_name_en,
    required this.first_name_ar,
    required this.last_name_ar,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> jsonData) {
    return RegistrationModel(
      first_name_en: jsonData['first_name_en'],
      last_name_en: jsonData['last_name_en'],
      first_name_ar: jsonData['first_name_ar'],
      last_name_ar: jsonData['last_name_ar'],
      email: jsonData['email'],
      password: jsonData['password'],
      phone: jsonData['phone'],
      role: jsonData['role'],
    );
  }
}
