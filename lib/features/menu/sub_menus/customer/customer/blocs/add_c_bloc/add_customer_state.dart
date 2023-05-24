part of 'add_customer_bloc.dart';

class AddCustomerState extends Equatable {
  const AddCustomerState({
    this.status = GenericRequestStatusEnum.initial,
  });

  final GenericRequestStatusEnum status;

  AddCustomerState copyWith({
    GenericRequestStatusEnum? status,
  }) {
    return AddCustomerState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
