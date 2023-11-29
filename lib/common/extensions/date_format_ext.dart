import 'package:intl/intl.dart';

extension DateTimeParsing on String{
   String get toFormattedBirthDate {
    try {
      DateTime valueDateTime = DateTime.parse(this);
      return DateFormat("dd MMMM yyyy").format(valueDateTime);
    } catch (e) {
      return "TBD";
    }
  }
}