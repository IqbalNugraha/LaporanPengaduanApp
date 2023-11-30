import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skripsi_project/bloc/report/get_all_report/get_all_report_bloc.dart';
import 'package:skripsi_project/data/models/response/report/report_response_model.dart';

import '../../../bloc/report/delete_report/delete_report_bloc.dart';
import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';

class ComponentDelete extends StatelessWidget {
  final ReportData data;
  const ComponentDelete({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FontPoppins(
            text: Variables.msgRemoveReport,
            size: 14,
            fontWeight: FontWeight.w700,
            color: MyColors.blackFont,
            alignment: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                height: 35,
                width: 100,
                btnColor: MyColors.red,
                function: () {
                  Navigator.pop(context);
                },
                widget: const FontPoppins(
                  text: Variables.btnNo,
                  size: 14,
                  fontWeight: FontWeight.w800,
                  color: MyColors.white,
                  alignment: TextAlign.center,
                ),
              ),
              BlocConsumer<DeleteReportBloc, DeleteReportState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return CustomButton(
                        height: 35,
                        width: 100,
                        btnColor: MyColors.brandColor,
                        function: () {
                          context
                              .read<DeleteReportBloc>()
                              .add(DeleteReportEvent.removeReport(data.id!));
                        },
                        widget: const FontPoppins(
                          text: Variables.btnYes,
                          size: 14,
                          fontWeight: FontWeight.w800,
                          color: MyColors.white,
                          alignment: TextAlign.center,
                        ),
                      );
                    },
                    loading: () {
                      return const CustomLoadingState();
                    },
                  );
                },
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (response) {
                      Fluttertoast.showToast(msg: Variables.msgSuccessDelete);
                      Navigations.popNavigation(context);
                      context.read<GetAllReportBloc>().add(
                            const GetAllReportEvent.getAllReport(),
                          );
                    },
                    error: (error) {
                      Fluttertoast.showToast(msg: error);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
