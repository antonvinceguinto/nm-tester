part of 'quotes_bloc.dart';

abstract class QuotesEvent extends Equatable {
  const QuotesEvent();

  @override
  List<Object> get props => [];
}

class QuotesFetchEvent extends QuotesEvent {
  const QuotesFetchEvent({
    required this.type,
    this.currPage = 1,
    this.searchQuery,
    this.filter = const {},
  });

  final String type;
  final int currPage;
  final String? searchQuery;
  final Map<String, dynamic> filter;
}
