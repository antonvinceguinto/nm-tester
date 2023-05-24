import 'package:freezed_annotation/freezed_annotation.dart';

part 'sheet_weekly_model.freezed.dart';
part 'sheet_weekly_model.g.dart';

@freezed
class ListWeeklySummaryModel with _$ListWeeklySummaryModel {
  const factory ListWeeklySummaryModel({
    @Default([]) List<WeeklyTimesheetDatum> data,
    @Default(false) bool? timesheet_islocked,
  }) = _ListWeeklySummaryModel;

  static const empty = ListWeeklySummaryModel();

  factory ListWeeklySummaryModel.fromJson(Map<String, Object?> json) =>
      _$ListWeeklySummaryModelFromJson(json);
}

@freezed
class WeeklyTimesheetDatum with _$WeeklyTimesheetDatum {
  const factory WeeklyTimesheetDatum({
    double? id,
    DateTime? date,
    double? total_time_assigned,
    double? total_buy_price,
    double? state,
    List<TimesheetEntry>? timesheet_entries,
  }) = _WeeklyTimesheetDatum;

  factory WeeklyTimesheetDatum.fromJson(Map<String, Object?> json) =>
      _$WeeklyTimesheetDatumFromJson(json);
}

@freezed
class TimesheetEntry with _$TimesheetEntry {
  const factory TimesheetEntry({
    String? task_number,
    String? task_summary,
    String? job_number,
    String? job_name,
    String? job_address,
    String? title,
    String? description,
    double? time_total,
    double? buy_price,
    bool? is_job_entry,
    bool? is_billable,
    bool? billableitem_ismanually_invoiced,
    String? billableitem_entry_type,
    bool? billableitem_istime,
    bool? billableitem_istime_range,
    double? billableitem_buy_subtotal,
    double? billableitem_sell_subtotal,
    double? billableitem_invoiced_total,
    List<dynamic>? target_billableitem_summaries,
    DateTime? start_time,
    DateTime? end_time,
    double? client_contact_id,
    String? client_contact_name,
  }) = _TimesheetEntry;

  factory TimesheetEntry.fromJson(Map<String, Object?> json) =>
      _$TimesheetEntryFromJson(json);
}
