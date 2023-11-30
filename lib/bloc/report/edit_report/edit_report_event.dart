part of 'edit_report_bloc.dart';

@freezed
class EditReportEvent with _$EditReportEvent {
  const factory EditReportEvent.started() = _Started;
  const factory EditReportEvent.editReport(
    ReportRequestModel model,
    http.MultipartFile? file,
    int id,
  ) = _EditReport;
}