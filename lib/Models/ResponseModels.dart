class PostViewModel {
  String content;
  int issuerId;
  String name;
  int numOfComment;
  int numOfLike;
  int numOfShare;
  int postId;
  DateTime postTime;
  int likeType;

  PostViewModel(
      {this.content,
      this.issuerId,
      this.name,
      this.numOfComment,
      this.numOfLike,
      this.numOfShare,
      this.postId,
      this.postTime,
      this.likeType});

  factory PostViewModel.fromJson(Map<String, dynamic> json) {
    return PostViewModel(
      content: json['Content'],
      issuerId: json['IssuerId'],
      name: json['Name'],
      numOfComment: json['NumOfComment'],
      numOfLike: json['NumOfLike'],
      numOfShare: json['NumOfShare'],
      postId: json['PostId'],
      postTime: DateTime.parse(json['PostTime']),
      likeType: json['LikeType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Content'] = this.content;
    data['IssuerId'] = this.issuerId;
    data['Name'] = this.name;
    data['NumOfComment'] = this.numOfComment;
    data['NumOfLike'] = this.numOfLike;
    data['NumOfShare'] = this.numOfShare;
    data['PostId'] = this.postId;
    data['PostTime'] = this.postTime;
    return data;
  }
}

class LikePostResponseModel {
  int newType;
  int numOfLike;
  LikePostResponseModel({this.newType, this.numOfLike});
  factory LikePostResponseModel.fromJson(Map<String, dynamic> json) {
    return LikePostResponseModel(
      newType: json['NewType'],
      numOfLike: json['NumOfLike'],
    );
  }
}

class ReplyViewModel {
  int postReplyId;
  int issuerId;
  String name;
  DateTime postTime;
  String content;

  ReplyViewModel(
      {this.issuerId,
      this.name,
      this.postReplyId,
      this.postTime,
      this.content});

  factory ReplyViewModel.fromJson(Map<String, dynamic> json) {
    return ReplyViewModel(
      content: json['Content'],
      issuerId: json['IssuerId'],
      name: json['Name'],
      postReplyId: json['PostReplyId'],
      postTime: DateTime.parse(json['PostTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Content'] = this.content;
    data['IssuerId'] = this.issuerId;
    data['Name'] = this.name;
    data['PostReplyId'] = this.postReplyId;
    data['PostTime'] = this.postTime;
    return data;
  }
}
