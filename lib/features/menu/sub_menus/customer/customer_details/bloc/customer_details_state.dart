part of 'customer_details_bloc.dart';

class CustomerDetailsState extends Equatable {
  const CustomerDetailsState({
    this.status = GenericRequestStatusEnum.initial,
    this.errorMessage,
    this.contactDetails,
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final CustomerDatum? contactDetails;

  CustomerDetailsState copyWith({
    GenericRequestStatusEnum? status,
    String? errorMessage,
    CustomerDatum? contactDetails,
  }) {
    return CustomerDetailsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      contactDetails: contactDetails,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        contactDetails ?? const CustomerDatum(),
      ];
}
