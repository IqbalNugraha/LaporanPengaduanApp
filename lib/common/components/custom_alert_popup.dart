import 'package:flutter/material.dart';

class CustomAlertPopup {
  static void showAlertPopup(BuildContext context, Widget widget) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.transparent,
        alignment: Alignment.center,
        content: SizedBox(
          height: 400,
          width: 250,
          child: widget,
        ),
      ),
    );
  }
}
