part of 'get_all_report_bloc.dart';

@freezed
class GetAllReportEvent with _$GetAllReportEvent {
  const factory GetAllReportEvent.started() = _Started;
  const factory GetAllReportEvent.getAllReport() = _GetAllReport;
}