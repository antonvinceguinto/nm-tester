import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'task_filter_event.dart';
part 'task_filter_state.dart';

class TaskFilterBloc extends Bloc<TaskFilterEvent, TaskFilterState> {
  TaskFilterBloc() : super(const TaskFilterState()) {
    // on<TaskFilterCustomerSelectedEvent>(_selectCustomerEvent);
    on<TaskFilterSelectPriorityEvent>(_selectPriorityEvent);
    on<TaskFilterSelectStatusEvent>(_selectTaskStatusEvent);
    on<TaskFilterSelectAcceptanceStatusEvent>(_selectAcceptanceStatusEvent);
    on<TaskFilterSelectCategoryEvent>(_selectCategoryEvent);
    on<ToggleExcludeArchiveEvent>(_onToggleExcludeEvent);
    on<ClearTaskFiltersEvent>(_onClearEvent);
  }

  void _onToggleExcludeEvent(
    ToggleExcludeArchiveEvent event,
    Emitter<TaskFilterState> emit,
  ) {
    emit(state.copyWith(isExcludeArchive: !state.isExcludeArchive));
  }

  void _onClearEvent(
    ClearTaskFiltersEvent event,
    Emitter<TaskFilterState> emit,
  ) {
    emit(const TaskFilterState());
  }

  void _selectCategoryEvent(
    TaskFilterSelectCategoryEvent event,
    Emitter<TaskFilterState> emit,
  ) {
    if (state.selectedCategories?.contains(event.selectedCategory) ?? false) {
      emit(
        state.copyWith(
          selectedCategories: [
            ...state.selectedCategories
                    ?.where((element) => element != event.selectedCategory)
                    .toList() ??
                [],
          ],
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        selectedCategories: [
          ...state.selectedCategories ?? [],
          event.selectedCategory,
        ],
      ),
    );
  }

  void _selectAcceptanceStatusEvent(
    TaskFilterSelectAcceptanceStatusEvent event,
    Emitter<TaskFilterState> emit,
  ) {
    if (state.selectedAcceptanceStatuses?.contains(event.selectedStatus) ??
        false) {
      emit(
        state.copyWith(
          selectedAcceptanceStatuses: [
            ...state.selectedAcceptanceStatuses
                    ?.where((element) => element != event.selectedStatus)
                    .toList() ??
                [],
          ],
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        selectedAcceptanceStatuses: [
          ...state.selectedAcceptanceStatuses ?? [],
          event.selectedStatus,
        ],
      ),
    );
  }

  void _selectTaskStatusEvent(
    TaskFilterSelectStatusEvent event,
    Emitter<TaskFilterState> emit,
  ) {
    if (state.selectedTaskStatuses?.contains(event.selectedTaskStatus) ??
        false) {
      emit(
        state.copyWith(
          selectedTaskStatuses: [
            ...state.selectedTaskStatuses
                    ?.where((element) => element != event.selectedTaskStatus)
                    .toList() ??
                [],
          ],
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        selectedTaskStatuses: [
          ...state.selectedTaskStatuses ?? [],
          event.selectedTaskStatus,
        ],
      ),
    );
  }

  void _selectPriorityEvent(
    TaskFilterSelectPriorityEvent event,
    Emitter<TaskFilterState> emit,
  ) {
    if (state.selectedPriorities?.contains(event.selectedPriority) ?? false) {
      emit(
        state.copyWith(
          selectedPriorities: [
            ...state.selectedPriorities
                    ?.where((element) => element != event.selectedPriority)
                    .toList() ??
                [],
          ],
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        selectedPriorities: [
          ...state.selectedPriorities ?? [],
          event.selectedPriority,
        ],
      ),
    );
  }

  // void _selectCustomerEvent(
  //   TaskFilterCustomerSelectedEvent event,
  //   Emitter<TaskFilterState> emit,
  // ) {
  //   if (event.isRemove) {
  //     final selectedCustomers = state.selectedCustomers
  //             ?.where((element) => element != event.customer)
  //             .toList() ??
  //         [];
  //     final selectedAssignedTos = state.selectedAssignedTos
  //             ?.where((element) => element != event.customer)
  //             .toList() ??
  //         [];
  //     final selectedCreatedBys = state.selectedCreatedBys
  //             ?.where((element) => element != event.customer)
  //             .toList() ??
  //         [];
  //     emit(
  //       state.copyWith(
  //         selectedCustomers: selectedCustomers,
  //         selectedAssignedTos: selectedAssignedTos,
  //         selectedCreatedBys: selectedCreatedBys,
  //       ),
  //     );
  //     return;
  //   }

  //   List<CustomerDatum> selectedList;
  //   if (event.isCreatedBy) {
  //     if (state.selectedCreatedBys?.contains(event.customer) ?? false) {
  //       return;
  //     }
  //     selectedList = event.isClear
  //         ? []
  //         : [...state.selectedCreatedBys ?? [], event.customer];
  //     emit(
  //       state.copyWith(
  //         selectedCreatedBys: selectedList,
  //       ),
  //     );
  //     return;
  //   }

  //   if (event.isAssignedTo) {
  //     if (state.selectedAssignedTos?.contains(event.customer) ?? false) {
  //       return;
  //     }
  //     selectedList = event.isClear
  //         ? []
  //         : [...state.selectedAssignedTos ?? [], event.customer];
  //     emit(
  //       state.copyWith(
  //         selectedAssignedTos: selectedList,
  //       ),
  //     );
  //     return;
  //   }

  //   if (state.selectedCustomers?.contains(event.customer) ?? false) {
  //     return;
  //   }
  //   selectedList =
  //       event.isClear ? [] : [...state.selectedCustomers ?? [], event.customer];
  //   emit(
  //     state.copyWith(
  //       selectedCustomers: selectedList,
  //     ),
  //   );
  // }
}
