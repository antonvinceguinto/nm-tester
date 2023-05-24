// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actual_charges.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActualChargesTotals _$$_ActualChargesTotalsFromJson(
        Map<String, dynamic> json) =>
    _$_ActualChargesTotals(
      time_subtotal: (json['time_subtotal'] as num?)?.toDouble() ?? 0,
      product_subtotal: (json['product_subtotal'] as num?)?.toDouble() ?? 0,
      disbursement_subtotal:
          (json['disbursement_subtotal'] as num?)?.toDouble() ?? 0,
      other_subtotal: (json['other_subtotal'] as num?)?.toDouble() ?? 0,
      actual_charges_total:
          (json['actual_charges_total'] as num?)?.toDouble() ?? 0,
      actual_charges_subtotal:
          (json['actual_charges_subtotal'] as num?)?.toDouble() ?? 0,
      actual_charges_unbilled_subtotal:
          (json['actual_charges_unbilled_subtotal'] as num?)?.toDouble() ?? 0,
      actual_charges_costs_subtotal:
          (json['actual_charges_costs_subtotal'] as num?)?.toDouble() ?? 0,
      actual_charges_non_billable_buy_subtotal:
          (json['actual_charges_non_billable_buy_subtotal'] as num?)
                  ?.toDouble() ??
              0,
      actual_charges_updated_date: json['actual_charges_updated_date'] == null
          ? null
          : DateTime.parse(json['actual_charges_updated_date'] as String),
    );

Map<String, dynamic> _$$_ActualChargesTotalsToJson(
        _$_ActualChargesTotals instance) =>
    <String, dynamic>{
      'time_subtotal': instance.time_subtotal,
      'product_subtotal': instance.product_subtotal,
      'disbursement_subtotal': instance.disbursement_subtotal,
      'other_subtotal': instance.other_subtotal,
      'actual_charges_total': instance.actual_charges_total,
      'actual_charges_subtotal': instance.actual_charges_subtotal,
      'actual_charges_unbilled_subtotal':
          instance.actual_charges_unbilled_subtotal,
      'actual_charges_costs_subtotal': instance.actual_charges_costs_subtotal,
      'actual_charges_non_billable_buy_subtotal':
          instance.actual_charges_non_billable_buy_subtotal,
      'actual_charges_updated_date':
          instance.actual_charges_updated_date?.toIso8601String(),
    };

_$_CostSummary _$$_CostSummaryFromJson(Map<String, dynamic> json) =>
    _$_CostSummary(
      actual_costs: (json['actual_costs'] as num?)?.toDouble(),
      progress: (json['progress'] as num?)?.toDouble(),
      total_quoted: (json['total_quoted'] as num?)?.toDouble(),
      variance_amount: (json['variance_amount'] as num?)?.toDouble(),
      variance_percent: (json['variance_percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CostSummaryToJson(_$_CostSummary instance) =>
    <String, dynamic>{
      'actual_costs': instance.actual_costs,
      'progress': instance.progress,
      'total_quoted': instance.total_quoted,
      'variance_amount': instance.variance_amount,
      'variance_percent': instance.variance_percent,
    };
