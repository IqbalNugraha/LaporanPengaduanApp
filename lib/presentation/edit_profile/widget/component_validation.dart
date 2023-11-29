import 'package:flutter/material.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';

class ComponentValidation extends StatefulWidget {
  const ComponentValidation({super.key});

  @override
  State<ComponentValidation> createState() => _ComponentValidationState();
}

class _ComponentValidationState extends State<ComponentValidation> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FontPoppins(
            text: Variables.msgRemovePhoto,
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
              CustomButton(
                height: 35,
                width: 100,
                btnColor: MyColors.brandColor,
                function: () {},
                widget: const FontPoppins(
                  text: Variables.btnYes,
                  size: 14,
                  fontWeight: FontWeight.w800,
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
