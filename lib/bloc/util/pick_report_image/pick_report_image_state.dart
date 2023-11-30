part of 'pick_report_image_bloc.dart';

@freezed
class PickReportImageState with _$PickReportImageState {
  const factory PickReportImageState.initial() = _Initial;
  const factory PickReportImageState.loading() = _Loading;
  const factory PickReportImageState.success(PlatformFile file) = _Success;
  const factory PickReportImageState.empty() = _Empty;
}
