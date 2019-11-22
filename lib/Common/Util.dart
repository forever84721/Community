import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Util {
  static SharedPreferences sharedPreferences;
  static var formatter = new DateFormat('yyyy-MM-dd HH:mm');
  static String dateTimeToString(DateTime d) {
    return formatter.format(d);
  }
}
