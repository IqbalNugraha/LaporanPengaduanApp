part of 'delete_report_bloc.dart';

@freezed
class DeleteReportEvent with _$DeleteReportEvent {
  const factory DeleteReportEvent.started() = _Started;
  const factory DeleteReportEvent.removeReport(int id) = _RemoveReport;
}