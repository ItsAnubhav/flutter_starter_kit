import 'package:intl/intl.dart';

class DateUtility {
  static DateTime parseDateTime(
      {required String dateTimeString, String format = "yyyy-MM-dd hh:mm:ss"}) {
    return DateFormat(format).parse(dateTimeString, true);
  }

  static String formatDateTime(
      {required DateTime dateTime,
      String outputFormat = "yyyy-MM-dd hh:mm:ss"}) {
    return DateFormat(outputFormat).format(dateTime);
  }

  static bool isSameDate(DateTime dateTime1, DateTime dateTime2) {
    return dateTime1.year == dateTime2.year &&
        dateTime1.month == dateTime2.month &&
        dateTime1.day == dateTime2.day;
  }

  static bool isSameHour(DateTime dateTime1, DateTime dateTime2) {
    return dateTime1.year == dateTime2.year &&
        dateTime1.month == dateTime2.month &&
        dateTime1.day == dateTime2.day &&
        dateTime1.hour == dateTime2.hour;
  }

  static int diffInDays(DateTime date1, DateTime date2) {
    return ((date1.difference(date2) -
                    Duration(hours: date1.hour) +
                    Duration(hours: date2.hour))
                .inHours /
            24)
        .round();
  }

  static DateTime toDate(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static DateTime toDayStart(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0);
  }

  static DateTime toDayEnd(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59);
  }

  static String parseAndFormatDateTime(
      {required String? dateTimeString,
      String inputFormat = "yyyy-MM-dd hh:mm:ss",
      String outputFormat = "dd MMM yyyy hh:mm a"}) {
    if (dateTimeString == null) {
      return "";
    }
    final dateTime = DateUtility.parseDateTime(
        dateTimeString: dateTimeString, format: inputFormat);
    return formatDateTime(dateTime: dateTime, outputFormat: outputFormat);
  }

  static List<DateTime> getDatesBetween(DateTime startDate, DateTime endDate,
      {int daysInterval = 1}) {
    List<DateTime> dates = [];
    startDate = DateUtility.toDate(startDate);
    endDate = DateUtility.toDate(endDate);
    for (var i = startDate;
        i.isBefore(endDate.add(Duration(days: daysInterval)));
        i = i.add(Duration(days: daysInterval))) {
      dates.add(i);
    }
    return dates;
  }

  static List<DateTime> getHoursBetween(DateTime startDate, DateTime endDate,
      {int hoursInterval = 1}) {
    List<DateTime> dates = [];
    for (var i = startDate;
        i.isBefore(endDate.add(Duration(hours: hoursInterval)));
        i = i.add(Duration(hours: hoursInterval))) {
      dates.add(i);
    }
    return dates;
  }

  static List<DateTime> getMinutesBetween(DateTime startDate, DateTime endDate,
      {int minutesInterval = 1}) {
    List<DateTime> dates = [];
    for (var i = startDate;
        i.isBefore(endDate.add(Duration(minutes: minutesInterval)));
        i = i.add(Duration(minutes: minutesInterval))) {
      dates.add(i);
    }
    return dates;
  }

  static String convertMinutesToHours(int totalMinutes,
      {bool showInTwoDigits = true, bool shrink = false}) {
    int hours = totalMinutes ~/ 60; // Divide totalMinutes by 60 to get hours
    int minutes = totalMinutes % 60; // Get the remainder to get minutes
    String finalString = '';
    if (showInTwoDigits) {
      finalString =
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    } else {
      finalString = '${hours}h ${minutes}m';
    }
    if (shrink) {
      if (finalString.contains(" 0m") || finalString.contains("0h ")) {
        finalString = finalString.replaceAll(" 0m", "");
        finalString = finalString.replaceAll("0h ", "");
      }
    }
    return finalString;
  }
}
