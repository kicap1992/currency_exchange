import 'package:intl/intl.dart';

class OtherFunction {
  int umur(String tanggalLahir) {
    // change tanggalLahir to DateTime
    DateTime date = DateTime.parse(tanggalLahir);
    // get current date
    DateTime now = DateTime.now();
    // get difference in year
    int year = now.year - date.year;
    return year;
  }

  String commaFormat(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }

  String timeStampConverter(int timeStamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    // day name, date and hours with am/pm
    String formattedDate = DateFormat('EE, d MM-yyyy | HH:mm a').format(date);
    return formattedDate;
  }
}
