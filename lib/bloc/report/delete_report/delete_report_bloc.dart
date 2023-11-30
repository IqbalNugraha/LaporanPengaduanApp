import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_project/data/datasources/report/report_remote_datasource.dart';
import 'package:skripsi_project/data/models/response/report/report_update_response_model.dart';

part 'delete_report_event.dart';
part 'delete_report_state.dart';
part 'delete_report_bloc.freezed.dart';

class DeleteReportBloc extends Bloc<DeleteReportEvent, DeleteReportState> {
  DeleteReportBloc() : super(const _Initial()) {
    on<_RemoveReport>((event, emit) async {
      emit(const _Loading());
      final response = await ReportRemoteDatasource().deleteReport(
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
