import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/job_generic_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

class ImportanceCubit extends Cubit<JobGenericState<FPriorityModel>> {
  ImportanceCubit() : super(const JobGenericState());

  void selectItem(FPriorityModel jobType) {
    emit(state.copyWith(selectedItem: jobType));
  }

  void clearSelectedItems() {
    emit(const JobGenericState());
  }

  Future<void> fetchItems() async {
    emit(
      state.copyWith(
        status: GenericRequestStatusEnum.success,
        items: [
          const FPriorityModel(
            id: 2,
            name: 'Low',
            color: '#0000ff',
          ),
          const FPriorityModel(
            id: 0,
            name: 'Normal',
            color: '#ededed',
          ),
          const FPriorityModel(
            id: 1,
            name: 'High',
            color: '#ff0000',
          ),
        ],
      ),
    );
  }
}
