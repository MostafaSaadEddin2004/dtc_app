import 'dart:convert';
import '../helper.dart';
import '../models/note_model.dart';
import 'package:http/http.dart' as http;

abstract class NoteServices extends BaseApi {
  static Future<List<NoteModel>> getNote() async {
    final body = await BaseApi.getRequest(endpoint: 'note');
    return (jsonDecode(body)["data"] as List)
        .map((e) => NoteModel.fromJson(e))
        .toList();
  }

  static Future<NoteModel> postNote(
      {String? token,
      String? title,
      String? description,
      String? category}) async {
    http.Response response = await BaseApi.postRequest(endpoint: 'note', body: {
      'title': title!,
      'description': description!,
      'category': category!
    });
    return NoteModel.fromJson(jsonDecode(response.body));
  }

  static Future<NoteModel> putNote(
      {String? token,
      String? title,
      String? description,
      String? category,
      required int id}) async {
    http.Response response = await BaseApi.putRequest(
        endpoint: 'note',
        id: id,
        body: {
          'title': title,
          'description': description,
          'category': category
        });
    return NoteModel.fromJson(jsonDecode(response.body));
  }

  static Future<NoteModel> deleteNote({required int id}) async {
    http.Response response = await BaseApi.deleteRequest(endpoint: 'note', id: id);
    return jsonDecode(response.body);
  }
}
