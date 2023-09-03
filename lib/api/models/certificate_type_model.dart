class CertificateTypeModel {
  final int id;
  final String name;

  CertificateTypeModel({required this.id, required this.name});

  factory CertificateTypeModel.fromJson(Map<String, dynamic> jsonData) {
    return CertificateTypeModel(id: jsonData['id'], name: jsonData['name']);
  }
}
