import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

// part 'data.g.dart';

// @JsonSerializable()
// class Data {
//   final String by;
//   final int descendants;
//   final int id;
//   final List<int> kids;
//   final int score;
//   final int time;
//   final String title;
//   final String type;
//   @JsonKey(nullable: false)
//   final String url;

//   Data({this.by, this.descendants, this.id, this.kids, this.score, this.time,
//     this.title, this.type, this.url});
// }
// class BaseListResponse {
//   bool success;
//   String msg;
//   String data;
//   BaseListResponse({this.success, this.data, this.msg});
//   BaseListResponse.fromJson(Map<String, dynamic> json)
//       : success = json['success'],
//         msg = json['msg'],
//         data = json['data']; //Property.fromJson
// }

// class BaseResponse<T> {
//   bool success;
//   String msg;
//   T data;

//   BaseResponse.fromJson(Map<String, dynamic> json)
//       : success = json['success'],
//         msg = json['msg'],
//         data = (json['data']); //Property.fromJson
// }

// class PostViewModel {
//   int postId;
//   int issuerId;
//   String name;
//   DateTime postTime;
//   String content;
//   int numOfLike;
//   int numOfComment;
//   int numOfShare;

//   PostViewModel.fromJson(Map<String, dynamic> json)
//       : postId = json['postId'],
//         issuerId = json['issuerId'],
//         name = json['name'],
//         postTime = json['postTime'],
//         content = json['content'],
//         numOfLike = json['numOfLike'],
//         numOfComment = json['numOfComment'],
//         numOfShare = json['numOfShare'];
//   // Map<String, dynamic> toJson() =>
//   // {
//   //   'name': name,
//   //   'email': email,
//   // };
// }

// class BaseResponse<T> {
//     List<T> data;
//     String msg;
//     bool success;

//     BaseResponse({this.data, this.msg, this.success});

//     factory BaseResponse.fromJson(Map<String, dynamic> json) {
//         return BaseResponse(
//             data: json['data'] != null ? (json['data'] as List).map((i) => IntResponse.fromJson(i)).toList() : null,
//             msg: json['msg'],
//             success: json['success'],
//         );
//     }

//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['msg'] = this.msg;
//         data['success'] = this.success;
//         if (this.data != null) {
//             data['data'] = this.data.map((v) => v.toJson()).toList();
//         }
//         return data;
//     }
// }

class BaseResponse<T> {
  bool success;
  String message;
  T data;

  BaseResponse._fromJson(Map<String, dynamic> parsedJson)
      : success = parsedJson['success'],
        message = parsedJson['message'];

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    if (T == int) {
      return IntResponse.fromJson(json) as BaseResponse<T>;
    }
    throw UnimplementedError();
  }
}

class IntResponse extends BaseResponse<int> {
  IntResponse.fromJson(Map<String, dynamic> json) : super._fromJson(json) {
    this.data = int.parse(json["data"]);
  }
}

class PostViewModelListResponse extends BaseResponse<List<PostViewModel>> {
  PostViewModelListResponse.fromJson(Map<String, dynamic> data)
      : super._fromJson(data) {
    // this.data = PostViewModel.fromJson(json.decode(data));
  }
}

class PostViewModel {
  String content;
  int issuerId;
  String name;
  int numOfComment;
  int numOfLike;
  int numOfShare;
  int postId;
  String postTime;

  PostViewModel(
      {this.content,
      this.issuerId,
      this.name,
      this.numOfComment,
      this.numOfLike,
      this.numOfShare,
      this.postId,
      this.postTime});

  factory PostViewModel.fromJson(Map<String, dynamic> json) {
    return PostViewModel(
      content: json['content'],
      issuerId: json['issuerId'],
      name: json['name'],
      numOfComment: json['numOfComment'],
      numOfLike: json['numOfLike'],
      numOfShare: json['numOfShare'],
      postId: json['postId'],
      postTime: json['postTime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['issuerId'] = this.issuerId;
    data['name'] = this.name;
    data['numOfComment'] = this.numOfComment;
    data['numOfLike'] = this.numOfLike;
    data['numOfShare'] = this.numOfShare;
    data['postId'] = this.postId;
    data['postTime'] = this.postTime;
    return data;
  }
}
