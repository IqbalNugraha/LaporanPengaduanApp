part of 'edit_report_bloc.dart';

@freezed
class EditReportState with _$EditReportState {
  const factory EditReportState.initial() = _Initial;
  const factory EditReportState.loading() = _Loading;
  const factory EditReportState.success(
    ReportUpdateResponseModel data,
  ) = _Success;
  const factory EditReportState.error(String error) = _Error;
}
