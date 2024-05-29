import 'package:intl/intl.dart';

class AppFormat {
  static String date(DateTime date) {
    String result = DateFormat('d MMM yyyy', 'id_ID').format(date);
    return result;
  }
}
