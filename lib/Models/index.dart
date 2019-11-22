import 'package:community/Models/ResponseModels.dart';

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
    // this.data = int.parse(json["Data"]);
    this.data = json["Data"];
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

class LikePostResponse extends BaseResponse<LikePostResponseModel> {
  LikePostResponse.fromJson(Map<String, dynamic> parsedJson)
      : super._fromJson(parsedJson) {
    this.data = LikePostResponseModel.fromJson(parsedJson['Data']);
  }
}

class ReplyViewModelListResponse extends BaseResponse<List<ReplyViewModel>> {
  ReplyViewModelListResponse.fromJson(Map<String, dynamic> parsedJson)
      : super._fromJson(parsedJson) {
    var list = parsedJson['Data'] as List;
    List<ReplyViewModel> postViewModelList =
        list.map((i) => ReplyViewModel.fromJson(i)).toList();
    this.data = postViewModelList;
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
