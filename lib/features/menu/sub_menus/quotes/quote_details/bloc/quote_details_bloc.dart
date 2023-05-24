import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'quote_details_event.dart';
part 'quote_details_state.dart';

class QuoteDetailsBloc extends Bloc<QuoteDetailsEvent, QuoteDetailsState> {
  QuoteDetailsBloc({required NMRepositoryImpl nmRepositoryImpl})
      : _nmRepositoryImpl = nmRepositoryImpl,
        super(const QuoteDetailsState()) {
    on<QuoteDetailsFetch>(_onQuoteDetailsFetch);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onQuoteDetailsFetch(
    QuoteDetailsFetch event,
    Emitter<QuoteDetailsState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.getBillableDetails(
      billableId: event.billableId,
      infoLevel: event.infoLevel,
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
          billableDetailsModel: r,
        ),
      ),
    );
  }
}
