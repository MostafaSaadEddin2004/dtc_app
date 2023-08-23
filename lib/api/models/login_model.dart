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
