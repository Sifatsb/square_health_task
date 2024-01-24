import 'package:intl/intl.dart';

class DateTimeConverter {

  String convertISOToDesiredFormat(String isoDate) {
    final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'");
    final outputFormat = DateFormat("yyyy-MM-dd");
    final dateTime = inputFormat.parse(isoDate, true);
    return outputFormat.format(dateTime);
  }

}