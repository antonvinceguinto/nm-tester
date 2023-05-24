import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';

extension IntExt on int {
  String formatMonth() {
    // Switch case datetime months
    switch (this) {
      case DateTime.january:
        return 'Jan';
      case DateTime.february:
        return 'Feb';
      case DateTime.march:
        return 'Mar';
      case DateTime.april:
        return 'Apr';
      case DateTime.may:
        return 'May';
      case DateTime.june:
        return 'Jun';
      case DateTime.july:
        return 'Jul';
      case DateTime.august:
        return 'Aug';
      case DateTime.september:
        return 'Sep';
      case DateTime.october:
        return 'Oct';
      case DateTime.november:
        return 'Nov';
      case DateTime.december:
        return 'Dec';
      default:
        return 'Jan';
    }
  }

  String formatDay() {
    switch (this) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }
}

extension DateTimeExt on DateTime {
  DateTime getSundayThisWeek() {
    return subtract(Duration(days: weekday));
  }

  DateTime getFirstDayOfTheMonth() {
    return DateTime(year, month);
  }

  DateTime getNextWeekSaturday() {
    return add(Duration(days: 6 - weekday + 7));
  }

  DateTime getPreviousSaturdayThisWeek() {
    return subtract(Duration(days: weekday + 1));
  }

  DateTime getSaturdayThisWeek() {
    return add(Duration(days: 6 - weekday));
  }

  String formatForAPI() {
    final day = this.day;
    final month = this.month;
    final year = this.year;

    // reference: 2022-11-27T11:00:00.000Z
    return '$year-$month-${day}T11:00:00.000Z';
  }

  String formatReadable() {
    final weekday = this.weekday.formatDay();
    final day = this.day;
    final month = this.month;
    final year = this.year;

    final formattedDate = '$weekday $day ${month.formatMonth()} $year';

    return formattedDate;
  }

  String formatToStartEndTime() {
    final formatter = DateFormat('d MMM. yyyy -').add_jm();

    final dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(toString(), true);
    final dateLocal = dateTime.toLocal();

    return formatter.format(dateLocal);
  }

  // Formats Start and End time for Job Details
  String formatSEJobDetails({bool hasTime = true}) {
    final formatter = DateFormat('EE d MMM yyyy ').add_jm();

    final dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(toString(), true);

    final dateLocal = dateTime.toLocal();

    if (hasTime) {
      return formatter.format(dateLocal);
    } else {
      return DateFormat('EE d MMM. yyyy').format(dateLocal);
    }
  }

  String jobItemStyle() {
    final dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(toString(), true);

    final dateLocal = dateTime.toLocal();

    return DateFormat('EE d MMM. yyyy').format(dateLocal);
  }

  String formatToFilterStyle() {
    final formatter = DateFormat('dd/MM/yyyy');

    final dateTime = formatter.format(this);

    return dateTime;
  }

  String formatTaskFilter({bool hasYear = false}) {
    final formatter = DateFormat('EE d MMMM');

    if (hasYear) {
      formatter.add_y();
    }

    return formatter.format(this);
  }

  DateTime getFirstDayOfMonth() {
    return DateTime(year, month);
  }

  DateTime getLastDayOfMonth() {
    return DateTime(year, month + 1, 0);
  }

  bool isSameDateAs(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameWeekAs(DateTime other) {
    final startOfWeek = subtract(
      Duration(days: weekday - DateTime.monday),
    );
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    return other.isAfter(startOfWeek) ||
        other.isAtSameMomentAs(startOfWeek) &&
            (other.isBefore(endOfWeek) || other.isAtSameMomentAs(endOfWeek));
  }

  bool isLastWeekOfToday() {
    final today = DateTime.now();
    final startOfLastWeek = today.subtract(Duration(days: today.weekday + 6));
    final endOfLastWeek = startOfLastWeek.add(const Duration(days: 6));

    return isAfter(startOfLastWeek) ||
        isAtSameMomentAs(startOfLastWeek) &&
            (isBefore(endOfLastWeek) || isAtSameMomentAs(endOfLastWeek));
  }
}

extension DoubleExt on double {
  String formatTo2Decimal() {
    return toStringAsFixed(truncateToDouble() == this ? 0 : 2);
  }

  String convertToHours() {
    return (this / 60).formatTo2Decimal();
  }

  String toCommaString() {
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String mathFunc(Match match) => '${match[1]},';
    return toStringAsFixed(2).replaceAllMapped(reg, mathFunc);
  }
}

extension StringExt on String {
  int toHexColor() {
    final formatted = '''FF${substring(1)}''';

    return int.parse(formatted, radix: 16);
  }

  String capitalizeFirstLetter() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension ColorExt on Color {
  bool isDark() =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.dark;
}

extension WidgetExt on Widget {
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: this,
    );
  }

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }
}

extension BuildContextExt on BuildContext {
  bool get isDarkMode => read<TabCubit>().isDarkMode;
}

extension TextExt on Text {
  Text fontSize(double size) {
    return Text(
      data!,
      textAlign: textAlign,
      style: style?.copyWith(fontSize: size) ?? TextStyle(fontSize: size),
    );
  }

  Text color(Color color) {
    return Text(
      data!,
      textAlign: textAlign,
      style: style?.copyWith(color: color) ?? TextStyle(color: color),
    );
  }

  Text bold() {
    return Text(
      data!,
      textAlign: textAlign,
      style: style?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

extension MapUtils<K, V> on Map<K, V> {
  void updateOrRemove(K key, List<V> values, V Function(List<V>) ifNotEmpty) {
    if (values.isNotEmpty) {
      this[key] = ifNotEmpty(values);
    } else {
      remove(key);
    }
  }
}
