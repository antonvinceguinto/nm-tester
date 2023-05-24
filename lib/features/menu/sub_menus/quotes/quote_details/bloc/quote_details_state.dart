part of 'quote_details_bloc.dart';

class QuoteDetailsState extends Equatable {
  const QuoteDetailsState({
    this.status = GenericRequestStatusEnum.initial,
    this.errorMessage,
    this.billableDetailsModel = const BillableDetailsModel(),
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final BillableDetailsModel billableDetailsModel;

  QuoteDetailsState copyWith({
    GenericRequestStatusEnum? status,
    String? errorMessage,
    BillableDetailsModel? billableDetailsModel,
  }) {
    return QuoteDetailsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      billableDetailsModel: billableDetailsModel ?? this.billableDetailsModel,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        billableDetailsModel,
      ];
}
