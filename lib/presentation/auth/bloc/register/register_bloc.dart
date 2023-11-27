import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_project/data/datasources/auth_remote_datasource.dart';
import 'package:skripsi_project/data/models/request/auth/register_request_model.dart';

import '../../../../common/constans/variables.dart';
import '../../../../data/models/response/auth_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().register(event.model);
      response.fold(
        (l) => emit(_Error(l.error!.message ?? Variables.msgHttp500)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
