part of 'task_filter_bloc.dart';

class TaskFilterState extends Equatable {
  const TaskFilterState({
    this.selectedPriorities,
    this.selectedTaskStatuses,
    this.selectedAcceptanceStatuses,
    this.selectedCategories,
    this.isExcludeArchive = false,
  });

  final List<FPriorityModel>? selectedPriorities;
  final List<TaskStatusModel>? selectedTaskStatuses;
  final List<AcceptanceStatusModel>? selectedAcceptanceStatuses;
  final List<CategoryFilterModel>? selectedCategories;
  final bool isExcludeArchive;

  TaskFilterState copyWith({
    List<CustomerDatum>? selectedCustomers,
    List<CustomerDatum>? selectedAssignedTos,
    List<CustomerDatum>? selectedCreatedBys,
    List<FPriorityModel>? selectedPriorities,
    List<TaskStatusModel>? selectedTaskStatuses,
    List<AcceptanceStatusModel>? selectedAcceptanceStatuses,
    List<CategoryFilterModel>? selectedCategories,
    bool? isExcludeArchive,
  }) {
    return TaskFilterState(
      selectedPriorities: selectedPriorities ?? this.selectedPriorities,
      selectedTaskStatuses: selectedTaskStatuses ?? this.selectedTaskStatuses,
      selectedAcceptanceStatuses:
          selectedAcceptanceStatuses ?? this.selectedAcceptanceStatuses,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      isExcludeArchive: isExcludeArchive ?? this.isExcludeArchive,
    );
  }

  @override
  List<Object> get props => [
        selectedPriorities ?? [],
        selectedTaskStatuses ?? [],
        selectedAcceptanceStatuses ?? [],
        selectedCategories ?? [],
        isExcludeArchive,
      ];
}
