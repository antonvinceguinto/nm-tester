part of 'quotes_bloc.dart';

class QuotesState extends Equatable {
  const QuotesState({
    this.status = GenericRequestStatusEnum.initial,
    this.errorMessage,
    this.currPage = 1,
    this.quotesModel,
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final int currPage;
  final QuotesModel? quotesModel;

  QuotesState copyWith({
    GenericRequestStatusEnum? status,
    String? errorMessage,
    int? currPage,
    QuotesModel? quotesModel,
  }) {
    return QuotesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      currPage: currPage ?? this.currPage,
      quotesModel: quotesModel ?? this.quotesModel,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        currPage,
        quotesModel ?? const QuotesModel(),
      ];
}
