import 'package:community/Environments/Company.dart';
import 'package:community/Environments/IEnvironment.dart';

class Environment {
  static IEnvironment current = new Company();
}
