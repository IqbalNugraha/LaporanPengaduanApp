part of 'get_province_bloc.dart';

@freezed
class GetProvinceState with _$GetProvinceState {
  const factory GetProvinceState.initial() = _Initial;
  const factory GetProvinceState.loading() = _Loading;
  const factory GetProvinceState.success(ProvinceResponseModel data) = _Success;
  const factory GetProvinceState.error(String error) = _Error;
}
