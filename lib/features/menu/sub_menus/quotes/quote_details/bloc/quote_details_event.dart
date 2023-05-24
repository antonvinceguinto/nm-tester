part of 'quote_details_bloc.dart';

abstract class QuoteDetailsEvent extends Equatable {
  const QuoteDetailsEvent();

  @override
  List<Object> get props => [];
}

class QuoteDetailsFetch extends QuoteDetailsEvent {
  const QuoteDetailsFetch({
    required this.billableId,
    required this.infoLevel,
  });

  final int billableId;
  final String infoLevel;
}
