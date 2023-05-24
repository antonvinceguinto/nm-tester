import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  QuotesBloc({required NMRepositoryImpl nmRepositoryImpl})
      : _nmRepositoryImpl = nmRepositoryImpl,
        super(const QuotesState()) {
    on<QuotesFetchEvent>(_onQuotesFetchEvent);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onQuotesFetchEvent(
    QuotesFetchEvent event,
    Emitter<QuotesState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.getQuotes(
      type: event.type,
      currPage: event.currPage,
      search: event.searchQuery,
      filter: event.filter,
    );

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          quotesModel: r,
        ),
      ),
    );
  }
}
