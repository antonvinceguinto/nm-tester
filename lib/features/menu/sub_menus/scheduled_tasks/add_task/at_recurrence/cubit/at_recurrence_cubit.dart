import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/recurrence_page.dart';
import 'package:rrule/rrule.dart';

part 'at_recurrence_state.dart';

class ATRecurrenceCubit extends Cubit<ATRecurrenceState> {
  ATRecurrenceCubit()
      : super(
          const ATRecurrenceState(
            currentRepeat: RecurrenceFrequency.never,
            everyDays: '1',
            endRepeatDays: '1',
            endRepeat: 'Never',
            monthlyRepeatOn: 'Day',
            monthlyDayDate: '1',
            monthlyTheRepeatOn: 'First',
            monthlyTheRepeatOnDay: 'Day',
            yearlyRepeatOn: 'Date',
            yearlyDateMonth: 'January',
            yearlyDateDay: '1',
            yearlyTheOn: 'First',
            yearlyTheDay: 'Day',
            yearlyTheMonth: 'January',
          ),
        );

  void updateFinalRecurrencePattern(String pattern) {
    emit(
      state.copyWith(
        finalRecurrencePattern: pattern,
        tempRecurrencePattern: pattern,
      ),
    );
  }

  void updateFinalRepeatText(String text) {
    emit(
      state.copyWith(
        finalRepeatText: text,
        tempRepeatText: text,
      ),
    );
  }

  void save() {
    final pattern = RecurrenceRule.fromString(state.tempRecurrencePattern);

    emit(
      state.copyWith(
        finalRecurrencePattern: pattern.toString(),
        finalRepeatText: state.tempRepeatText,
      ),
    );
  }

  Frequency get frequency {
    if (state.currentRepeat == RecurrenceFrequency.daily) {
      return Frequency.daily;
    } else if (state.currentRepeat == RecurrenceFrequency.weekly) {
      return Frequency.weekly;
    } else if (state.currentRepeat == RecurrenceFrequency.monthly) {
      return Frequency.monthly;
    } else if (state.currentRepeat == RecurrenceFrequency.yearly) {
      return Frequency.yearly;
    } else {
      return Frequency.daily;
    }
  }

