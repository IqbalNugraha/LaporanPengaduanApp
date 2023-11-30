import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_project/data/models/response/raja_ongkir/city_response_model.dart';

import '../../../data/datasources/raja_ongkir/raja_ongkir_remote_datasource.dart';

part 'get_city_event.dart';
part 'get_city_state.dart';
part 'get_city_bloc.freezed.dart';

class GetCityBloc extends Bloc<GetCityEvent, GetCityState> {
  GetCityBloc() : super(const _Initial()) {
    on<_GetCity>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getCities(
        event.provinceId,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
