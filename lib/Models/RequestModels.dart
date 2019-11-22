import 'package:flutter/cupertino.dart';

class LikePostRequestModel {
  int postId;
  int likeType;
  LikePostRequestModel({this.postId, this.likeType});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PostId'] = this.postId;
    data['LikeType'] = this.likeType;
    return data;
  }
}

class GetReplyRequestModel {
  int postId;
  int page;
  GetReplyRequestModel({@required this.postId, @required this.page});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PostId'] = this.postId;
    data['Page'] = this.page;
    return data;
  }
}
