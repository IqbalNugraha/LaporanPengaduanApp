import 'package:flutter/material.dart';
import 'package:skripsi_project/common/components/custom_button.dart';
import 'package:skripsi_project/common/components/custom_container.dart';
import 'package:skripsi_project/common/components/custom_font.dart';

import '../constans/colors.dart';
import '../constans/variables.dart';

class CustomPopupMessage extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  const CustomPopupMessage({
    super.key,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: CustomContainer(
        height: 150,
        padding: const EdgeInsets.all(16),
        bgColor: MyColors.white,
        widget: Column(
          children: [
            FontPoppins(
              text: message,
              size: 15,
              fontWeight: FontWeight.w500,
              color: MyColors.blackFont,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CustomButton(
              function: onTap,
              widget: const FontPoppins(
                text: Variables.btnOkay,
                size: 14,
                fontWeight: FontWeight.w500,
                color: MyColors.white,
                alignment: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
