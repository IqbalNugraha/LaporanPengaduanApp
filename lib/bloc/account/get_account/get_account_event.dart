part of 'get_account_bloc.dart';

@freezed
class GetAccountEvent with _$GetAccountEvent {
  const factory GetAccountEvent.started() = _Started;
  const factory GetAccountEvent.getAccount() = _GetAccount;
}