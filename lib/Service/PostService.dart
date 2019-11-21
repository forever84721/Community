import 'package:community/Api/Api.dart';
import 'package:community/Models/ResponseModels.dart';

class PostService {
  Future<List<PostViewModel>> getRandomPost() async {
    var res = await Api.getRandomPost();
    return res.data;
  }
}
