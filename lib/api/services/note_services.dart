import 'dart:convert';
import '../helper.dart';
import '../models/note_category_model.dart';
import '../models/note_model.dart';
import 'package:http/http.dart' as http;

abstract class NoteServices extends BaseApi {
  static Future<List<NoteModel>> getNote() async {
    final response = await BaseApi.getRequest(endpoint: 'note');
    return (jsonDecode(response)["data"] as List)
        .map((e) => NoteModel.fromJson(e))
        .toList();
  }

  static Future<NoteModel> postNote(
      {String? token,
      required String title,
      required String description,
      required String category_name}) async {
    final response = await BaseApi.postRequest(endpoint: 'note', body: {
      'title': title,
      'description': description,
      'category_name': category_name
    });
    return NoteModel.fromJson(jsonDecode(response.body)['data']);
  }

  static Future<NoteModel> putNote(
      {String? token,
      String? title,
      String? description,
      String? category,
      int? id}) async {
    final response = await BaseApi.putRequest(endpoint: 'note', id: id!, body: {
      'title': title!,
      'description': description!,
      'category': category!
    });
    return NoteModel.fromJson(jsonDecode(response.body)['data']);
  }

  static Future<NoteModel> deleteNote({required int id}) async {
    http.Response response =
        await BaseApi.deleteRequest(endpoint: 'note', id: id);
    return jsonDecode(response.body);
  }

  static Future<List<NoteCategoryModel>> getNoteCateogry() async {
    final response = await BaseApi.getRequest(endpoint: 'user/note-categories');

    return (jsonDecode(response)['data'] as List)
        .map((json) => NoteCategoryModel.formJson(json))
        .toList();
  }
}
