import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:skripsi_project/common/components/custom_bottom_popup.dart';
import 'package:skripsi_project/common/components/custom_popup_message.dart';
import 'package:skripsi_project/presentation/home/widgets/home_appbar_widget.dart';

import '../../bloc/account/get_account/get_account_bloc.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';
import '../auth/login_page.dart';
import '../report/report_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: BlocListener<GetAccountBloc, GetAccountState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {
                EasyLoading.show(
                  status: Variables.loading,
                );
              },
              success: (response) {
                EasyLoading.dismiss();
              },
              error: (error) {
                EasyLoading.dismiss();
                CustomPopupBottom.showModalBottom(
                  context,
                  CustomPopupMessage(
                    message: error,
                    onTap: () {
                      Navigations.pushAndRemoveNavigation(
                        context,
                        const LoginPage(),
                      );
                    },
                  ),
                );
              },
            );
          },
          child: const Column(
            children: [
              SizedBox(height: 42),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: HomeAppbarWidget(),
              ),
              SizedBox(height: 32),
              Expanded(
                child: ReportPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
