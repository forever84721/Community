import 'package:community/Environments/IEnvironment.dart';

class Home implements IEnvironment {
  @override
  String apiUrl = "http://192.168.1.198:8080/api";

  @override
  bool production = false;
}
