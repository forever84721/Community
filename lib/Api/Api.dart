import 'dart:convert';

import 'package:community/Environments/Environment.dart';
import 'package:community/Models/index.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<String> _post(String action, dynamic data) async {
    http.Response response = await http.post(
      '${Environment.current.apiUrl}/$action',
      body: json.encode(data),
      headers: {"Content-Type": "application/json"},
    );
    return response.body;
  }

  static Future<String> _get<T>(String action) async {
    http.Response response = await http.get(
      '${Environment.current.apiUrl}/$action',
      headers: {"Content-Type": "application/json"},
    );
    return response.body;
  }

  static Future<BaseResponse<String>> login(dynamic data) async {
    var body = await _post("Auth/Login", data);
    return BaseResponse<String>.fromJson(json.decode(body));
  }

  static Future<BaseResponse<List<PostViewModel>>> getRandomPost() async {
    var body = await _get("Post/GetRandomPost");
    return PostViewModelListResponse.fromJson(json.decode(body));
  }
}
