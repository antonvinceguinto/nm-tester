import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'charges_event.dart';
part 'charges_state.dart';

class ChargesBloc extends Bloc<ChargesEvent, ChargesState> {
  ChargesBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const ChargesState()) {
    on<ChargesFetchEvent>(_onChargesFetchEvent);
    on<ChargesSelectBillableItemEvent>(_onChargesSelectBillableItemEvent);
    on<ChargesSelectAllEvent>(_onChargesSelectAllEvent);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  void _onChargesSelectAllEvent(
    ChargesSelectAllEvent event,
    Emitter<ChargesState> emit,
  ) {
    if (event.billableItems.isNotEmpty) {
      emit(
        state.copyWith(
          selectedBillableItems: event.billableItems,
        ),
      );
    }
  }

  void _onChargesSelectBillableItemEvent(
    ChargesSelectBillableItemEvent event,
    Emitter<ChargesState> emit,
  ) {
    if (event.billableItem != null) {
      if (state.selectedBillableItems.contains(event.billableItem)) {
        emit(
          state.copyWith(
            selectedBillableItems: state.selectedBillableItems
                .where((element) => element != event.billableItem)
                .toList(),
          ),
        );
      } else {
        emit(
          state.copyWith(
            selectedBillableItems: [
              ...state.selectedBillableItems,
              event.billableItem!,
            ],
          ),
        );
      }
    }
  }

  Future<void> _onChargesFetchEvent(
    ChargesFetchEvent event,
    Emitter<ChargesState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.getBillablesInfoLevel(
      id: event.id,
      isJob: event.isJob,
      infoLevel: 'detailedItems jobOrBookContact targetInvoiceItemSummaries',
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
          billable: r,
        ),
      ),
    );
  }
}
