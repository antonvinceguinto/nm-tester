import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'actual_charges.freezed.dart';
part 'actual_charges.g.dart';

@freezed
class ActualChargesTotals with _$ActualChargesTotals {
  const factory ActualChargesTotals({
    @Default(0) double? time_subtotal,
    @Default(0) double? product_subtotal,
    @Default(0) double? disbursement_subtotal,
    @Default(0) double? other_subtotal,
    @Default(0) double? actual_charges_total,
    @Default(0) double? actual_charges_subtotal,
    @Default(0) double? actual_charges_unbilled_subtotal,
    @Default(0) double? actual_charges_costs_subtotal,
    @Default(0) double? actual_charges_non_billable_buy_subtotal,
    DateTime? actual_charges_updated_date,
  }) = _ActualChargesTotals;

  static const empty = ActualChargesTotals(
    time_subtotal: 0,
    product_subtotal: 0,
    disbursement_subtotal: 0,
    other_subtotal: 0,
    actual_charges_total: 0,
    actual_charges_subtotal: 0,
    actual_charges_unbilled_subtotal: 0,
    actual_charges_costs_subtotal: 0,
    actual_charges_non_billable_buy_subtotal: 0,
    actual_charges_updated_date: null,
  );

  factory ActualChargesTotals.fromJson(Map<String, Object?> json) =>
      _$ActualChargesTotalsFromJson(json);
}

@freezed
class CostSummary with _$CostSummary {
  const factory CostSummary({
    double? actual_costs,
    double? progress,
    double? total_quoted,
    double? variance_amount,
    double? variance_percent,
  }) = _CostSummary;

  factory CostSummary.fromJson(Map<String, Object?> json) =>
      _$CostSummaryFromJson(json);
}
