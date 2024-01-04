import 'package:intl/intl.dart';

sealed class DateTimeUtils {
  static DateTime getCurrentFormattedDate() => DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
}
