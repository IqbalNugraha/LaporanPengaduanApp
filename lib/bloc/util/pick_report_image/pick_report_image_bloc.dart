import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/constans/variables.dart';

part 'pick_report_image_event.dart';
part 'pick_report_image_state.dart';
part 'pick_report_image_bloc.freezed.dart';

class PickReportImageBloc
    extends Bloc<PickReportImageEvent, PickReportImageState> {
  PickReportImageBloc() : super(const _Initial()) {
    on<_PickImage>((event, emit) async {
      emit(const _Loading());
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: Variables.msgCantEmpty,
        type: FileType.image,
      );
      if (result == null) {
        emit(const _Empty());
      } else {
        final file = result.files.single;
        emit(_Success(file));
      }
    });

    on<_RemoveImage>((event, emit) {
      final tempFile = File(event.path);
      tempFile.delete();
      emit(const _Empty());
    });
  }
}
