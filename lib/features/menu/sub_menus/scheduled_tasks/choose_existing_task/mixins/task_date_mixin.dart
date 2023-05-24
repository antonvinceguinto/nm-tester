import 'package:api_service/api_service.dart';
import 'package:intl/intl.dart';

mixin TaskDateMixin {
  String _twoDigits(int n) => n.toString().padLeft(2, '');

  String getTaskDuration(Duration difference, {bool isSimple = false}) {
    final days = _twoDigits(difference.inDays);
    final hrs = _twoDigits(difference.inHours.remainder(24));
    final mins = _twoDigits(difference.inMinutes.remainder(60));

    final daysText = int.parse(days) > 1 ? 'Days' : 'Day';
    final hrsText = int.parse(hrs) > 1 ? 'Hrs' : 'Hr';

    final isDay0 = days == '0';
    final isHr0 = hrs == '0';
    final isMin0 = mins == '0';

    if (isSimple) {
      return '''${!isDay0 ? '${days}d' : ''}${!isDay0 && !isHr0 ? ',' : ''}${!isHr0 ? '${hrs}h' : ''}${!isHr0 && !isMin0 ? ',' : ''}${!isMin0 ? '${mins}m' : ''}''';
    }

    return '''${days != '0' ? '$days $daysText' : ''} ${hrs != '0' ? '$hrs $hrsText' : ''} ${mins != '0' ? '$mins Mins' : ''}''';
  }

  DateFormat getDateFormatter(TaskInfoLevelModel task, {bool isEnd = false}) {
    const formatPattern = 'EE d-MMM-yyyy h:mma';

    if (!isEnd) {
      return DateFormat(formatPattern);
    }

    DateFormat endFormatter;

    if (task.book_end!.toLocal().day == task.book_start!.toLocal().day) {
      endFormatter = DateFormat('h:mma');
    } else {
      endFormatter = DateFormat(formatPattern);
    }

    return endFormatter;
  }

  String getSelectedTaskDateFormatter(DateTime date, {bool hasTime = true}) {
    if (hasTime) {
      const formatPattern = 'EE d MMM yyyy h:mma';

      final formatter = DateFormat(formatPattern);

      return formatter.format(date);
    }

    const formatPattern = 'EE d MMM yyyy';

    final formatter = DateFormat(formatPattern);

    return formatter.format(date);
  }

  // DateFormat getSelectedTaskDateFormatter() {
  //   const formatPattern = 'd MMM yyyy h:mma';

  //   return DateFormat(formatPattern);
  // }
}
