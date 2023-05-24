part of 'select_customer_bloc.dart';

class SelectCustomerState extends Equatable {
  const SelectCustomerState({
    this.status = GenericRequestStatusEnum.initial,
    this.errorMessage,
    this.customerList,
    this.customerModel,
    this.currPage = 1,
    this.search = '',
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final String search;
  final CustomerModel? customerModel;
  final List<CustomerDatum>? customerList;
  final int currPage;

  SelectCustomerState copyWith({
    GenericRequestStatusEnum? status,
    String? errorMessage,
    CustomerModel? customerModel,
    List<CustomerDatum>? customerList,
    int? currPage,
    String? search,
  }) {
    return SelectCustomerState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      customerModel: customerModel ?? this.customerModel,
      customerList: customerList ?? this.customerList,
      currPage: currPage ?? this.currPage,
      search: search ?? this.search,
    );
  }

  void clearCustomerList() {
    customerList?.clear();
  }

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        customerModel ?? const CustomerModel(),
        customerList ?? [],
        currPage,
        search,
      ];
}
