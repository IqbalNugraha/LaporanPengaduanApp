import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_project/data/models/request/auth/login_request_model.dart';
import 'package:skripsi_project/data/models/response/auth_response_model.dart';

import '../../../../common/constans/variables.dart';
import '../../../../data/datasources/auth_remote_datasource.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().login(event.model);
      response.fold(
        (l) => emit(_Error(l.error?.message ?? Variables.msgHttp500)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
