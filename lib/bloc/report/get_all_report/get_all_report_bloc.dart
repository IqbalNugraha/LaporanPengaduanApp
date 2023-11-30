import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_project/data/datasources/report/report_remote_datasource.dart';
import 'package:skripsi_project/data/models/response/report/report_response_model.dart';

part 'get_all_report_event.dart';
part 'get_all_report_state.dart';
part 'get_all_report_bloc.freezed.dart';

class GetAllReportBloc extends Bloc<GetAllReportEvent, GetAllReportState> {
  GetAllReportBloc() : super(const _Initial()) {
    on<GetAllReportEvent>((event, emit) async {
      emit(const _Loading());
      final response = await ReportRemoteDatasource().getReport();
      response.fold(
        (l) => emit(_Error(l)),
        (r) {
          if (r.data!.isEmpty) {
            emit(const _Empty());
          } else if (r.data!.isNotEmpty) {
            emit(_Success(r));
          } else {
            emit(_Error(r.error!.message!));
          }
        },
      );
    });
  }
}
