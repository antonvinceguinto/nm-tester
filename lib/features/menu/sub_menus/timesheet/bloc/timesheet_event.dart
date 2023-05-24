part of 'timesheet_bloc.dart';

abstract class TimesheetEvent extends Equatable {
  const TimesheetEvent();
}

class TimesheetFetchEvent extends TimesheetEvent {
  const TimesheetFetchEvent(
    this.dateTime,
  );

  final DateTime dateTime;

  @override
  List<Object> get props => [dateTime];
}
