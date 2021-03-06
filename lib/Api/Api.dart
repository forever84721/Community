import 'dart:convert';

import 'package:community/Common/ConstString.dart';
import 'package:community/Common/Util.dart';
import 'package:community/Environments/Environment.dart';
import 'package:community/Models/RequestModels.dart';
import 'package:community/Models/ResponseModels.dart';
import 'package:community/Models/index.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<String> _post(String action, dynamic data) async {
    var token = Util.sharedPreferences.get(ConstString.token) ?? "";
    http.Response response = await http.post(
      '${Environment.current.apiUrl}/$action',
      body: json.encode(data),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response.body;
  }

  static Future<String> _get<T>(String action) async {
    var token = Util.sharedPreferences.get(ConstString.token) ?? "";
    http.Response response = await http.get(
      '${Environment.current.apiUrl}/$action',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response.body;
  }

  static Future<BaseResponse<String>> login(Map<String, dynamic> data) async {
    var body = await _post("Auth/Login", data);
    return BaseResponse<String>.fromJson(json.decode(body));
  }

  static Future<BaseResponse<List<PostViewModel>>> getRandomPost(
      int page) async {
    var body = await _get("Post/GetRandomPost/$page");
    print(body);
    return PostViewModelListResponse.fromJson(json.decode(body));
  }

  static Future<BaseResponse<LikePostResponseModel>> likePost(
      LikePostRequestModel model) async {
    var body = await _post("Post/LikePost", model);
    print(body);
    return LikePostResponse.fromJson(json.decode(body));
  }

  static Future<ReplyViewModelListResponse> getReply(
      GetReplyRequestModel model) async {
    var body = await _post("Post/GetReply", model);
    try {
      print(body);
      return ReplyViewModelListResponse.fromJson(json.decode(body));
    } catch (ex) {
      return ReplyViewModelListResponse(false, ex.toString(), []);
    }
  }

  static Future<BaseResponse<int>> reply(ReplyRequestModel model) async {
    var body = await _post("Post/Reply", model);
    print(body);
    return BaseResponse<int>.fromJson(json.decode(body));
  }
}
