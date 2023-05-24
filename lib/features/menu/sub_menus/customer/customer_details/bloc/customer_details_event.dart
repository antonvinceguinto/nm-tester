part of 'customer_details_bloc.dart';

class CustomerDetailsFetchEvent extends Equatable {
  const CustomerDetailsFetchEvent({
    required this.id,
  });

  final int id;

  @override
  List<Object> get props => [id];
}
