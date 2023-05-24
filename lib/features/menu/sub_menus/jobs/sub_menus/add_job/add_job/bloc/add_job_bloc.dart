import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'add_job_event.dart';
part 'add_job_state.dart';

class AddJobBloc extends Bloc<AddJobEvent, AddJobState> {
  AddJobBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const AddJobState()) {
    on<AddNewJobEvent>(_onAddJobEvent);
    on<AddExistingTask>(_onAddExistingTask);
    on<RemoveSelectedTask>(_onRemoveSelectedTask);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  void _onRemoveSelectedTask(
    RemoveSelectedTask event,
    Emitter<AddJobState> emit,
  ) {
    emit(const AddJobState());
  }

  void _onAddExistingTask(
    AddExistingTask event,
    Emitter<AddJobState> emit,
  ) {
    emit(
      state.copyWith(
        selectedTask: event.selectedTask,
      ),
    );
  }

  Future<void> _onAddJobEvent(
    AddNewJobEvent event,
    Emitter<AddJobState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final response = await _nmRepositoryImpl.addNewJob(
      job: event.job,
      isUpdate: event.isUpdate,
      jobId: event.jobId,
    );

    response.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(state.copyWith(status: GenericRequestStatusEnum.success)),
    );
  }
}
