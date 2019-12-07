import 'package:date_format/date_format.dart';

class DateUtil {
  static ddmmyyyyFormat(String dateString) {
    var date = DateTime.parse(dateString);
    return formatDate(date, ['dd', '/', 'mm', '/', 'yyyy']);
  }
}
