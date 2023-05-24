part of 'at_recurrence_cubit.dart';

class ATRecurrenceState extends Equatable {
  const ATRecurrenceState({
    this.endRepeatDate,
    required this.currentRepeat,
    required this.everyDays,
    required this.endRepeat,
    required this.endRepeatDays,
    this.weeklyCurrentRepeats = const [],
    required this.monthlyRepeatOn,
    required this.monthlyDayDate,
    required this.monthlyTheRepeatOn,
    required this.monthlyTheRepeatOnDay,
    required this.yearlyRepeatOn,
    required this.yearlyDateMonth,
    required this.yearlyDateDay,
    required this.yearlyTheOn,
    required this.yearlyTheDay,
    required this.yearlyTheMonth,
    this.tempRecurrencePattern = '',
    this.finalRecurrencePattern = '',
    this.finalRepeatText = '',
    this.tempRepeatText = '',
  });

  final DateTime? endRepeatDate;

  final RecurrenceFrequency currentRepeat;

  final String everyDays;
  final String endRepeat;
  final String endRepeatDays;
  final List<String> weeklyCurrentRepeats;

  final String monthlyRepeatOn;
  final String monthlyDayDate;
  final String monthlyTheRepeatOn;
  final String monthlyTheRepeatOnDay;

  final String yearlyRepeatOn;
  final String yearlyDateMonth;
  final String yearlyDateDay;
  final String yearlyTheOn;
  final String yearlyTheDay;
  final String yearlyTheMonth;

  final String tempRecurrencePattern;
  final String finalRecurrencePattern;
  final String finalRepeatText;
  final String tempRepeatText;

  ATRecurrenceState copyWith({
    RecurrenceFrequency? currentRepeat,
    String? everyDays,
    String? endRepeatDays,
    DateTime? endRepeatDate,
    String? endRepeat,
    List<String>? weeklyCurrentRepeats,
    String? monthlyRepeatOn,
    String? monthlyDayDate,
    String? monthlyTheRepeatOn,
    String? monthlyTheRepeatOnDay,
    String? yearlyRepeatOn,
    String? yearlyDateMonth,
    String? yearlyDateDay,
    String? yearlyTheOn,
    String? yearlyTheDay,
    String? yearlyTheMonth,
    String? tempRecurrencePattern,
    String? finalRecurrencePattern,
    String? finalRepeatText,
    String? tempRepeatText,
  }) {
    return ATRecurrenceState(
      currentRepeat: currentRepeat ?? this.currentRepeat,
      everyDays: everyDays ?? this.everyDays,
      endRepeatDays: endRepeatDays ?? this.endRepeatDays,
      endRepeatDate: endRepeatDate ?? this.endRepeatDate,
      endRepeat: endRepeat ?? this.endRepeat,
      weeklyCurrentRepeats: weeklyCurrentRepeats ?? this.weeklyCurrentRepeats,
      monthlyRepeatOn: monthlyRepeatOn ?? this.monthlyRepeatOn,
      monthlyDayDate: monthlyDayDate ?? this.monthlyDayDate,
      monthlyTheRepeatOn: monthlyTheRepeatOn ?? this.monthlyTheRepeatOn,
      monthlyTheRepeatOnDay:
          monthlyTheRepeatOnDay ?? this.monthlyTheRepeatOnDay,
      yearlyRepeatOn: yearlyRepeatOn ?? this.yearlyRepeatOn,
      yearlyDateMonth: yearlyDateMonth ?? this.yearlyDateMonth,
      yearlyDateDay: yearlyDateDay ?? this.yearlyDateDay,
      yearlyTheOn: yearlyTheOn ?? this.yearlyTheOn,
      yearlyTheDay: yearlyTheDay ?? this.yearlyTheDay,
      yearlyTheMonth: yearlyTheMonth ?? this.yearlyTheMonth,
      tempRecurrencePattern:
          tempRecurrencePattern ?? this.tempRecurrencePattern,
      finalRecurrencePattern:
          finalRecurrencePattern ?? this.finalRecurrencePattern,
      finalRepeatText: finalRepeatText ?? this.finalRepeatText,
      tempRepeatText: tempRepeatText ?? this.tempRepeatText,
    );
  }

  @override
  List<Object> get props => [
        currentRepeat,
        everyDays,
        endRepeatDays,
        endRepeatDate ?? DateTime.now(),
        endRepeat,
        weeklyCurrentRepeats,
        monthlyRepeatOn,
        monthlyDayDate,
        monthlyTheRepeatOn,
        monthlyTheRepeatOnDay,
        yearlyRepeatOn,
        yearlyDateMonth,
        yearlyDateDay,
        yearlyTheOn,
        yearlyTheDay,
        yearlyTheMonth,
        tempRecurrencePattern,
        finalRepeatText,
        tempRepeatText,
      ];
}
