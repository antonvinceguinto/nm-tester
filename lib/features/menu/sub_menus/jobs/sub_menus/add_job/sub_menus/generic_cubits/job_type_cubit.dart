import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/job_generic_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

class JobTypeCubit extends Cubit<JobGenericState<FTypeModel>> {
  JobTypeCubit({required NMRepositoryImpl nmRepositoryImpl})
      : _nmRepositoryImpl = nmRepositoryImpl,
        super(const JobGenericState());

  final NMRepositoryImpl _nmRepositoryImpl;

  void markAsDeleted(FTypeModel jobType) {
    emit(
      state.copyWith(
        items: state.items?.map((e) {
          if (e == jobType) {
            return e.copyWith(isdeleted: true);
          }
          return e;
        }).toList(),
      ),
    );
  }

  void removeAddedItem(int jobsId) {
    emit(
      state.copyWith(
        items: state.items?.where((e) => (e.id ?? 0) != jobsId).toList(),
      ),
    );
  }

  void addNewItem() {
    emit(
      state.copyWith(
        items: [
          ...state.items ?? [],
          ...[
            FTypeModel(
              id: -1 * ((state.items?.length ?? 0) + 1),
              name: '',
              color: '#ffffff',
            )
          ],
        ],
      ),
    );
  }

  void updateItemName(FTypeModel jobType, String name) {
    emit(
      state.copyWith(
        items: state.items?.map((e) {
          if (e == jobType) {
            return e.copyWith(name: name);
          }
          return e;
        }).toList(),
      ),
    );
  }

  void updateItemColor(FTypeModel jobType, String color) {
    emit(
      state.copyWith(
        items: state.items?.map((e) {
          if (e == jobType) {
            return e.copyWith(color: color);
          }
          return e;
        }).toList(),
      ),
    );
  }

  Future<void> updateitems() async {
    emit(state.copyWith(saveStatus: SaveStatus.loading));

    await _nmRepositoryImpl.updateJobTypes(
      jobTypes: state.items ?? [],
    );

    emit(state.copyWith(saveStatus: SaveStatus.success));
  }

  void selectItem(FTypeModel jobType) {
    emit(state.copyWith(selectedItem: jobType));
  }

  void clearSelectedItems() {
    emit(const JobGenericState());
  }

  Future<void> fetchItems() async {
    emit(
      state.copyWith(
        status: GenericRequestStatusEnum.loading,
        saveStatus: SaveStatus.initial,
      ),
    );

    final res = await _nmRepositoryImpl.getJobTypeFilterList();

    res.fold(
      (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          saveStatus: SaveStatus.initial,
          items: r,
        ),
      ),
    );
  }
}
