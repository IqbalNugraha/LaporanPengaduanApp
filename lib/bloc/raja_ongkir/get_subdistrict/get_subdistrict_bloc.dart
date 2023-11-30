import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_project/data/models/response/raja_ongkir/subdistrict_response_model.dart';

import '../../../data/datasources/raja_ongkir/raja_ongkir_remote_datasource.dart';

part 'get_subdistrict_event.dart';
part 'get_subdistrict_state.dart';
part 'get_subdistrict_bloc.freezed.dart';

class GetSubdistrictBloc
    extends Bloc<GetSubdistrictEvent, GetSubdistrictState> {
  GetSubdistrictBloc() : super(const _Initial()) {
    on<_GetSubdistrict>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getSubDistrict(
        event.cityId,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
