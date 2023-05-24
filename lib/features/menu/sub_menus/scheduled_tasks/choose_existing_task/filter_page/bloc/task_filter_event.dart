part of 'task_filter_bloc.dart';

abstract class TaskFilterEvent extends Equatable {
  const TaskFilterEvent();

  @override
  List<Object> get props => [];
}

class TaskFilterCustomerSelectedEvent extends TaskFilterEvent {
  const TaskFilterCustomerSelectedEvent({
    this.customer = const CustomerDatum(),
    this.isRemove = false,
    this.isAssignedTo = false,
    this.isCreatedBy = false,
    this.isClear = false,
  });

  final CustomerDatum customer;
  final bool isRemove;
  final bool isAssignedTo;
  final bool isCreatedBy;
  final bool isClear;

  @override
  List<Object> get props => [
        customer,
        isRemove,
        isAssignedTo,
        isCreatedBy,
        isClear,
      ];
}

class TaskFilterSelectPriorityEvent extends TaskFilterEvent {
  const TaskFilterSelectPriorityEvent({
    required this.selectedPriority,
  });

  final FPriorityModel selectedPriority;

  @override
  List<Object> get props => [
        selectedPriority,
      ];
}

class TaskFilterSelectStatusEvent extends TaskFilterEvent {
  const TaskFilterSelectStatusEvent({
    required this.selectedTaskStatus,
  });

  final TaskStatusModel selectedTaskStatus;

  @override
  List<Object> get props => [
        selectedTaskStatus,
      ];
}

class TaskFilterSelectAcceptanceStatusEvent extends TaskFilterEvent {
  const TaskFilterSelectAcceptanceStatusEvent({
    required this.selectedStatus,
  });

  final AcceptanceStatusModel selectedStatus;

  @override
  List<Object> get props => [
        selectedStatus,
      ];
}

class TaskFilterSelectCategoryEvent extends TaskFilterEvent {
  const TaskFilterSelectCategoryEvent({
    required this.selectedCategory,
  });

  final CategoryFilterModel selectedCategory;

  @override
  List<Object> get props => [
        selectedCategory,
      ];
}

class ToggleExcludeArchiveEvent extends TaskFilterEvent {
  const ToggleExcludeArchiveEvent();

  @override
  List<Object> get props => [];
}

class ClearTaskFiltersEvent extends TaskFilterEvent {
  const ClearTaskFiltersEvent();

  @override
  List<Object> get props => [];
}
