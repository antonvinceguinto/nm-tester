import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

enum SaveStatus {
  initial,
  loading,
  success,
  error,
}

class JobGenericState<T> extends Equatable {
  const JobGenericState({
    this.status = GenericRequestStatusEnum.initial,
    this.saveStatus = SaveStatus.initial,
    this.items,
    this.selectedItem,
  });

  final GenericRequestStatusEnum status;
  final SaveStatus saveStatus;
  final List<T>? items;
  final T? selectedItem;

  JobGenericState<T> copyWith({
    SaveStatus? saveStatus,
    GenericRequestStatusEnum? status,
    List<T>? items,
    T? selectedItem,
  }) {
    return JobGenericState(
      status: status ?? this.status,
      saveStatus: saveStatus ?? this.saveStatus,
      items: items ?? this.items,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }

  @override
  List<Object> get props => [
        status,
        saveStatus,
        items ?? [],
        selectedItem ?? T,
      ];
}
