import 'package:flutter/material.dart';

import '../constans/colors.dart';

class CustomPopupBottom {
  static void showModalBottom(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      backgroundColor: MyColors.white,
      isScrollControlled: true,
      builder: (context) {
        return widget;
      },
    );
  }
}
