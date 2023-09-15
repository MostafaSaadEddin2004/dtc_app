import 'dart:convert';
import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/certificate_type_model.dart';

abstract class CertificateTypeService extends BaseApi {
  static Future<List<CertificateTypeModel>> getCertificateType() async {
    final response = await BaseApi.getRequest(endpoint: 'certificate-type');

    return (jsonDecode(response)['data'] as List)
        .map((json) => CertificateTypeModel.fromJson(json))
        .toList();
  }
}
