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
