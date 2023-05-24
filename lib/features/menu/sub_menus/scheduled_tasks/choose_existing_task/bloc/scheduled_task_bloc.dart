import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'scheduled_task_event.dart';
part 'scheduled_task_state.dart';

class ScheduledTaskBloc extends Bloc<ScheduledTaskEvent, ScheduledTaskState> {
  ScheduledTaskBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const ScheduledTaskState()) {
    on<ScheduledTaskFetchEvent>(_onFetch);
    on<OpenCalendarEvent>(_onOpenCalendarEvent);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  void _onOpenCalendarEvent(
    OpenCalendarEvent event,
    Emitter<ScheduledTaskState> emit,
  ) {
    emit(state.copyWith(isCalendarOpen: event.isOpen));
  }

  Future<void> _onFetch(
    ScheduledTaskFetchEvent event,
    Emitter<ScheduledTaskState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final taskListModel = await _nmRepositoryImpl.getExistingTasks(
      currPage: event.currPage,
      search: event.searchQuery,
      bookingStatus: event.bookingStatusIds,
      acceptanceStatus: event.acceptanceStatus,
      priorityIds: event.priorityIds,
      taskCategoryIds: event.taskCategoryIds,
      isExcludeArchive: event.isExcludeArchive,
      bookingClient: event.bookingClient,
      bookingContacts: event.bookingContacts,
      bookingCreatedByContacts: event.bookingCreatedBys,
      isFromJobs: event.isFromJobs,
      jobId: event.jobId,
      startDate: event.startDate,
      endDate: event.endDate,
      originDate: event.originDate,
      isArchived: event.isArchived,
    );

    taskListModel.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) async {
        final tempList = state.copyWith().taskListModel.data.toList();
        if (event.currPage == 1) tempList.clear();
        tempList.addAll(r.data);

        emit(
          state.copyWith(
            status: GenericRequestStatusEnum.success,
            searchQuery: event.searchQuery,
            taskListModel: TaskListModel(
              data: tempList,
              total: r.total,
              total_all: r.total_all,
              start_date: r.start_date,
              end_date: r.end_date,
            ),
            currPage: event.currPage,
          ),
        );
      },
    );
  }
}
