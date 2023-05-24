extension DateTimeExt on DateTime {
  DateTime getSundayThisWeek() {
    return subtract(Duration(days: weekday));
  }

  String formatForAPI() {
    final day = this.day;
    final month = this.month;
    final year = this.year;

    // reference: 2022-11-27T11:00:00.000Z
    return '$year-$month-${day}T11:00:00.000Z';
  }
}
