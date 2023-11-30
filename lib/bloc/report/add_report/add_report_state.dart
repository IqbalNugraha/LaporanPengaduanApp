part of 'add_report_bloc.dart';

@freezed
class AddReportState with _$AddReportState {
  const factory AddReportState.initial() = _Initial;
  const factory AddReportState.loading() = _Loading;
  const factory AddReportState.success(
    ReportUpdateResponseModel data,
  ) = _Success;
  const factory AddReportState.error(String error) = _Error;
}
