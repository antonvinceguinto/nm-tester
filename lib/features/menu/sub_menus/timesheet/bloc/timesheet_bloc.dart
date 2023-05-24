import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'timesheet_event.dart';
part 'timesheet_state.dart';

class TimesheetWeeklyBloc extends Bloc<TimesheetEvent, TimesheetWeeklyState> {
  TimesheetWeeklyBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const TimesheetWeeklyState()) {
    on<TimesheetFetchEvent>(_onTimesheetLoaded);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onTimesheetLoaded(
    TimesheetFetchEvent event,
    Emitter<TimesheetWeeklyState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.getSheetWeeklyResults(event.dateTime);

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          sheetWeeklyModel: r,
        ),
      ),
    );
  }
}
