import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_project/data/datasources/account/account_remote_datasource.dart';
import 'package:skripsi_project/data/models/response/account/account_detail_response.dart';

part 'get_account_event.dart';
part 'get_account_state.dart';
part 'get_account_bloc.freezed.dart';

class GetAccountBloc extends Bloc<GetAccountEvent, GetAccountState> {
  GetAccountBloc() : super(const _Initial()) {
    on<_GetAccount>((event, emit) async {
      emit(const _Loading());
      final response = await AccountRemoteDatasource().getAccount();
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
