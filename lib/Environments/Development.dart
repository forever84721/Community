import 'package:community/Environments/IEnvironment.dart';

class Development implements IEnvironment {
  @override
  String apiUrl = "";

  @override
  bool production = false;
}
