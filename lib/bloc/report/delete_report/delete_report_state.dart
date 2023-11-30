part of 'delete_report_bloc.dart';

@freezed
class DeleteReportState with _$DeleteReportState {
  const factory DeleteReportState.initial() = _Initial;
  const factory DeleteReportState.loading() = _Loading;
  const factory DeleteReportState.success(ReportUpdateResponseModel data) = _Success;
  const factory DeleteReportState.error(String error) = _Error;
}
