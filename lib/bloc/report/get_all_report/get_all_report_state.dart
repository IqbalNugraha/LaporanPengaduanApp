part of 'get_all_report_bloc.dart';

@freezed
class GetAllReportState with _$GetAllReportState {
  const factory GetAllReportState.initial() = _Initial;
  const factory GetAllReportState.loading() = _Loading;
  const factory GetAllReportState.success(ReportResponseModel data) = _Success;
  const factory GetAllReportState.empty() = _Empty;
  const factory GetAllReportState.error(String error) = _Error;
}
