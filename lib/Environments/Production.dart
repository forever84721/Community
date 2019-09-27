import 'package:community/Environments/IEnvironment.dart';

class Production implements IEnvironment {
  @override
  String apiUrl = "";

  @override
  bool production = true;
}
