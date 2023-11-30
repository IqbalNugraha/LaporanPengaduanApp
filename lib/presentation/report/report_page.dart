import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skripsi_project/presentation/report/widgets/component_delete.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:skripsi_project/bloc/report/get_all_report/get_all_report_bloc.dart';
import 'package:skripsi_project/common/components/custom_circle_avatar.dart';

import '../../common/components/custom_bottom_popup.dart';
import '../../common/components/custom_font.dart';
import '../../common/components/custom_loading_state.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';
import 'add_report_page.dart';
import 'widgets/card_report.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<GetAllReportBloc, GetAllReportState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const CustomLoadingState();
              },
              empty: () {
                return const Center(
                  child: FontPoppins(
                    text: Variables.reportEmpty,
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: MyColors.blackFont,
                    alignment: TextAlign.center,
                  ),
                );
              },
              success: (response) {
                return ListView.separated(
                  itemCount: response.data!.length,
                  separatorBuilder: (context, i) => const SizedBox(height: 16),
                  itemBuilder: (context, i) {
                    return SwipeTo(
                      swipeSensitivity: 20,
                      leftSwipeWidget: const Icon(
                        Icons.delete,
                        size: 42,
                        color: MyColors.red,
                      ),
                      onLeftSwipe: (details) {
                        CustomPopupBottom.showModalBottom(
                          context,
                          ComponentDelete(
                            data: response.data![i],
                          ),
                        );
                      },
                      child: CardReport(
                        data: response.data![i],
                      ),
                    );
                  },
                );
              },
              error: (error) {
                return Center(
                  child: FontPoppins(
                    text: error,
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: MyColors.blackFont,
                    alignment: TextAlign.center,
                  ),
                );
              },
            );
          },
        ),
        Positioned(
          bottom: 42,
          right: 32,
          child: GestureDetector(
            onTap: () {
              Navigations.pushNavigation(
                context,
                const AddReportPage(),
              );
            },
            child: const CustomCircleAvatar(
              sizeRadius: 30,
              widget: Icon(
                Icons.add,
                color: MyColors.white,
                size: 42,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
