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

class ReplyRequestModel {
  int userId;
  int replyType;
  int targetId;
  String content;
  ReplyRequestModel(
      {@required this.userId,
      @required this.replyType,
      @required this.targetId,
      @required this.content});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['ReplyType'] = this.replyType;
    data['TargetId'] = this.targetId;
    data['Content'] = this.content;
    return data;
  }
}
