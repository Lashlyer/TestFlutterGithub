import 'package:intl/intl.dart';

extension DateParsing on String {
  String toFormattedDate() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('yyyy-MM-dd').format(dateTime);
    } catch (e) {
      return this;
    }
  }
}