import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:skripsi_project/data/models/request/report/report_request_model.dart';

import '../../../data/datasources/report/report_remote_datasource.dart';
import '../../../data/models/response/report/report_update_response_model.dart';

part 'edit_report_event.dart';
part 'edit_report_state.dart';
part 'edit_report_bloc.freezed.dart';

class EditReportBloc extends Bloc<EditReportEvent, EditReportState> {
  EditReportBloc() : super(const _Initial()) {
    on<_EditReport>((event, emit) async {
      emit(const _Loading());
      final response = await ReportRemoteDatasource().editEducation(
        event.model,
        event.file,
        event.id,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) {
          if (r.data != null) {
            emit(_Success(r));
          } else {
            emit(_Error(r.error!.message!));
          }
        },
      );
    });
  }
}
