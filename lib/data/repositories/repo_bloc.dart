import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skripsi_project/bloc/account/get_account/get_account_bloc.dart';
import 'package:skripsi_project/bloc/report/get_all_report/get_all_report_bloc.dart';

class RepoBloc {
  static void initBloc(BuildContext context) {
    //account
    context.read<GetAccountBloc>().add(const GetAccountEvent.getAccount());

    //report
    context
        .read<GetAllReportBloc>()
        .add(const GetAllReportEvent.getAllReport());
  }
}
