import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:skripsi_project/data/datasources/report/report_remote_datasource.dart';
import 'package:skripsi_project/data/models/request/report/report_request_model.dart';
import 'package:skripsi_project/data/models/response/report/report_update_response_model.dart';

part 'add_report_event.dart';
part 'add_report_state.dart';
part 'add_report_bloc.freezed.dart';

class AddReportBloc extends Bloc<AddReportEvent, AddReportState> {
  AddReportBloc() : super(const _Initial()) {
    on<_AddReport>((event, emit) async {
      emit(const _Loading());
      final response = await ReportRemoteDatasource().addEducation(
        event.model,
        event.file,
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
