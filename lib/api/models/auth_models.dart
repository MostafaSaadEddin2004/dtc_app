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

class LoginModel {
  final String email;
  final String password;
  final String role;

  LoginModel({
    required this.email,
    required this.password,
    required this.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      email: jsonData['email'],
      password: jsonData['password'],
      role: jsonData['role'],
    );
  }
}

class RegistrationInformationModel {
  final String email;
  final String first_name_en;
  final String first_name_ar;
  final String last_name_en;
  final String last_name_ar;
  final String phone;
  final String? image;
  final String? department;
  final String? section;

  RegistrationInformationModel({
    required this.email,
    required this.first_name_en,
    required this.first_name_ar,
    required this.last_name_en,
    required this.last_name_ar,
    required this.phone,
    required this.image,
    required this.department,
    required this.section,
  });

  factory RegistrationInformationModel.fromJson(Map<String, dynamic> jsonData) {
    return RegistrationInformationModel(
      email: jsonData['email'],
      first_name_en: jsonData['first_name_en'],
      first_name_ar: jsonData['first_name_ar'],
      last_name_en: jsonData['last_name_en'],
      last_name_ar: jsonData['last_name_ar'],
      phone: jsonData['phone'],
      image: jsonData['image'],
      department: jsonData['department'],
      section: jsonData['section'],
    );
  }
}

class RoleModel {
  final String role;

  RoleModel({required this.role});

  factory RoleModel.fromJson(Map<String, dynamic> jsonData) {
    return RoleModel(role: jsonData['role']);
  }
}
