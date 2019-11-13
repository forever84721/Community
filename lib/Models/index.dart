class BaseResponse<T> {
  bool success;
  String msg;
  T data;

  BaseResponse._fromJson(Map<String, dynamic> parsedJson) {
    success = parsedJson['Success'];
    msg = parsedJson['Msg'];
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    if (T == int) {
      return IntResponse.fromJson(json) as BaseResponse<T>;
    } else if (T == String) {
      return StringResponse.fromJson(json) as BaseResponse<T>;
    } else if (T is List) {
      return PostViewModelListResponse.fromJson(json) as BaseResponse<T>;
    }
    throw UnimplementedError();
  }
}

Type getType<T>() {
  return <T>[].runtimeType;
}

class IntResponse extends BaseResponse<int> {
  IntResponse.fromJson(Map<String, dynamic> json) : super._fromJson(json) {
    this.data = int.parse(json["Data"]);
  }
}

class StringResponse extends BaseResponse<String> {
  StringResponse.fromJson(Map<String, dynamic> json) : super._fromJson(json) {
    this.data = (json["Data"]);
  }
}

class PostViewModelListResponse extends BaseResponse<List<PostViewModel>> {
  PostViewModelListResponse.fromJson(Map<String, dynamic> parsedJson)
      : super._fromJson(parsedJson) {
    var list = parsedJson['Data'] as List;
    // print(list.runtimeType); //returns List<dynamic>
    List<PostViewModel> postViewModelList =
        list.map((i) => PostViewModel.fromJson(i)).toList();
    this.data = postViewModelList;
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

//========================
//========================
//========================

// class Address {
//   final String city;
//   final List<String> streets;

//   Address({this.city, this.streets});

//   factory Address.fromJson(Map<String, dynamic> parsedJson) {
//     var streetsFromJson = parsedJson['streets'];

//     List<String> streetsList = new List<String>.from(streetsFromJson);

//     return new Address(
//       city: parsedJson['city'],
//       streets: streetsList,
//     );
//   }
// }

// //==================
// class Property {
//   double width;
//   double breadth;
//   factory Property.fromJson(Map<String, dynamic> json) {
//     return Property(width: json['width'], breadth: json['breadth']);
//   }
//   Property({this.width, this.breadth});
// }

// class Shape {
//   String shapeName;
//   Property property;
//   factory Shape.fromJson(Map<String, dynamic> parsedJson) {
//     return Shape(
//         shapeName: parsedJson['shape_name'],
//         property: Property.fromJson(parsedJson['property']));
//   }
//   Shape({this.shapeName, this.property});
// }

// //===================
// class Product {
//   final int id;
//   final String name;
//   final List<ImageTest> images;
//   factory Product.fromJson(Map<String, dynamic> parsedJson) {
//     var list = parsedJson['images'] as List;
//     // print(list.runtimeType); //returns List<dynamic>
//     List<ImageTest> imagesList =
//         list.map((i) => ImageTest.fromJson(i)).toList();
//     return Product(
//         id: parsedJson['id'], name: parsedJson['name'], images: imagesList);
//   }
//   Product({this.id, this.name, this.images});
// }

// class ImageTest {
//   final int imageId;
//   final String imageName;
//   factory ImageTest.fromJson(Map<String, dynamic> parsedJson) {
//     return ImageTest(
//         imageId: parsedJson['id'], imageName: parsedJson['imageName']);
//   }
//   ImageTest({this.imageId, this.imageName});
// }
