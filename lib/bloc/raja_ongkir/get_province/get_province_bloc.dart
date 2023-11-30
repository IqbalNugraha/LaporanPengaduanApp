import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_project/data/models/response/raja_ongkir/province_response_model.dart';

import '../../../data/datasources/raja_ongkir/raja_ongkir_remote_datasource.dart';

part 'get_province_event.dart';
part 'get_province_state.dart';
part 'get_province_bloc.freezed.dart';

class GetProvinceBloc extends Bloc<GetProvinceEvent, GetProvinceState> {
  GetProvinceBloc() : super(const _Initial()) {
    on<_GetProvince>((event, emit) async{
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getProvinces();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
