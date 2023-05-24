part of 'charges_bloc.dart';

class ChargesState extends Equatable {
  const ChargesState({
    this.status = GenericRequestStatusEnum.initial,
    this.errorMessage,
    this.billable,
    this.selectedBillableItems = const [],
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final BillableInfoLevelModel? billable;
  final List<BillableInfoLevelItem> selectedBillableItems;

  ChargesState copyWith({
    GenericRequestStatusEnum? status,
    String? errorMessage,
    BillableInfoLevelModel? billable,
    List<BillableInfoLevelItem>? selectedBillableItems,
  }) {
    return ChargesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      billable: billable ?? this.billable,
      selectedBillableItems:
          selectedBillableItems ?? this.selectedBillableItems,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        billable ?? const BillableInfoLevelModel(),
        selectedBillableItems,
      ];
}
