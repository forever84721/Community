import 'package:community/Environments/IEnvironment.dart';

class Company implements IEnvironment {
  @override
  String apiUrl = "http://192.168.20.13:8080/api";

  @override
  bool production = true;
}
