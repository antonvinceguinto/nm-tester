// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet_weekly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListWeeklySummaryModel _$$_ListWeeklySummaryModelFromJson(
        Map<String, dynamic> json) =>
    _$_ListWeeklySummaryModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  WeeklyTimesheetDatum.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      timesheet_islocked: json['timesheet_islocked'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ListWeeklySummaryModelToJson(
        _$_ListWeeklySummaryModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'timesheet_islocked': instance.timesheet_islocked,
    };

_$_WeeklyTimesheetDatum _$$_WeeklyTimesheetDatumFromJson(
        Map<String, dynamic> json) =>
    _$_WeeklyTimesheetDatum(
      id: (json['id'] as num?)?.toDouble(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      total_time_assigned: (json['total_time_assigned'] as num?)?.toDouble(),
      total_buy_price: (json['total_buy_price'] as num?)?.toDouble(),
      state: (json['state'] as num?)?.toDouble(),
      timesheet_entries: (json['timesheet_entries'] as List<dynamic>?)
          ?.map((e) => TimesheetEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WeeklyTimesheetDatumToJson(
        _$_WeeklyTimesheetDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'total_time_assigned': instance.total_time_assigned,
      'total_buy_price': instance.total_buy_price,
      'state': instance.state,
      'timesheet_entries': instance.timesheet_entries,
    };

_$_TimesheetEntry _$$_TimesheetEntryFromJson(Map<String, dynamic> json) =>
    _$_TimesheetEntry(
      task_number: json['task_number'] as String?,
      task_summary: json['task_summary'] as String?,
      job_number: json['job_number'] as String?,
      job_name: json['job_name'] as String?,
      job_address: json['job_address'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      time_total: (json['time_total'] as num?)?.toDouble(),
      buy_price: (json['buy_price'] as num?)?.toDouble(),
      is_job_entry: json['is_job_entry'] as bool?,
      is_billable: json['is_billable'] as bool?,
      billableitem_ismanually_invoiced:
          json['billableitem_ismanually_invoiced'] as bool?,
      billableitem_entry_type: json['billableitem_entry_type'] as String?,
      billableitem_istime: json['billableitem_istime'] as bool?,
      billableitem_istime_range: json['billableitem_istime_range'] as bool?,
      billableitem_buy_subtotal:
          (json['billableitem_buy_subtotal'] as num?)?.toDouble(),
      billableitem_sell_subtotal:
          (json['billableitem_sell_subtotal'] as num?)?.toDouble(),
      billableitem_invoiced_total:
          (json['billableitem_invoiced_total'] as num?)?.toDouble(),
      target_billableitem_summaries:
          json['target_billableitem_summaries'] as List<dynamic>?,
      start_time: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      end_time: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      client_contact_id: (json['client_contact_id'] as num?)?.toDouble(),
      client_contact_name: json['client_contact_name'] as String?,
    );

Map<String, dynamic> _$$_TimesheetEntryToJson(_$_TimesheetEntry instance) =>
    <String, dynamic>{
      'task_number': instance.task_number,
      'task_summary': instance.task_summary,
      'job_number': instance.job_number,
      'job_name': instance.job_name,
      'job_address': instance.job_address,
      'title': instance.title,
      'description': instance.description,
      'time_total': instance.time_total,
      'buy_price': instance.buy_price,
      'is_job_entry': instance.is_job_entry,
      'is_billable': instance.is_billable,
      'billableitem_ismanually_invoiced':
          instance.billableitem_ismanually_invoiced,
      'billableitem_entry_type': instance.billableitem_entry_type,
      'billableitem_istime': instance.billableitem_istime,
      'billableitem_istime_range': instance.billableitem_istime_range,
      'billableitem_buy_subtotal': instance.billableitem_buy_subtotal,
      'billableitem_sell_subtotal': instance.billableitem_sell_subtotal,
      'billableitem_invoiced_total': instance.billableitem_invoiced_total,
      'target_billableitem_summaries': instance.target_billableitem_summaries,
      'start_time': instance.start_time?.toIso8601String(),
      'end_time': instance.end_time?.toIso8601String(),
      'client_contact_id': instance.client_contact_id,
      'client_contact_name': instance.client_contact_name,
    };
