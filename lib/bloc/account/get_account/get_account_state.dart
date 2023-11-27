part of 'get_account_bloc.dart';

@freezed
class GetAccountState with _$GetAccountState {
  const factory GetAccountState.initial() = _Initial;
  const factory GetAccountState.loading() = _Loading;
  const factory GetAccountState.success(
    AccountDetailResponseModel data,
  ) = _Success;
  const factory GetAccountState.error(String error) = _Error;
}
