import 'dart:convert';

import 'package:dtc_app/api/helper.dart';
import 'package:dtc_app/api/models/comparison_model.dart';

abstract class ComparisonService extends BaseApi {
  static Future<List<ComparisonModel>> getComparison(
      {required int certificateType_id}) async {
    final response = await BaseApi.getRequest(
        endpoint: 'certificate-type/$certificateType_id/department');
    print(response);
    return (jsonDecode(response)['data'] as List)
        .map((json) => ComparisonModel.fromJson(json))
        .toList();
  }
}
