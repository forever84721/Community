import 'package:community/Models/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostService {
  Future<List<PostViewModel>> getRandomPost() async {
    // var jsonString = '''
    // {
    //   "city":"Taipei",
    //   "streets":["asd","dfg","ghj"]
    // }
    // ''';
    // print(jsonString);
    // var jsonResponse = json.decode(jsonString);
    // Address address = new Address.fromJson(jsonResponse);
    // print(address.city);
    // //==============================
    // jsonString = '''
    // {
    //   "shape_name":"rectangle",
    //   "property":{
    //     "width":5.0,
    //     "breadth":10.0
    //   }
    // }
    // ''';
    // jsonResponse = json.decode(jsonString);
    // Shape s = new Shape.fromJson(jsonResponse);
    // print(s.property.breadth);
    // //==============================
    // jsonString = '''
    // {
    //   "id":1,
    //   "name":"ProductName",
    //   "images":[
    //     {
    //       "id":11,
    //       "imageName":"xCh-rhy"
    //     },
    //     {
    //       "id":31,
    //       "imageName":"fjs-eun"
    //     }
    //   ]
    // }
    // ''';
    // jsonResponse = json.decode(jsonString);
    // Product p = new Product.fromJson(jsonResponse);
    // print(p.images.map((a) {
    //   return a.imageName;
    // }));
    http.Response response = await http.get(
      // "http://192.168.20.13:8080/api/Post/GetRandomPost", //GetRandomPost
      "http://192.168.1.198:8080/api/Post/GetRandomPost",
      // "http://localhost:56103/api/Post/GetRandomPost",
      // body: '{"email":"forever84721@yahoo.com.tw","password":"asdf"}',
      headers: {"Content-Type": "application/json"}, //Accept
    );
    // print('responseBody:${response.body}');
    BaseResponse<List<PostViewModel>> decoded =
        PostViewModelListResponse.fromJson(json.decode(response.body));
    // print(decoded.success);
    // print(decoded.msg);
    // print(decoded.data);
    return decoded.data;
  }
}
