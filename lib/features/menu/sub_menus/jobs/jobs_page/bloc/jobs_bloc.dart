import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_event.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const JobsState()) {
    on<JobsFetchEvent>(_onFetchEvent);
    on<SelectAllJobsEvent>(_onSelectAllJobsEvent);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onSelectAllJobsEvent(
    SelectAllJobsEvent event,
    Emitter<JobsState> emit,
  ) async {
    // Retrieve the total number of jobs from the current state.
    final totalJobs = state.jobs.total_all;

    // Calculate the rounded total number of jobs by dividing the
    // totalJobs by 20, rounding down to the nearest whole number,
    // and then multiplying it by 20. This gives the total number of
    // jobs that can be fetched in increments of 20.
    final roundedTotalJobs = (totalJobs / 20).floor() * 20;

    for (var i = state.currentSkip; i < roundedTotalJobs; i += 20) {
      await _onFetchEvent(
        JobsFetchEvent(skip: i),
        emit,
      );
    }

    event.qfc.selectAllJobsFromJobsPage(state.jobsList ?? []);
  }

  Future<void> _onFetchEvent(
    JobsFetchEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.getJobsList(
      event.filterData,
      event.search,
      event.take,
      event.skip,
    );

    res.fold(
        (l) => emit(
              state.copyWith(
                status: GenericRequestStatusEnum.error,
                errorMessage: l.toString(),
              ),
            ), (r) async {
      final tempList = state.jobsList ?? [];
      if (event.skip == 0) tempList.clear();
      tempList.addAll(r.data);

      emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          currentSkip: event.skip + event.take,
          jobsList: tempList,
          jobs: JobsListModel(
            total_all: r.total_all,
            total: r.total,
            sync_date: r.sync_date,
            data: tempList,
          ),
        ),
      );
    });
  }
}
