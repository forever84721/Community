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
    } else if (T == getType<List<PostViewModel>>()) {
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
    this.data = int.parse(json["data"]);
  }
}

class PostViewModelListResponse extends BaseResponse<List<PostViewModel>> {
  PostViewModelListResponse.fromJson(Map<String, dynamic> parsedJson)
      : super._fromJson(parsedJson) {
    var list = parsedJson['data'] as List;
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
      postTime: DateTime.parse(json['postTime']),
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

//========================
//========================
//========================

class Address {
  final String city;
  final List<String> streets;

  Address({this.city, this.streets});

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    var streetsFromJson = parsedJson['streets'];

    List<String> streetsList = new List<String>.from(streetsFromJson);

    return new Address(
      city: parsedJson['city'],
      streets: streetsList,
    );
  }
}

//==================
class Property {
  double width;
  double breadth;
  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(width: json['width'], breadth: json['breadth']);
  }
  Property({this.width, this.breadth});
}

class Shape {
  String shapeName;
  Property property;
  factory Shape.fromJson(Map<String, dynamic> parsedJson) {
    return Shape(
        shapeName: parsedJson['shape_name'],
        property: Property.fromJson(parsedJson['property']));
  }
  Shape({this.shapeName, this.property});
}

//===================
class Product {
  final int id;
  final String name;
  final List<ImageTest> images;
  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['images'] as List;
    // print(list.runtimeType); //returns List<dynamic>
    List<ImageTest> imagesList =
        list.map((i) => ImageTest.fromJson(i)).toList();
    return Product(
        id: parsedJson['id'], name: parsedJson['name'], images: imagesList);
  }
  Product({this.id, this.name, this.images});
}

class ImageTest {
  final int imageId;
  final String imageName;
  factory ImageTest.fromJson(Map<String, dynamic> parsedJson) {
    return ImageTest(
        imageId: parsedJson['id'], imageName: parsedJson['imageName']);
  }
  ImageTest({this.imageId, this.imageName});
}
