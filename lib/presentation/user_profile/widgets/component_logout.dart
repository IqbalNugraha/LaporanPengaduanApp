import 'package:flutter/material.dart';
import 'package:skripsi_project/data/datasources/local_datasources.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import '../../auth/login_page.dart';

class ComponentLogout extends StatelessWidget {
  const ComponentLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FontPoppins(
            text: Variables.msgLogout,
            size: 14,
            fontWeight: FontWeight.w500,
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
                  fontWeight: FontWeight.w600,
                  color: MyColors.white,
                  alignment: TextAlign.center,
                ),
              ),
              CustomButton(
                height: 35,
                width: 100,
                btnColor: MyColors.brandColor,
                function: () {
                  LocalDatasource().removeAuthData();
                  Navigations.pushAndRemoveNavigation(
                    context,
                    const LoginPage(),
                  );
                },
                widget: const FontPoppins(
                  text: Variables.btnYes,
                  size: 14,
                  fontWeight: FontWeight.w600,
                  color: MyColors.white,
                  alignment: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
