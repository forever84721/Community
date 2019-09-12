import 'package:community/Models/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostService {
  Future<List<PostViewModel>> getRandomPost() async {
    var jsonString = ''' 
   {
    "city":"Taipei",
    "streets":["asd","dfg","ghj"]
   }
  ''';

    print(jsonString);
    var jsonResponse = json.decode(jsonString);
    Address address = new Address.fromJson(jsonResponse);
    print(address.city);
    // http.Response response = await http.get(
    //   "http://192.168.20.13:8080/api/Post/GetRandomPost", //GetRandomPost
    //   // body: '{"email":"forever84721@yahoo.com.tw","password":"asdf"}',
    //   headers: {"Content-Type": "application/json"}, //Accept
    // );
    // print('responseBody:${response.body}');
    // PostViewModelListResponse decoded =
    //     PostViewModelListResponse.fromJson(json.decode(response.body));
    return [];
  }
}

class Address {
  final String city;
  final List<String> streets;

  Address({this.city, this.streets});

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    var streetsFromJson = parsedJson['streets'];
    //print(streetsFromJson.runtimeType);
    // List<String> streetsList = new List<String>.from(streetsFromJson);
    //List<String> streetsList = streetsFromJson.cast<String>();

    List<String> streetsList = new List<String>.from(streetsFromJson);

    return new Address(
      city: parsedJson['city'],
      streets: streetsList,
    );
  }
}
