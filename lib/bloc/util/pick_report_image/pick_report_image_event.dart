part of 'pick_report_image_bloc.dart';

@freezed
class PickReportImageEvent with _$PickReportImageEvent {
  const factory PickReportImageEvent.started() = _Started;
  const factory PickReportImageEvent.pickImage() = _PickImage;
  const factory PickReportImageEvent.removeImage(String path) = _RemoveImage;
}