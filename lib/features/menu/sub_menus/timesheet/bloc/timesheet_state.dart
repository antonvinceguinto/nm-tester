part of 'timesheet_bloc.dart';

class TimesheetWeeklyState extends Equatable {
  const TimesheetWeeklyState({
    this.status = GenericRequestStatusEnum.initial,
    this.sheetWeeklyModel = ListWeeklySummaryModel.empty,
    this.errorMessage,
  });

  final ListWeeklySummaryModel sheetWeeklyModel;
  final GenericRequestStatusEnum status;
  final String? errorMessage;

  TimesheetWeeklyState copyWith({
    ListWeeklySummaryModel? sheetWeeklyModel,
    GenericRequestStatusEnum? status,
    String? errorMessage,
  }) {
    return TimesheetWeeklyState(
      sheetWeeklyModel: sheetWeeklyModel ?? this.sheetWeeklyModel,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        sheetWeeklyModel,
        status,
        errorMessage ?? '',
      ];
}