  Future<void> _updateRepeatText() async {
    if (state.currentRepeat == RecurrenceFrequency.never) {
      emit(
        state.copyWith(
          tempRepeatText: '',
        ),
      );
      return;
    }

    try {
      var rrule = RecurrenceRule.fromString('RRULE:FREQ=DAILY');

      if (state.currentRepeat == RecurrenceFrequency.daily) {
        switch (state.endRepeat) {
          case 'Never':
            rrule = RecurrenceRule(
              frequency: frequency,
              interval: int.tryParse(state.everyDays),
            );
            break;
          case 'After':
            rrule = RecurrenceRule(
              frequency: frequency,
              interval: int.tryParse(state.everyDays),
              count: int.tryParse(state.endRepeatDays),
            );
            break;
          case 'On':
            if (state.endRepeatDate == null) return;
            rrule = RecurrenceRule(
              frequency: frequency,
              interval: int.tryParse(state.everyDays),
              until: DateTime.utc(
                state.endRepeatDate!.year,
                state.endRepeatDate!.month,
                state.endRepeatDate!.day,
              ),
            );
            break;
        }
      } else if (state.currentRepeat == RecurrenceFrequency.weekly) {
        switch (state.endRepeat) {
          case 'Never':
            rrule = RecurrenceRule(
              frequency: frequency,
              interval: int.tryParse(state.everyDays),
              byWeekDays: {
                for (var day in state.weeklyCurrentRepeats)
                  ByWeekDayEntry(getWeekDayNumber(day))
              },
            );
            break;
          case 'After':
            rrule = RecurrenceRule(
              frequency: frequency,
              interval: int.tryParse(state.everyDays),
              count: int.tryParse(state.endRepeatDays),
              byWeekDays: {
                for (var day in state.weeklyCurrentRepeats)
                  ByWeekDayEntry(getWeekDayNumber(day))
              },
            );
            break;
          case 'On':
            if (state.endRepeatDate == null) return;
            rrule = RecurrenceRule(
              frequency: frequency,
              interval: int.tryParse(state.everyDays),
              until: DateTime.utc(
                state.endRepeatDate!.year,
                state.endRepeatDate!.month,
                state.endRepeatDate!.day,
              ),
              byWeekDays: {
                for (var day in state.weeklyCurrentRepeats)
                  ByWeekDayEntry(getWeekDayNumber(day))
              },
            );
            break;
        }
      } else if (state.currentRepeat == RecurrenceFrequency.monthly) {
        if (state.monthlyRepeatOn == 'Day') {
          switch (state.endRepeat) {
            case 'Never':
              rrule = RecurrenceRule(
                frequency: Frequency.monthly,
                interval: int.tryParse(state.everyDays),
                byMonthDays: {int.tryParse(state.monthlyDayDate)!},
              );
              break;
            case 'After':
              rrule = RecurrenceRule(
                frequency: frequency,
                interval: int.tryParse(state.everyDays),
                count: int.tryParse(state.endRepeatDays),
                byMonthDays: {int.tryParse(state.monthlyDayDate)!},
              );
              break;
            case 'On':
              if (state.endRepeatDate == null) return;
              rrule = RecurrenceRule(
                frequency: frequency,
                interval: int.tryParse(state.everyDays),
                until: DateTime.utc(
                  state.endRepeatDate!.year,
                  state.endRepeatDate!.month,
                  state.endRepeatDate!.day,
                ),
                byMonthDays: {int.tryParse(state.monthlyDayDate)!},
              );
              break;
          }
        } else {
          switch (state.endRepeat) {
            case 'Never':
              rrule = RecurrenceRule(
                frequency: Frequency.monthly,
                interval: int.tryParse(state.everyDays),
                // byMonthDays: {getTextToNumber(state.monthlyTheRepeatOn)},
                bySetPositions: {getTextToNumber(state.monthlyTheRepeatOn)},
                byWeekDays: {
                  if (state.monthlyTheRepeatOnDay == 'Day')
                    ...{}
                  else if (state.monthlyTheRepeatOnDay == 'Week Day') ...{
                    ByWeekDayEntry(1),
                    ByWeekDayEntry(2),
                    ByWeekDayEntry(3),
                    ByWeekDayEntry(4),
                    ByWeekDayEntry(5),
                  } else if (state.monthlyTheRepeatOnDay == 'Weekend Day') ...{
                    ByWeekDayEntry(6),
                    ByWeekDayEntry(7),
                  } else ...{
                    ByWeekDayEntry(
                      getWeekDayNumber(state.monthlyTheRepeatOnDay),
                    ),
                  }
                },
              );
              break;
            case 'After':
              rrule = RecurrenceRule(
                frequency: frequency,
                interval: int.tryParse(state.everyDays),
                count: int.tryParse(state.endRepeatDays),
                byMonthDays: {getTextToNumber(state.monthlyTheRepeatOn)},
                byWeekDays: {
                  if (state.monthlyTheRepeatOnDay == 'Day')
                    ...{}
                  else if (state.monthlyTheRepeatOnDay == 'Week Day') ...{
                    ByWeekDayEntry(1),
                    ByWeekDayEntry(2),
                    ByWeekDayEntry(3),
                    ByWeekDayEntry(4),
                    ByWeekDayEntry(5),
                  } else if (state.monthlyTheRepeatOnDay == 'Weekend Day') ...{
                    ByWeekDayEntry(6),
                    ByWeekDayEntry(7),
                  } else ...{
                    ByWeekDayEntry(
                      getWeekDayNumber(state.monthlyTheRepeatOnDay),
                    ),
                  }
                },
              );
              break;
            case 'On':
              if (state.endRepeatDate == null) return;
              rrule = RecurrenceRule(
                frequency: frequency,
                interval: int.tryParse(state.everyDays),
                until: DateTime.utc(
                  state.endRepeatDate!.year,
                  state.endRepeatDate!.month,
                  state.endRepeatDate!.day,
                ),
                byMonthDays: {getTextToNumber(state.monthlyTheRepeatOn)},
                byWeekDays: {
                  if (state.monthlyTheRepeatOnDay == 'Day')
                    ...{}
                  else if (state.monthlyTheRepeatOnDay == 'Week Day') ...{
                    ByWeekDayEntry(1),
                    ByWeekDayEntry(2),
                    ByWeekDayEntry(3),
                    ByWeekDayEntry(4),
                    ByWeekDayEntry(5),
                  } else if (state.monthlyTheRepeatOnDay == 'Weekend Day') ...{
                    ByWeekDayEntry(6),
                    ByWeekDayEntry(7),
                  } else ...{
                    ByWeekDayEntry(
                      getWeekDayNumber(state.monthlyTheRepeatOnDay),
                    ),
                  }
                },
              );
              break;
          }
        }
      } else if (state.currentRepeat == RecurrenceFrequency.yearly) {
        if (state.yearlyRepeatOn == 'Date') {
          switch (state.endRepeat) {
            case 'Never':
              rrule = RecurrenceRule(
                frequency: Frequency.yearly,
                interval: int.tryParse(state.everyDays),
                byMonths: {getMonthNumber(state.yearlyDateMonth)},
                byMonthDays: {int.tryParse(state.yearlyDateDay) ?? 1},
              );
              break;
            case 'After':
              rrule = RecurrenceRule(
                frequency: Frequency.yearly,
                interval: int.tryParse(state.everyDays),
                count: int.tryParse(state.endRepeatDays),
                byMonths: {getMonthNumber(state.yearlyDateMonth)},
                byMonthDays: {int.tryParse(state.yearlyDateDay) ?? 1},
              );
              break;
            case 'On':
              if (state.endRepeatDate == null) return;
              rrule = RecurrenceRule(
                frequency: Frequency.yearly,
                interval: int.tryParse(state.everyDays),
                until: DateTime.utc(
                  state.endRepeatDate!.year,
                  state.endRepeatDate!.month,
                  state.endRepeatDate!.day,
                ),
                byMonths: {getMonthNumber(state.yearlyDateMonth)},
                byMonthDays: {int.tryParse(state.yearlyDateDay) ?? 1},
              );
              break;
          }
        } else {
          switch (state.endRepeat) {
            case 'Never':
              rrule = RecurrenceRule(
                frequency: Frequency.yearly,
                interval: int.tryParse(state.everyDays),
                // byMonthDays: {getTextToNumber(state.yearlyTheOn)},
                bySetPositions: {getTextToNumber(state.yearlyTheOn)},
                byMonths: {getMonthNumber(state.yearlyTheMonth)},
                byWeekDays: {
                  if (state.yearlyTheDay == 'Day')
                    ...{}
                  else if (state.yearlyTheDay == 'Week Day') ...{
                    ByWeekDayEntry(1),
                    ByWeekDayEntry(2),
                    ByWeekDayEntry(3),
                    ByWeekDayEntry(4),
                    ByWeekDayEntry(5),
                  } else if (state.yearlyTheDay == 'Weekend Day') ...{
                    ByWeekDayEntry(6),
                    ByWeekDayEntry(7),
                  } else ...{
                    ByWeekDayEntry(
                      getWeekDayNumber(state.yearlyTheDay),
                    ),
                  }
                },
              );
              break;
            case 'After':
              break;
            case 'On':
              if (state.endRepeatDate == null) return;

              break;
          }
        }
      }

      final l10n = await RruleL10nEn.create();
      final pattern = RecurrenceRule.fromString(rrule.toString());
      final ruleText = rrule.toText(l10n: l10n);

      log(ruleText, name: 'ruleText');

      final untilIndex = ruleText.indexOf('until');
      var formattedUntilString = '';

      if (untilIndex != -1) {
        // Extract the substring before "until"
        var untilString = ruleText.substring(0, untilIndex).trim();

        untilString =
            untilString.replaceAll(RegExp(r'\d{2}:\d{2}:\d{2} [AP]M'), '');

        formattedUntilString =
            '''$untilString until ${DateFormat('MMMM').format(state.endRepeatDate!)} ${state.endRepeatDate?.day}, ${state.endRepeatDate?.year}''';

        log(formattedUntilString, name: 'updatedString');
      }

      emit(
        state.copyWith(
          tempRecurrencePattern: pattern.toString(),
          tempRepeatText:
              formattedUntilString.isEmpty ? ruleText : formattedUntilString,
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  int getMonthNumber(String month) {
    switch (month) {
      case 'January':
        return 1;
      case 'February':
        return 2;
      case 'March':
        return 3;
      case 'April':
        return 4;
      case 'May':
        return 5;
      case 'June':
        return 6;
      case 'July':
        return 7;
      case 'August':
        return 8;
      case 'September':
        return 9;
      case 'October':
        return 10;
      case 'November':
        return 11;
      case 'December':
        return 12;
      default:
        return 0;
    }
  }

  int getWeekDayNumber(String day) {
    switch (day) {
      case 'Mon':
        return 1;
      case 'Monday':
        return 1;
      case 'Tue':
        return 2;
      case 'Tuesday':
        return 2;
      case 'Wed':
        return 3;
      case 'Wednesday':
        return 3;
      case 'Thu':
        return 4;
      case 'Thursday':
        return 4;
      case 'Fri':
        return 5;
      case 'Friday':
        return 5;
      case 'Sat':
        return 6;
      case 'Saturday':
        return 6;
      case 'Sun':
        return 7;
      case 'Sunday':
        return 7;
      default:
        return 0;
    }
  }

  int getTextToNumber(String repeatOn) {
    switch (repeatOn) {
      case 'First':
        return 1;
      case 'Second':
        return 2;
      case 'Third':
        return 3;
      case 'Fourth':
        return 4;
      case 'Last':
        return -1;
      default:
        return 0;
    }
  }

  bool hasError() {
    return _isEveryDaysHasError() ||
        _isWeeklyRepeatOnHasError() ||
        _isMonthlyRepeatOnHasError() ||
        _isYearlyDateDayHasError() ||
        _isEndRepeatDaysHasError();
  }

  bool _isEndRepeatDaysHasError() {
    if (state.endRepeat == 'After') {
      return state.endRepeatDays.isEmpty ||
          int.tryParse(state.endRepeatDays) == null ||
          int.parse(state.endRepeatDays) < 1;
    }

    if (state.endRepeat == 'On') {
      return state.endRepeatDate == null;
    }

    return false;
  }

  bool _isWeeklyRepeatOnHasError() {
    if (state.currentRepeat == RecurrenceFrequency.weekly) {
      return state.weeklyCurrentRepeats.isEmpty;
    } else {
      return false;
    }
  }

  bool _isYearlyDateDayHasError() {
    if (state.currentRepeat == RecurrenceFrequency.yearly &&
        state.yearlyRepeatOn == 'Date') {
      return state.yearlyDateDay.isEmpty ||
          int.tryParse(state.yearlyDateDay) == null ||
          !_isDayOkay(int.parse(state.yearlyDateDay));
    } else {
      return false;
    }
  }

  bool _isEveryDaysHasError() {
    return state.everyDays.isEmpty ||
        int.tryParse(state.everyDays) == null ||
        int.parse(state.everyDays) < 1;
  }

  bool _isMonthlyRepeatOnHasError() {
    if (state.currentRepeat == RecurrenceFrequency.monthly &&
        state.monthlyRepeatOn == 'Day') {
      return state.monthlyDayDate.isEmpty ||
          int.tryParse(state.monthlyDayDate) == null ||
          !_isDayOkay(int.parse(state.monthlyDayDate));
    } else {
      return false;
    }
  }

  bool _isDayOkay(int day) {
    return day >= 1 && day <= 31;
  }

  void onEndRepeatInput(String value) {
    emit(state.copyWith(endRepeatDays: value));
    _updateRepeatText();
  }

  void onYearlyTheMonthSelected(String value) {
    emit(state.copyWith(yearlyTheMonth: value));
    _updateRepeatText();
  }

  void onYearlyTheDaySelected(String value) {
    emit(state.copyWith(yearlyTheDay: value));
    _updateRepeatText();
  }

  void onYearlyTheOnSelected(String value) {
    emit(state.copyWith(yearlyTheOn: value));
    _updateRepeatText();
  }

  void onYearlyDateDayInput(String value) {
    emit(state.copyWith(yearlyDateDay: value));
    _updateRepeatText();
  }

  void onYearlyDateMonthSelected(String value) {
    emit(state.copyWith(yearlyDateMonth: value));
    _updateRepeatText();
  }

  void onYearlyRepeatOnSelected(String value) {
    emit(state.copyWith(yearlyRepeatOn: value));
    _updateRepeatText();
  }

  void onMonthlyTheRepeatOnDaySelected(String value) {
    emit(state.copyWith(monthlyTheRepeatOnDay: value));
    _updateRepeatText();
  }

  void onMonthlyDayDateInput(String value) {
    emit(state.copyWith(monthlyDayDate: value));
    _updateRepeatText();
  }

  void onMonthlyTheRepeatOnSelected(String value) {
    emit(state.copyWith(monthlyTheRepeatOn: value));
    _updateRepeatText();
  }

  void onMonthlyRepeatOnSelected(String value) {
    emit(state.copyWith(monthlyRepeatOn: value));
    _updateRepeatText();
  }

  void onCurrentRepeatSelected(RecurrenceFrequency value) {
    emit(state.copyWith(currentRepeat: value));
    _updateRepeatText();
  }

  void onEndRepeatSelected(String value) {
    emit(state.copyWith(endRepeat: value));
    _updateRepeatText();
  }

  void onWeeklyRepeatOnChanged(String value) {
    if (state.weeklyCurrentRepeats.contains(value)) {
      emit(
        state.copyWith(
          weeklyCurrentRepeats: state.weeklyCurrentRepeats
              .where((element) => element != value)
              .toList(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          weeklyCurrentRepeats: [...state.weeklyCurrentRepeats, value],
        ),
      );
    }

    _updateRepeatText();
  }

  void onEveryDaysInput(String value) {
    emit(state.copyWith(everyDays: value));
    _updateRepeatText();
  }

  void updateEndRepeatDate(DateTime date) {
    emit(state.copyWith(endRepeatDate: date));
    _updateRepeatText();
  }

  void clear() {
    emit(
      const ATRecurrenceState(
        currentRepeat: RecurrenceFrequency.never,
        everyDays: '1',
        endRepeatDays: '1',
        endRepeat: 'Never',
        monthlyRepeatOn: 'Day',
        monthlyDayDate: '1',
        monthlyTheRepeatOn: 'First',
        monthlyTheRepeatOnDay: 'Day',
        yearlyRepeatOn: 'Date',
        yearlyDateMonth: 'January',
        yearlyDateDay: '1',
        yearlyTheOn: 'First',
        yearlyTheDay: 'Day',
        yearlyTheMonth: 'January',
      ),
    );
  }
}
