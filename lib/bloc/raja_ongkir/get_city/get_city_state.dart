part of 'get_city_bloc.dart';

@freezed
class GetCityState with _$GetCityState {
  const factory GetCityState.initial() = _Initial;
  const factory GetCityState.loading() = _Loading;
  const factory GetCityState.success(CityResponseModel data) = _Success;
  const factory GetCityState.error(String error) = _Error;
}
