part of 'get_subdistrict_bloc.dart';

@freezed
class GetSubdistrictState with _$GetSubdistrictState {
  const factory GetSubdistrictState.initial() = _Initial;
  const factory GetSubdistrictState.loading() = _Loading;
  const factory GetSubdistrictState.success(SubDistrictResponseModel data) = _Success;
  const factory GetSubdistrictState.error(String error) = _Error;
}
