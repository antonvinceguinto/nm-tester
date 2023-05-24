part of 'charges_bloc.dart';

abstract class ChargesEvent extends Equatable {
  const ChargesEvent();

  @override
  List<Object> get props => [];
}

class ChargesFetchEvent extends ChargesEvent {
  const ChargesFetchEvent({
    required this.id,
    required this.isJob,
  });

  final int id;
  final bool isJob;
}

class ChargesSelectBillableItemEvent extends ChargesEvent {
  const ChargesSelectBillableItemEvent({
    this.billableItem,
  });

  final BillableInfoLevelItem? billableItem;
}

class ChargesSelectAllEvent extends ChargesEvent {
  const ChargesSelectAllEvent({
    required this.billableItems,
  });

  final List<BillableInfoLevelItem> billableItems;
}
